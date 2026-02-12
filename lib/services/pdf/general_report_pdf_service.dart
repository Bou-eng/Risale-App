import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
import '../../data/db/app_database.dart';
import 'package:intl/intl.dart';
import 'pdf_labels.dart';

/// Represents a student section in the general report
class StudentSection {
  final Student student;
  final List<LessonEntry> entries; // Entries for this student

  StudentSection({required this.student, required this.entries});
}

/// Represents a row in the daily lessons history table
class DayLessonRow {
  final String date;
  final int lessonIndex;
  final String text;

  DayLessonRow({
    required this.date,
    required this.lessonIndex,
    required this.text,
  });
}

class GeneralReportPdfService {
  /// Export general report as PDF containing students + day lessons history
  static Future<void> exportGeneralReportPdf({
    required School school,
    required DateTime endDate,
    required String teacherName,
    required String className,
    required List<StudentSection> studentSections,
    required List<DayLessonRow> dayLessonRows,
    required Locale locale,
    required PdfLabels labels,
  }) async {
    // Load fonts
    final arabicFont = await rootBundle.load(
      'assets/fonts/NotoNaskhArabic-Regular.ttf',
    );
    final latinFont = await rootBundle.load(
      'assets/fonts/NotoSans-Regular.ttf',
    );

    final arabicPwFont = pw.Font.ttf(arabicFont);
    final latinPwFont = pw.Font.ttf(latinFont);

    final isRtl = locale.languageCode == 'ar';
    final baseFont = isRtl ? arabicPwFont : latinPwFont;

    final pdf = pw.Document();

    final localeTag = locale.toLanguageTag();
    final dateFormat = DateFormat.yMd(localeTag);

    String formatDate(String dateStr) {
      try {
        final date = DateTime.parse(dateStr);
        return dateFormat.format(date);
      } catch (_) {
        return dateStr;
      }
    }

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(20),
        build: (context) => [
          pw.Directionality(
            textDirection: isRtl ? pw.TextDirection.rtl : pw.TextDirection.ltr,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // Title
                pw.Text(
                  labels.generalReportTitle,
                  style: pw.TextStyle(
                    fontSize: 20,
                    fontWeight: pw.FontWeight.bold,
                    font: baseFont,
                  ),
                ),
                pw.SizedBox(height: 16),

                // Report metadata
                pw.Container(
                  padding: const pw.EdgeInsets.all(12),
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(color: PdfColors.grey400),
                    borderRadius: const pw.BorderRadius.all(
                      pw.Radius.circular(4),
                    ),
                  ),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      _buildInfoRow(
                        '${labels.reportDate}:',
                        dateFormat.format(DateTime.now()),
                        baseFont,
                      ),
                      _buildInfoRow(
                        '${labels.schoolName}:',
                        school.name,
                        baseFont,
                      ),
                      _buildInfoRow(
                        '${labels.teacherName}:',
                        teacherName,
                        baseFont,
                      ),
                      _buildInfoRow(
                        '${labels.className}:',
                        className,
                        baseFont,
                      ),
                      _buildInfoRow(
                        '${labels.upTo}:',
                        dateFormat.format(endDate),
                        baseFont,
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(height: 24),

                // Students sections
                ..._buildStudentSections(
                  studentSections,
                  labels,
                  baseFont,
                  isRtl,
                  formatDate,
                ),

                pw.SizedBox(height: 24),

                // Daily lessons history section
                pw.Text(
                  labels.dailyLessonsHistoryTitle,
                  style: pw.TextStyle(
                    fontSize: 16,
                    fontWeight: pw.FontWeight.bold,
                    font: baseFont,
                  ),
                ),
                pw.SizedBox(height: 12),
                if (dayLessonRows.isEmpty)
                  pw.Text(
                    labels.noLessonsFound,
                    style: pw.TextStyle(font: baseFont, fontSize: 10),
                  )
                else
                  pw.TableHelper.fromTextArray(
                    context: context,
                    headers: [
                      labels.colDate,
                      labels.colLessonNumber,
                      labels.colLessonTaught,
                    ],
                    cellAlignment: isRtl
                        ? pw.Alignment.centerRight
                        : pw.Alignment.centerLeft,
                    headerAlignment: isRtl
                        ? pw.Alignment.centerRight
                        : pw.Alignment.centerLeft,
                    headerStyle: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 10,
                      font: baseFont,
                    ),
                    cellStyle: pw.TextStyle(fontSize: 9, font: baseFont),
                    data: dayLessonRows.map((row) {
                      return [
                        formatDate(row.date),
                        '${row.lessonIndex}',
                        row.text.length > 40
                            ? row.text.substring(0, 40)
                            : row.text,
                      ];
                    }).toList(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );

    // Save to documents directory
    final dir = await getApplicationDocumentsDirectory();
    final fileName =
        'general_report_${school.id}_${DateFormat('yyyy-MM-dd').format(DateTime.now())}.pdf';
    final file = File(p.join(dir.path, fileName));

    await file.writeAsBytes(await pdf.save());

    // Share the PDF
    await Printing.sharePdf(bytes: await pdf.save(), filename: fileName);
  }

  static pw.Widget _buildInfoRow(String label, String value, pw.Font font) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 4),
      child: pw.Row(
        children: [
          pw.Expanded(
            flex: 2,
            child: pw.Text(
              label,
              style: pw.TextStyle(font: font, fontSize: 10),
            ),
          ),
          pw.Expanded(
            flex: 3,
            child: pw.Text(
              value,
              style: pw.TextStyle(font: font, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }

  /// Build student sections for PDF
  static List<pw.Widget> _buildStudentSections(
    List<StudentSection> sections,
    PdfLabels labels,
    pw.Font baseFont,
    bool isRtl,
    String Function(String) formatDate,
  ) {
    final widgets = <pw.Widget>[];

    for (final section in sections) {
      widgets.add(
        pw.Container(
          padding: const pw.EdgeInsets.all(10),
          margin: const pw.EdgeInsets.only(bottom: 16),
          decoration: pw.BoxDecoration(
            border: pw.Border.all(color: PdfColors.grey400),
            borderRadius: const pw.BorderRadius.all(pw.Radius.circular(4)),
          ),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Student name
              pw.Text(
                '${labels.studentName}: ${section.student.firstName} ${section.student.lastName}',
                style: pw.TextStyle(
                  fontSize: 12,
                  fontWeight: pw.FontWeight.bold,
                  font: baseFont,
                ),
              ),
              pw.SizedBox(height: 10),

              // Entries table
              if (section.entries.isEmpty)
                pw.Text(
                  labels.noLessonsFound,
                  style: pw.TextStyle(font: baseFont, fontSize: 10),
                )
              else
                pw.TableHelper.fromTextArray(
                  headers: [
                    labels.colDate,
                    labels.colPageLearned,
                    labels.colPassed,
                    labels.colNote,
                  ],
                  cellAlignment: isRtl
                      ? pw.Alignment.centerRight
                      : pw.Alignment.centerLeft,
                  headerAlignment: isRtl
                      ? pw.Alignment.centerRight
                      : pw.Alignment.centerLeft,
                  headerStyle: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 9,
                    font: baseFont,
                  ),
                  cellStyle: pw.TextStyle(fontSize: 8, font: baseFont),
                  data: section.entries.map((entry) {
                    final passed = entry.isPassed ? labels.yes : labels.no;
                    final note =
                        (entry.notes != null && entry.notes!.isNotEmpty)
                        ? (entry.notes!.length > 20
                              ? entry.notes!.substring(0, 20)
                              : entry.notes!)
                        : labels.none;

                    return [
                      formatDate(entry.date),
                      entry.pageStudied.length > 15
                          ? entry.pageStudied.substring(0, 15)
                          : entry.pageStudied,
                      passed,
                      note,
                    ];
                  }).toList(),
                ),
            ],
          ),
        ),
      );
    }

    return widgets;
  }
}

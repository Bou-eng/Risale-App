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

class StudentReportPdfService {
  static Future<void> generateAndSharePdf({
    required Student student,
    required String schoolName,
    required String teacherName,
    required String className,
    required List<LessonEntry> entries,
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
                  labels.studentReportTitle,
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
                        schoolName,
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
                        '${labels.studentName}:',
                        '${student.firstName} ${student.lastName}',
                        baseFont,
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(height: 20),

                // Entries table
                pw.Text(
                  labels.entriesTableTitle,
                  style: pw.TextStyle(
                    fontSize: 14,
                    fontWeight: pw.FontWeight.bold,
                    font: baseFont,
                  ),
                ),
                pw.SizedBox(height: 10),

                if (entries.isEmpty)
                  pw.Text(
                    labels.noLessonsFound,
                    style: pw.TextStyle(font: baseFont, fontSize: 10),
                  )
                else
                  pw.TableHelper.fromTextArray(
                    context: context,
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
                      fontSize: 10,
                      font: baseFont,
                    ),
                    cellStyle: pw.TextStyle(fontSize: 9, font: baseFont),
                    data: entries.map((entry) {
                      final passed = entry.isPassed ? labels.yes : labels.no;
                      final note =
                          (entry.notes != null && entry.notes!.isNotEmpty)
                          ? (entry.notes!.length > 30
                                ? entry.notes!.substring(0, 30)
                                : entry.notes!)
                          : labels.none;

                      return [
                        formatDate(entry.date),
                        entry.pageStudied.length > 20
                            ? entry.pageStudied.substring(0, 20)
                            : entry.pageStudied,
                        passed,
                        note,
                      ];
                    }).toList(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );

    // Save and share
    final dir = await getApplicationDocumentsDirectory();
    final fileName =
        'student_report_${student.id}_${DateFormat('yyyy-MM-dd').format(DateTime.now())}.pdf';
    final file = File(p.join(dir.path, fileName));

    await file.writeAsBytes(await pdf.save());
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
}

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
import '../../data/db/app_database.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'pdf_header.dart';

/// Represents a student section in the general report
class StudentSection {
  final Student student;
  final int totalEntries;
  final int passedCount;
  final int repeatCount;
  final int goodAttitudeCount;
  final int mediumAttitudeCount;
  final int badAttitudeCount;
  final int totalPointsDelta;
  final List<LessonEntry> entries; // Last 100 entries max

  StudentSection({
    required this.student,
    required this.totalEntries,
    required this.passedCount,
    required this.repeatCount,
    required this.goodAttitudeCount,
    required this.mediumAttitudeCount,
    required this.badAttitudeCount,
    required this.totalPointsDelta,
    required this.entries,
  });
}

/// Represents a row in the daily lessons history table
class DayLessonRow {
  final DateTime date;
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
    Locale? locale,
  }) async {
    final pdf = pw.Document();

    final dateFormat = DateFormat('yyyy-MM-dd');

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(20),
        build: (context) => [
          buildReportHeader(
            title: 'General Monthly Report',
            date: endDate,
            schoolName: school.name,
            teacherName: teacherName,
            className: className,
            locale: locale,
          ),
          pw.SizedBox(height: 16),

          // Students section
          pw.Text(
            'Students',
            style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 12),
          ..._buildStudentSections(studentSections),

          pw.SizedBox(height: 24),

          // Daily lessons history section
          pw.Text(
            'Daily Lessons Report History',
            style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 12),
          if (dayLessonRows.isEmpty)
            pw.Text('No lessons found')
          else
            pw.TableHelper.fromTextArray(
              headers: ['Date', 'Lesson #', 'Lesson Taught'],
              cellAlignment: pw.Alignment.centerLeft,
              headerStyle: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
                fontSize: 10,
              ),
              cellStyle: const pw.TextStyle(fontSize: 9),
              data: dayLessonRows.map((row) {
                return [
                  dateFormat.format(row.date),
                  '${row.lessonIndex}',
                  row.text.length > 30 ? row.text.substring(0, 30) : row.text,
                ];
              }).toList(),
            ),
        ],
      ),
    );

    // Save to documents directory
    final dir = await getApplicationDocumentsDirectory();
    final fileName =
        'general_report_${school.id}_${dateFormat.format(DateTime.now())}.pdf';
    final file = File(p.join(dir.path, fileName));

    await file.writeAsBytes(await pdf.save());

    // Share the PDF
    await Printing.sharePdf(bytes: await pdf.save(), filename: fileName);
  }

  /// Build student sections for PDF
  static List<pw.Widget> _buildStudentSections(List<StudentSection> sections) {
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
              // Student info
              pw.Text(
                'Student: ${section.student.firstName} ${section.student.lastName}',
                style: pw.TextStyle(
                  fontSize: 12,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 6),
              if (section.student.level != null)
                pw.Text(
                  'Level: ${section.student.level}',
                  style: const pw.TextStyle(fontSize: 10),
                ),
              pw.Text(
                'Points: ${section.student.currentPoints}',
                style: const pw.TextStyle(fontSize: 10),
              ),
              pw.SizedBox(height: 6),

              // Stats
              pw.Text(
                'Stats:',
                style: pw.TextStyle(
                  fontSize: 10,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                'Total Entries: ${section.totalEntries} | Passed: ${section.passedCount} | Repeat: ${section.repeatCount}',
                style: const pw.TextStyle(fontSize: 9),
              ),
              pw.Text(
                'Attitudes - Good: ${section.goodAttitudeCount} | Medium: ${section.mediumAttitudeCount} | Bad: ${section.badAttitudeCount}',
                style: const pw.TextStyle(fontSize: 9),
              ),
              pw.Text(
                'Points Delta: ${section.totalPointsDelta}',
                style: const pw.TextStyle(fontSize: 9),
              ),
              pw.SizedBox(height: 8),

              // Entries table (if any)
              if (section.entries.isNotEmpty)
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Recent Entries (max 100):',
                      style: pw.TextStyle(
                        fontSize: 10,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.SizedBox(height: 4),
                    pw.TableHelper.fromTextArray(
                      headers: ['Date', 'Pages', 'P/R', 'Att', 'Pts', 'Notes'],
                      cellAlignment: pw.Alignment.centerLeft,
                      headerStyle: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 8,
                      ),
                      cellStyle: const pw.TextStyle(fontSize: 8),
                      data: section.entries.map((entry) {
                        final passRepeat = entry.isPassed ? 'P' : 'R';
                        final attitude = entry.attitude == 0
                            ? 'G'
                            : entry.attitude == 1
                            ? 'M'
                            : 'B';
                        return [
                          entry.date,
                          entry.pageStudied.length > 8
                              ? entry.pageStudied.substring(0, 8)
                              : entry.pageStudied,
                          passRepeat,
                          attitude,
                          '${entry.pointsDelta}',
                          entry.notes != null && entry.notes!.isNotEmpty
                              ? entry.notes!.substring(0, 8)
                              : '',
                        ];
                      }).toList(),
                    ),
                  ],
                ),
            ],
          ),
        ),
      );
    }

    return widgets;
  }

  /// Parse lessons from report content JSON safely
  static List<String> parseLessons(String content, int lessonCount) {
    try {
      if (content.isEmpty) {
        return List.filled(lessonCount, '');
      }

      final json = jsonDecode(content);
      if (json is Map && json.containsKey('lessons')) {
        final lessons = json['lessons'] as List?;
        if (lessons != null) {
          final result = lessons.map((e) => e.toString()).toList();

          // Pad with empty strings if needed
          while (result.length < lessonCount) {
            result.add('');
          }

          // Truncate if too long
          if (result.length > lessonCount) {
            result.removeRange(lessonCount, result.length);
          }

          return result;
        }
      }
    } catch (_) {
      // If parsing fails, return empty list
    }

    return List.filled(lessonCount, '');
  }
}

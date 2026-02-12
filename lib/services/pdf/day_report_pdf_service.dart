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

class DayReportPdfService {
  /// Export day report as PDF
  static Future<void> exportDayReportPdf({
    required School school,
    required DateTime date,
    required String teacherName,
    required String className,
    required String reportContent,
    required int expectedLessonCount,
    Locale? locale,
  }) async {
    final lessons = _parseLessons(reportContent, expectedLessonCount);

    final pdf = pw.Document();

    final dateFormat = DateFormat('yyyy-MM-dd');

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(20),
        build: (context) => [
          buildReportHeader(
            title: 'Day Lessons Report',
            date: date,
            schoolName: school.name,
            teacherName: teacherName,
            className: className,
            locale: locale,
          ),
          pw.SizedBox(height: 16),

          // Lessons table
          pw.Text(
            'Lessons',
            style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 8),
          if (lessons.isEmpty)
            pw.Text('No lessons found')
          else
            pw.TableHelper.fromTextArray(
              headers: ['Lesson #', 'Lesson Taught'],
              cellAlignment: pw.Alignment.centerLeft,
              headerStyle: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
                fontSize: 11,
              ),
              cellStyle: const pw.TextStyle(fontSize: 10),
              data: List.generate(lessons.length, (index) {
                return ['${index + 1}', lessons[index]];
              }),
            ),
        ],
      ),
    );

    // Save to documents directory
    final dir = await getApplicationDocumentsDirectory();
    final fileName =
        'day_report_${school.id}_${dateFormat.format(DateTime.now())}.pdf';
    final file = File(p.join(dir.path, fileName));

    await file.writeAsBytes(await pdf.save());

    // Share the PDF
    await Printing.sharePdf(bytes: await pdf.save(), filename: fileName);
  }

  /// Parse lessons from report content JSON safely
  static List<String> _parseLessons(String content, int expectedCount) {
    try {
      if (content.isEmpty) {
        return List.filled(expectedCount, '');
      }

      final json = jsonDecode(content);
      if (json is Map && json.containsKey('lessons')) {
        final lessons = json['lessons'] as List?;
        if (lessons != null) {
          final result = lessons.map((e) => e.toString()).toList();

          // Pad with empty strings if needed
          while (result.length < expectedCount) {
            result.add('');
          }

          // Truncate if too long
          if (result.length > expectedCount) {
            result.removeRange(expectedCount, result.length);
          }

          return result;
        }
      }
    } catch (_) {
      // If parsing fails, return empty list
    }

    return List.filled(expectedCount, '');
  }
}

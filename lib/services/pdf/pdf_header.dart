import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:intl/intl.dart';

/// Build a localized PDF report header with RTL support for Arabic
/// Pass the current locale to automatically handle text direction
pw.Widget buildReportHeader({
  required String title,
  required DateTime date,
  required String schoolName,
  required String teacherName,
  required String className,
  String? studentName,
  Locale? locale,
}) {
  final isArabic = locale?.languageCode == 'ar';
  final dateStr = DateFormat('yyyy-MM-dd').format(date);

  final rows = <List<String>>[
    ['Date', dateStr],
    ['School', schoolName],
    ['Teacher', teacherName],
    ['Class', className],
    if (studentName != null && studentName.trim().isNotEmpty)
      ['Student', studentName],
  ];

  // Build the table content
  final tableWidget = pw.Table(
    columnWidths: const {0: pw.IntrinsicColumnWidth(), 1: pw.FlexColumnWidth()},
    children: rows
        .map(
          (row) => pw.TableRow(
            children: [
              pw.Padding(
                padding: const pw.EdgeInsets.only(bottom: 4, right: 8),
                child: pw.Text(
                  '${row[0]}:',
                  style: pw.TextStyle(
                    fontSize: 10,
                    fontWeight: pw.FontWeight.bold,
                  ),
                  textDirection: isArabic
                      ? pw.TextDirection.rtl
                      : pw.TextDirection.ltr,
                ),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.only(bottom: 4),
                child: pw.Text(
                  row[1],
                  style: const pw.TextStyle(fontSize: 10),
                  textDirection: isArabic
                      ? pw.TextDirection.rtl
                      : pw.TextDirection.ltr,
                ),
              ),
            ],
          ),
        )
        .toList(),
  );

  // If Arabic (RTL), wrap in Directionality widget
  final headerContent = isArabic
      ? pw.Directionality(
          textDirection: pw.TextDirection.rtl,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            children: [
              pw.Text(
                title,
                style: pw.TextStyle(
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 12),
              pw.Container(
                padding: const pw.EdgeInsets.all(10),
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.grey400),
                  borderRadius: const pw.BorderRadius.all(
                    pw.Radius.circular(4),
                  ),
                ),
                child: tableWidget,
              ),
            ],
          ),
        )
      : pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              title,
              style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 12),
            pw.Container(
              padding: const pw.EdgeInsets.all(10),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: PdfColors.grey400),
                borderRadius: const pw.BorderRadius.all(pw.Radius.circular(4)),
              ),
              child: tableWidget,
            ),
          ],
        );

  return headerContent;
}

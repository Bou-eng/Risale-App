/// Date utility functions for consistent date handling across the app
class DateUtils {
  /// Normalize a DateTime to midnight (yyyy-mm-dd)
  static DateTime normalizeToDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  /// Convert DateTime to ISO date string (yyyy-mm-dd)
  static String toIsoDate(DateTime date) {
    final normalized = normalizeToDay(date);
    return normalized.toIso8601String().split('T').first;
  }

  /// Parse ISO date string (yyyy-mm-dd) to DateTime at midnight
  static DateTime fromIsoDate(String isoDate) {
    return DateTime.parse(isoDate);
  }

  /// Get today's date normalized to midnight
  static DateTime today() {
    return normalizeToDay(DateTime.now());
  }

  /// Get today's date as ISO string
  static String todayIso() {
    return toIsoDate(DateTime.now());
  }
}

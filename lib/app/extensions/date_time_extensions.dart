import 'package:intl/intl.dart';
import 'package:unipool/app/extensions/l10.dart';

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime? other) {
    return other == null ? false : year == other.year && month == other.month && day == other.day;
  }

  bool isAfterOnlyDate(DateTime other) {
    final thisDate = copyWith(year: year, month: month, day: day);
    final otherDate = copyWith(year: other.year, month: other.month, day: other.day);
    return thisDate.isAfter(otherDate);
  }

  int compareToOnlyDate(DateTime other) {
    final thisDate = copyWith(year: year, month: month, day: day);
    final otherDate = copyWith(year: other.year, month: other.month, day: other.day);
    return thisDate.compareTo(otherDate);
  }

  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }

  // create a extensin that check if its today and return only hour and minutes or if its any other date return date only
  String formattedDateTimeForChatListItem() {
    final now = DateTime.now();
    if (isSameDate(now)) {
      return '${twoDigits(hour)}:${twoDigits(minute)}';
    }
    return '${twoDigits(day)}.${twoDigits(month)}.$year';
  }

  String formattedDateTimeWithoutTimeZone() {
    return '${twoDigits(day)}.${twoDigits(month)}.$year '
        '${twoDigits(hour)}:${twoDigits(minute)}';
  }

  String formattedDateTime() {
    return '${twoDigits(day)}.${twoDigits(month)}.$year';
  }

  String twoDigits(int n) {
    if (n >= 10) {
      return '$n';
    }
    return '0$n';
  }

  String formatAccordingToDifference() {
    final now = DateTime.now();
    final difference = now.difference(this).abs();

    if (difference.inDays <= 7) {
      // Return date in the format like "12 Eylül Perşembe"
      return _formatWithTurkishNames();
    } else {
      // Else format as dd/MM/yy
      return DateFormat("dd/MM/yy").format(this);
    }
  }

  String formatAccordingToDifferenceWithHour() {
    final now = DateTime.now();
    final difference = now.difference(this).abs();

    if (difference.inDays <= 7) {
      // Return date in the format like "12 Eylül Perşembe"
      return formatWithTurkishNamesForChat();
    } else {
      // Else format as dd/MM/yy
      return DateFormat("dd/MM/yy").format(this);
    }
  }

  // Helper function to format date in the "12 Eylül Perşembe" format
  String _formatWithTurkishNames() {
    final day = this.day.toString();
    final month = _getMonthName(this.month);
    final weekday = _getWeekdayName(this.weekday);

    return "$day $month $weekday";
  }

  String formatWithTurkishNamesForChat() {
    final day = this.day.toString();
    final month = _getMonthName(this.month);
    final weekday = _getWeekdayName(this.weekday);

    return "$day $month ${weekday.substring(0, 3)}, ${twoDigits(hour)}:${twoDigits(minute)}";
  }

  String formatForTripItem() {
    final day = twoDigits(this.day);
    final month = _getMonthName(this.month).substring(0, 3);
    return "$day $month $year, ${twoDigits(hour)}:${twoDigits(minute)}";
  }

  // Get the Turkish name for the month
  String _getMonthName(int month) {
    final months = [
      l10n.january,
      l10n.february,
      l10n.march,
      l10n.april,
      l10n.may,
      l10n.june,
      l10n.july,
      l10n.august,
      l10n.september,
      l10n.october,
      l10n.november,
      l10n.december,
    ];
    return months[month - 1];
  }

  // Get the Turkish name for the weekday
  String _getWeekdayName(int weekday) {
    final weekdays = [
      l10n.monday,
      l10n.tuesday,
      l10n.wednesday,
      l10n.thursday,
      l10n.friday,
      l10n.saturday,
      l10n.sunday,
    ];
    return weekdays[weekday - 1];
  }
}

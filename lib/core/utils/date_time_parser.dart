import 'package:intl/intl.dart';

class DateTimeParser {
  static String formatDate(String dateTimeStr) {
    try {
      DateTime dateTime = DateTime.parse(dateTimeStr);
      return DateFormat("dd MMM yyyy").format(dateTime);
    } catch (e) {
      return "Invalid date";
    }
  }
}

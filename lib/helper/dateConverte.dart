import 'package:intl/intl.dart';

String convertDateFromString(String strDate) {
  DateTime date = DateTime.parse(strDate);
  // var suffix = "th";
  // var digit = date.day % 10;
  // if ((digit > 0 && digit < 4) && (date.day < 11 || date.day > 13)) {
  //   suffix = ["st", "nd", "rd"][digit - 1];
  // }
  String formattedDate = DateFormat('d - MMM - y').format(date);
  return formattedDate;
}

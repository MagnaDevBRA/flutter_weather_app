import 'package:intl/intl.dart';

String formateDate (String dateString, {bool complete = false}) {
  final parts = dateString.split('-');
  return complete ? '${parts[2]}/${parts[1]}/${parts[0]}' : '${parts[2]}/${parts[1]}';
}

String formateWeekday (String dateString) {
  final dateObject = DateTime.parse(dateString);
  final formatter = DateFormat('EEEE', 'pt_BR');
  final weekday = formatter.format(dateObject);

  return '${weekday[0].toUpperCase()}${weekday.substring(1)}';
}
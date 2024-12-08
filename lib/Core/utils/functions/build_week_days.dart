import 'package:intl/intl.dart';
import 'package:todo/Features/home/data/models/day_model.dart';

List<DayModel> buildWeekDays() {
  List<DayModel> days = [];
  for (int i = 0; i < 7; i++) {
    DateTime currentDay = DateTime.now().add(Duration(days: i));
    days.add(
      DayModel(
        day: DateFormat('E').format(currentDay),
        date: DateFormat('d').format(currentDay),
      ),
    );
  }
  return days;
}

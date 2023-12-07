import 'package:flutter/material.dart';
import 'package:planner_app/ui/resources/colors.dart';
import 'package:planner_app/ui/theme/app_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  double _getContainerHeight(CalendarFormat format) {
    if (format == CalendarFormat.week) {
      return 150;
    } else if (format == CalendarFormat.twoWeeks) {
      return 200;
    } else {
      return 400;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 226, 226),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 229, 226, 226),
        title: const Text('Календарь'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.start,
          //    mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              width: 400,
              height: _getContainerHeight(format),
              child: TableCalendar(
                focusedDay: selectedDay,
                firstDay: DateTime(1890),
                lastDay: DateTime(3050),
                headerVisible: true,
                shouldFillViewport: false,
                sixWeekMonthsEnforced: true,
                calendarFormat: format,
                onFormatChanged: (CalendarFormat _format) {
                  setState(() {
                    format = _format;
                  });
                },
                startingDayOfWeek: StartingDayOfWeek.sunday,
                daysOfWeekVisible: true,
                onDaySelected: (DateTime selectDay, DateTime focusDay) {
                  setState(() {});
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                  print(focusedDay);
                },
                selectedDayPredicate: (DateTime date) {
                  return isSameDay(selectedDay, date);
                },
                eventLoader: _getEventsfromDay,
                calendarStyle: CalendarStyle(
                  isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  selectedTextStyle: const TextStyle(color: Colors.white),
                  todayDecoration: BoxDecoration(
                    color: Colors.purpleAccent,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  defaultDecoration: BoxDecoration(
                    //color: Colors.blue,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  weekendDecoration: BoxDecoration(
                    //color: Colors.blue,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: true,
                  titleCentered: true,
                  formatButtonShowsNext: false,
                  formatButtonDecoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  formatButtonTextStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  //leftChevronVisible: false,
                  //rightChevronVisible: false,
                  // headerPadding: const EdgeInsets.symmetric(
                  //   horizontal: 5.0,
                  //   vertical: 10.0,
                  // ),

                  titleTextStyle: const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text('Список дел на ${focusedDay.toLocal()}',
                textAlign: TextAlign.center, style: AppFonts.w700s25),
            const SizedBox(height: 20),
            const Text(
              'Для удаления задачи свайпайте влево, для редактирования - вправо!',
              style: AppFonts.w400s18,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsApp.mainColor,
        onPressed: () {},
        child: const Icon(Icons.access_alarm_outlined),
      ),
    );
  }
}

class Event {
  final String title;
  Event({required this.title});

  @override
  String toString() => title;
}

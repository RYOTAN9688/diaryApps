import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  createState() => CalendarWidgetState();
}

class CalendarWidgetState extends State<CalendarWidget> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: TableCalendar(
        weekendDays: const [DateTime.saturday, DateTime.sunday],
        locale: 'ja_JP',
        headerStyle: HeaderStyle(
          formatButtonVisible: false, // 月の切り替えボタンを非表示にする
          titleCentered: true,
          formatButtonShowsNext: false,
          formatButtonDecoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20.0),
          ),
          formatButtonTextStyle: const TextStyle(color: Colors.white),
          titleTextStyle: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          leftChevronIcon: const Icon(Icons.chevron_left, color: Colors.black),
          rightChevronIcon: const Icon(Icons.chevron_right, color: Colors.black),
        ),
        calendarBuilders: CalendarBuilders(dowBuilder: (context, day) {
          if (day.weekday == DateTime.saturday) {
            return const Center(child: Text('土', style: TextStyle(color: Colors.blue)));
          } else if (day.weekday == DateTime.sunday) {
            return const Center(child: Text('日', style: TextStyle(color: Colors.red)));
          }
          return null;
        }),
        calendarFormat: _calendarFormat,
        focusedDay: _focusedDay,
        firstDay: DateTime(2000),
        lastDay: DateTime(2100),
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
      ),
    );
  }
}

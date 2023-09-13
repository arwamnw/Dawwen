// ignore_for_file: prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

void singoutuser() {
  FirebaseAuth.instance.signOut();
}

class _CalendarState extends State<Calendar> {
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(2023, 2, 1),
    end: DateTime(2023, 3, 1),
  );

  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Color.fromARGB(255, 152, 173, 196),
        actions: [IconButton(onPressed: singoutuser, icon: Icon(Icons.logout))],
      ),
      body: Stack(children: [
        SafeArea(
          child: TableCalendar(
            firstDay: DateTime.utc(2010, 10, 20),
            lastDay: DateTime.utc(2040, 10, 20),
            focusedDay: DateTime.now(),
            headerVisible: true,
            daysOfWeekVisible: true,
            sixWeekMonthsEnforced: true,
            headerStyle: HeaderStyle(
                titleTextStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold)),
            calendarStyle: CalendarStyle(
                todayTextStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        Container(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'اختر التاريخ',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: ElevatedButton(
                        child: Text(DateFormat('yyyy/mm/dd').format(start)),
                        onPressed: PickDateRange,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 152, 173, 196)),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const SizedBox(height: 20),
                  ),
                  Expanded(
                    child: ElevatedButton(
                        child: Text(DateFormat('yyyy/mm/dd').format(start)),
                        onPressed: PickDateRange,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 152, 173, 196)),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ]),
    );
  }

  Future PickDateRange() async {
    DateTimeRange? newDaterange = await showDateRangePicker(
        context: context,
        initialDateRange: dateRange,
        firstDate: DateTime(2010),
        lastDate: DateTime(2040));

    if (newDaterange == null) return;

    setState(() => dateRange = newDaterange);
  }
}

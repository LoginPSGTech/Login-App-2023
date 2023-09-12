import 'package:flutter/material.dart';
import 'package:login/models/day_schedule_model.dart';
import 'package:login/providers/app_data_provider.dart';
import 'package:login/widgets/title_bar_widget.dart';
import 'package:provider/provider.dart';

class SchedulePage extends StatefulWidget {
  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  int buttonvalue = 0;
  late List<Schedule> schedule;
  late Color state23;
  late Color state24;

  List<Widget> buildScheduleEvents(List<EventSchedule> eventsSchedule) {
    List<Widget> widgets = [];
    for (var index = 0; index < eventsSchedule.length; index++) {
      widgets.add(
        Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      eventsSchedule[index].eventName,
                      style: const TextStyle(
                        color: Color(0xFFFEB139),
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        const Icon(size: 16, Icons.place, color: Colors.white70),
                        Container(
                          margin: const EdgeInsets.only(left: 4),
                          child: Text(
                            eventsSchedule[index].venue,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        const Icon(
                          size: 14,
                          Icons.watch_later_rounded,
                          color: Colors.white70,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 4),
                          child: Text(
                            'Ends by ${eventsSchedule[index].endTime}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              index != eventsSchedule.length - 1
                  ? const Divider(
                      color: Colors.white,
                      thickness: 0.3,
                    )
                  : Container(),
            ],
          ),
        ),
      );
    }
    return widgets;
  }

  List<Widget> buildSchedule() {
    List<Widget> widgets = [];
    for (var index = 0; index < schedule.length; index++) {
      // Split the time string into hours and minutes
      List<String> timeParts = schedule[index].startTime.split(' ');
      String time = timeParts[0];
      String amPm = timeParts[1];
      List<String> timeComponents = time.split(':');
      String hours = timeComponents[0];
      String minutes = timeComponents[1];

      widgets.add(Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        margin: const EdgeInsets.fromLTRB(24, 16, 24, 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xFF123E6B),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      hours,
                      style: const TextStyle(
                        color: Color(0xFFF55353),
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    minutes,
                    style: const TextStyle(
                      color: Color(0xFFF55353),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    amPm,
                    style: const TextStyle(
                      color: Color(0xFFF55353),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: buildScheduleEvents(schedule[index].events),
              ),
            )
          ],
        ),
      ));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final day1Schedule = Provider.of<AppDataProvider>(context).appData.day1Schedule;
    final day2Schedule = Provider.of<AppDataProvider>(context).appData.day2Schedule;
    switch (buttonvalue) {
      case 0:
        schedule = day1Schedule.schedule;
        state23 = const Color(0xFF123E6B);
        state24 = const Color(0xFF121F2C);
        break;
      case 1:
        schedule = day2Schedule.schedule;
        state23 = const Color(0xFF121F2C);
        state24 = const Color(0xFF123E6B);
        break;
    }

    return SafeArea(
        child: Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const TitleBarWidget(title: "Schedule"),
          Container(
            margin: const EdgeInsets.only(right: 24),
            child: Row(children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (buttonvalue != 0) {
                      buttonvalue = 0;
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: state23,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)))),
                child: const Text(
                  "23rd",
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 12,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (buttonvalue != 1) {
                      buttonvalue = 1;
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: state24,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10))),
                ),
                child: const Text(
                  "24th",
                  style: TextStyle(color: Color(0xFF858585), fontSize: 12),
                ),
              ),
            ]),
          )
        ]),
        Expanded(
          child: SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: buildSchedule())),
        )
      ],
    ));
  }
}

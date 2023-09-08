import 'package:flutter/material.dart';
import 'package:login/widgets/title_bar_widget.dart';

class SchedulePage extends StatefulWidget {
  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final List<String> eventname23 = <String>[
    'Techiadz',
    'Thinklytics',
    'Inquizitives',
    'Triple Trouble',
    'Hero of Login',
    'AlgoCode',
    "Hack-in"
  ];

  final List<String> eventvenue23 = <String>[
    'F-Block',
    'M-Block',
    'A-Block',
    'K-Block',
    'H-Block',
    'J-Block',
    'K-Block'
  ];

  final List<String> timehrs23 = <String>["09", "09", "10", "10", "11", "11", "12"];

  final List<String> timemin23 = <String>["00", "30", "00", "30", "00", "30", "00"];

  final List<int> colorCodes23 = <int>[0xFF4A148C];

  final List<String> ampm23 = <String>[
    'AM',
    'AM',
    'AM',
    'AM',
    'AM',
    'AM',
    'PM'
  ];

  final List<String> eventname24 = <String>[
    'Hero of Login',
    'Inquizitives',
    'AlgoCode',
    'Triple Trouble',
    'Thinklytics',
    'Techiadz',
    "Hack-in"

  ];

  final List<String> eventvenue24 = <String>[
    'J-Block',
    'K-Block',
    'F-Block',
    'A-Block',
    'H-Block',
    'M-Block',
    'K-Block'
  ];

  final List<String> timehrs24 = <String>["09", "09", "10", "10", "11", "11", "12"];

  final List<String> timemin24 = <String>["00", "30", "00", "30", "00", "30", "00"];

  //final List<String> colorCodes24 = <String>[0xFF4A148C];
  final List<String> ampm24 = <String>[
    'AM',
    'AM',
    'AM',
    'AM',
    'AM',
    'AM',
    'PM'
  ];

  late var finallist;

  int buttonvalue = 0;

  late var state23;

  late var state24;

  List<Widget> buildSchedule() {
    List<Widget> widgets = [];
    for (var index = 0; index < finallist.length; index++) {
      widgets.add(Container(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        margin: const EdgeInsets.fromLTRB(24, 16, 24, 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xFF123E6B),
        ),
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          finallist[2][index],
                          style: const TextStyle(
                            color: Color(0xFFF55353),
                            fontSize: 56,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            finallist[3][index],
                            style: const TextStyle(
                              color: Color(0xFFF55353),
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            finallist[4][index],
                            style: const TextStyle(
                              color: Color(0xFFF55353),
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ]),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        finallist[0][index],
                        style: const TextStyle(
                          color: Color(0xFFFEB139),
                          fontSize: 24,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        size: 16,
                        Icons.place,
                        color: Color(0xFFFEB139),
                      ),
                      Text(
                        finallist[1][index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
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
    switch (buttonvalue) {
      case 0:
        finallist = [
          eventname23,
          eventvenue23,
          timehrs23,
          timemin23,
          ampm23,
        ];
        state23 = const Color(0xFF123E6B);
        state24 = const Color(0xFF121F2C);
        break;
      case 1:
        finallist = [
          eventname24,
          eventvenue24,
          timehrs24,
          timemin24,
          ampm24,
        ];
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
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)))),
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
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
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
            child:
                SingleChildScrollView(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: buildSchedule())),
          )
        ],
      )
    );
  }
}

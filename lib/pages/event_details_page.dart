import 'package:flutter/material.dart';
import 'package:login/widgets/gradient_background_widget.dart';
import 'package:login/widgets/title_bar_widget.dart';
import 'package:login/widgets/back_icon_widget.dart';
import 'package:login/widgets/contacts_card_widget.dart';
import 'package:login/models/event_model.dart';

class EventDetailsPage extends StatefulWidget {

  final Event event;
  const EventDetailsPage({super.key, required this.event});

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {

  @override
  Widget build(BuildContext context) {

    Widget sectionHeading(String title){
      return Container(
        margin: const EdgeInsets.fromLTRB(24, 16, 24, 0),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: Text(
                    '$title : ',
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            
          ],
        ),
      );
    }

    List<Widget> buildRules(){
      List<Widget> widgets = [];
      for(var rule in widget.event.eventRules){
        widgets.add(
          ListTile(
            dense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0), // Adjust the vertical padding as needed
            leading: const Text(
                      '\u2022',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ), // Bullet point icon
            title: Text(
              rule,
              style: const TextStyle(fontSize: 16, color: Colors.white)
            ), // Text content
          )
        );
      }
      return widgets;
    }

    List<Widget> buildRounds() {
      List<Widget> widgets = [];
      for (var round in widget.event.roundWiseDescription) {
        widgets.add(
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    RotatedBox(
                      quarterTurns: 3,
                      child: Column(
                        children: [
                          Text(
                            round.roundName,
                            style: const TextStyle(
                              color: Color(0xFFF55353),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      round.roundNumber.toString(),
                      style: const TextStyle(
                        color: Color(0xFFF55353),
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                // Description of Round
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: Text(
                      round.roundDescription,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        );
      }
      return widgets;
    }

    List<Widget> buildContacts() {
      List<Widget> widgets = [];
      for (var convenor in widget.event.eventConvenors) {
        widgets.add(
          ContactCardWidget(contactName: convenor.eventConvenorName, contactPhone: convenor.eventConvenorPhone, contactEmail: convenor.eventConvenorEmail)
        );
      }
      return widgets;
    }

    return GradientBackgroundWidget(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
              children: [
                const Row(
                  children: [
                    Column(
                      children: [
                        BackIconWidget()
                      ]
                    ),
                    Column(
                      children:[
                        TitleBarWidget(title: "Description")
                        ]
                    )
                  ]
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(widget.event.eventLogo),
                                  )
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.event.eventName,
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Poppins',
                                    color: Color(0xFFFEB139),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    widget.event.eventTagline,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16,
                                      color: Color(0xFFF55353),
                                    )),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    widget.event.eventDescription,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w200,
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: widget.event.eventRules.isNotEmpty,
                            child: Column(
                              children: [
                                sectionHeading("RULES"),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(24,8,24,0),
                                  child: Column(
                                    children: buildRules(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: widget.event.roundWiseDescription.isNotEmpty,
                            child: Column(
                              children: [
                                sectionHeading("ROUNDS DESCRIPTION"),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(24,8,0,0),
                                  child: Column(
                                    children: buildRounds(),
                                  )
                                ),
                              ],
                            ),
                          ),
                          sectionHeading("Contacts"),
                          Column(
                            children: buildContacts(),
                          )
                      ],
                    )
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your button press logic here
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: const Color(0xFFF55353),   // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Rounded corners
                      ),
                    ),
                    child: const SizedBox(
                      width: double.infinity, // Occupies entire width
                      child: Text(
                        'Register',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,       // Text font size
                        ),
                      ),
                    ),
                  )
                )
              ],
            ),
        ),
      ),
    );
  }
}
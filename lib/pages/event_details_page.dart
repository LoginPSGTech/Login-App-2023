import 'package:flutter/material.dart';
import 'package:login/widgets/gradient_background_widget.dart';
import 'package:login/widgets/title_bar_widget.dart';
import 'package:login/widgets/back_icon_widget.dart';
import 'package:login/widgets/contacts_card_widget.dart';

class EventDetailsPage extends StatefulWidget {
  const EventDetailsPage({super.key});

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  static String eventName = "Hack-In";
  static String eventLogo = "assets/images/hackin_logo.png";
  static String eventTagline =
      'Join us in the DATATHON of LOGIN 2023 to unleash the TALE that lies underneath the data!';
  static String eventDescription =
      'Data! A weave of a million stories! Every detail tells a saga. So roll up your sleeves to come up with a perfect blend of modeling, visualization and prediction to uncover the TALE underneath! Join us in the DATATHON of LOGIN 2023.';
  static List<String> rules = ['A team shall consist of a maximum of 2 members.','Highest scoring team wins','Decision of judge is Final'];
  static List<Round> rounds = [
          Round(
            roundNumber:"1",
            roundName: "Round",
            roundDescription: "Get, Set, Stack: Given a few paper cups and a pair of balloons, blow the balloons in order to shift the paper cups and stack it as a pyramid."
          ),
          Round(
            roundNumber:"2",
            roundName: "Round",
            roundDescription: "Bottle flips : Given a water-filled bottle and an obstacle, perform a few bottle flips by successfully tackling the hindrance."
          ),
          Round(
            roundNumber:"3",
            roundName: "Round",
            roundDescription: "Treasure hunt : Clues will be provided at various venues throughout the game. The players have to decode all the clues to finally reach the treasure!"
          )];
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

    Widget buildRules(){
      return ListView.builder(
        itemCount: rules.length,
        shrinkWrap: true,
        itemBuilder: (context, index){
          return ListTile(
            dense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0), // Adjust the vertical padding as needed
            leading: const Text(
                      '\u2022',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ), // Bullet point icon
            title: Text(
              rules[index],
              style: const TextStyle(fontSize: 16, color: Colors.white)
            ), // Text content
          );
        },
      );
    }

    Widget buildRounds() {
      return ListView.builder(
        itemCount: rounds.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
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
                            rounds[index].roundName,
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
                      rounds[index].roundNumber,
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
                      rounds[index].roundDescription,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
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
                                    child: Image.asset(eventLogo),
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
                                  eventName,
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
                                  child: Text(eventTagline,
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
                                    eventDescription,
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
                          sectionHeading("RULES"),
                          Container(
                            margin: const EdgeInsets.fromLTRB(24,8,0,0),
                            child: buildRules(),
                          ),
                          sectionHeading("ROUNDS DESCRIPTION"),
                          Container(
                            margin: const EdgeInsets.fromLTRB(24,8,0,0),
                            child: buildRounds(),
                          ),
                          sectionHeading("Contacts"),
                          const ContactCardWidget(contactName: "Hariharan S", contactPhone: "7339543452", contactEmail: "19pd27@psgtech.ac.in")
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

class Round {
  final String roundNumber;
  final String roundName;
  final String roundDescription;

  Round({required this.roundNumber, required this.roundName, required this.roundDescription});

}
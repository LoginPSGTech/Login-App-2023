import 'package:flutter/material.dart';
import 'package:login/widgets/text_field_widget.dart';

class MyEventCardWidget extends StatefulWidget {
  final String eventName;
  final String eventLogoUrl;
  final bool hasTeamAlready;
  const MyEventCardWidget(
      {super.key,
      required this.eventName,
      required this.eventLogoUrl,
      required this.hasTeamAlready});

  @override
  State<MyEventCardWidget> createState() => _MyEventCardWidgetState();
}

class _MyEventCardWidgetState extends State<MyEventCardWidget> {

  bool isExpanded = false;
  bool isCreateTeam = false;
  bool isJoinTeam = false;

  TextEditingController controller = TextEditingController();
  final TextEditingController createTeamController = TextEditingController();
  final TextEditingController joinTeamController = TextEditingController();

  String labelText = "";
  String? Function(String?)? validator;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 8, 24, 8),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF143F6B),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                height: 75,
                width: 75,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(widget.eventLogoUrl),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  widget.eventName,
                  style: const TextStyle(
                    color: Color(0xFFFEB139),
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          widget.hasTeamAlready
              ? Container(
                  margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                  decoration: BoxDecoration(
                    color: const Color(0xff152739), // Change the color to your desired background color
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust the border radius as needed
                  ),
                  child: const Padding(
                    padding:
                        EdgeInsets.all(8.0), // Adjust the padding as needed
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 16.0, // Adjust the icon size as needed
                        ),
                        SizedBox(
                            width:
                                8.0), // Add spacing between the icon and text
                        Flexible(
                          child: Text(
                            'Team Joined',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0, // Adjust the font size as needed
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        // Wrap with Expanded
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF55353),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              isExpanded = !isExpanded;
                              isCreateTeam = true;
                              isJoinTeam = false;
                              labelText = 'Team Name';
                              controller = createTeamController;
                              icon = Icons.group_add;
                              validator = (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Team Name is Required';
                                }
                                return null;
                              };
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.add_circle_rounded,
                                  color: Colors.white, size: 16),
                              Container(
                                margin: const EdgeInsets.only(left: 4),
                                child: const Text(
                                  'Create Team',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        // Wrap with Expanded
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFEB139),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              isExpanded = !isExpanded;
                              labelText = 'Team ID';
                              controller = joinTeamController;
                              icon = Icons.fingerprint_rounded;
                              isCreateTeam = false;
                              isJoinTeam = true;
                              validator = (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Team ID is Required';
                                }
                                if (value.length != 8) {
                                  return 'Invalid Team ID';
                                }
                                return null;
                              };
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.flag_circle_rounded,
                                  color: Colors.black, size: 16),
                              Container(
                                margin: const EdgeInsets.only(left: 4),
                                child: const Text(
                                  'Join Team',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          Visibility(
            visible: isExpanded,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFieldWidget(
                    controller: controller,
                    labelText: labelText,
                    isPassword: false,
                    prefixIcon: icon,
                    validator: validator),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFEB139),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    //if create team or not join team get text from controller send api req
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.check_circle_rounded,
                          color: Colors.black, size: 16),
                      Container(
                        margin: const EdgeInsets.only(left: 4),
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

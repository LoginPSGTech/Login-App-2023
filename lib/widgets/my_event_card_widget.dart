import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:login/api/team_event.dart';
import 'package:login/api/user.dart';
import 'package:login/models/team.dart';
import 'package:login/providers/app_data_provider.dart';
import 'package:login/widgets/snackbar_widget.dart';
import 'package:login/widgets/text_field_widget.dart';
import 'package:provider/provider.dart';

class MyEventCardWidget extends StatefulWidget {
  final String eventId;
  final String eventName;
  final String eventLogoUrl;
  final bool hasTeamAlready;
  final String emailId;
  const MyEventCardWidget({
    super.key,
    required this.eventId,
    required this.eventName,
    required this.eventLogoUrl,
    required this.hasTeamAlready,
    required this.emailId,
  });

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

  void handleDeregisterEvent() {
    EasyLoading.show(status: "Deregistering...");
    TeamEventApi.deregisterEvent(widget.eventId, context).then((value) {
      UserApi.getUser(context).then((value) {
        Provider.of<AppDataProvider>(context, listen: false).saveUser(value);
        EasyLoading.dismiss();
        SnackbarWidget.showMessage(context, "Success", "Deregistering Event Successful", ContentType.success);
      });
    }).catchError((err) {
      EasyLoading.dismiss();
      SnackbarWidget.showMessage(context, "Error", err.message, ContentType.failure);
    });
  }

  void handleCreateTeam(String teamName) {
    EasyLoading.show(status: "Creating Team...");
    CreateTeamModel createTeam = CreateTeamModel(team_name: teamName, event: widget.eventId);
    TeamEventApi.createTeam(createTeam, context).then((value) {
      UserApi.getUser(context).then((value) {
        Provider.of<AppDataProvider>(context, listen: false).saveUser(value);
        isExpanded = false;
        EasyLoading.dismiss();
        SnackbarWidget.showMessage(context, "Success", "Team Creation Successful", ContentType.success);
      });
    }).catchError((err) {
      EasyLoading.dismiss();
      SnackbarWidget.showMessage(context, "Error", err.message, ContentType.failure);
    });
  }

  void handleJoinTeam(String teamId) {
    EasyLoading.show(status: "Creating Team...");
    JoinTeamModel joinTeam = JoinTeamModel(event: widget.eventId, user: widget.emailId, team_id: teamId);
    TeamEventApi.joinTeam(joinTeam, context).then((value) {
      UserApi.getUser(context).then((value) {
        Provider.of<AppDataProvider>(context, listen: false).saveUser(value);
        isExpanded = false;
        EasyLoading.dismiss();
        SnackbarWidget.showMessage(context, "Success", "Successfully Joined Team", ContentType.success);
      });
    }).catchError((err) {
      EasyLoading.dismiss();
      SnackbarWidget.showMessage(context, "Error", err.message, ContentType.failure);
    });
  }

  void handleSubmit() {
    isJoinTeam ? handleJoinTeam(joinTeamController.text) : handleCreateTeam(createTeamController.text);
  }

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
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          widget.hasTeamAlready
              ? const SizedBox(width: 0, height: 0)
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
                              const Icon(Icons.add_circle_rounded, color: Colors.white, size: 16),
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
                              const Icon(Icons.flag_circle_rounded, color: Colors.black, size: 16),
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
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF55353),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: handleDeregisterEvent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.delete_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 4),
                    child: const Text('Deregister Event',
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
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
                  onPressed: handleSubmit,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.check_circle_rounded, color: Colors.black, size: 16),
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

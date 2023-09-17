import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:login/api/auth.dart';
import 'package:login/models/user.dart';
import 'package:login/pages/login_page.dart';
import 'package:login/providers/app_data_provider.dart';
import 'package:login/widgets/snackbar_widget.dart';
import 'package:login/widgets/title_bar_widget.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  final String? name;
  final String? rollNumber;
  final String? email;
  final String? contact;
  final String? gender;
  final String? collegeName;
  final String? degree;
  final String? stream;
  final String? yearOfStudy;

  const ProfilePage({
    super.key,
    this.name,
    this.rollNumber,
    this.email,
    this.contact,
    this.collegeName,
    this.degree,
    this.stream,
    this.yearOfStudy,
    this.gender,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void handleLogout() {
    EasyLoading.show(status: "Logging Out...");
    AuthApi.logout().then((value) {
      EasyLoading.dismiss();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }).catchError((err) {
      EasyLoading.dismiss();
      SnackbarWidget.showMessage(
          context, "Error", err.message, ContentType.failure);
    });
  }

  String getYearSuffix(int year) {
    if (year >= 11 && year <= 13) {
      return 'th';
    }
    switch (year % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<AppDataProvider>(context).user;
    String yearOfStudy = user.yearOfStudy;
    int year = int.tryParse(yearOfStudy) ?? 0;
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleBarWidget(title: "My Account"),
          Container(
            margin: const EdgeInsets.fromLTRB(24, 8, 24, 8),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: const Color(0xFF143F6B),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const Icon(
                      Icons.account_circle_rounded,
                      color: Colors.white,
                      size: 56,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        user.name,
                        style: const TextStyle(
                            color: Color(0xFFFEB139),
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 16, 0, 4),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: const Color(0xFF143F6B),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileTitleContentWidget(
                      title: "Roll Number",
                      content: user.rollNumber,
                    ),
                    ProfileTitleContentWidget(
                      title: "Email",
                      content: user.email,
                    ),
                    ProfileTitleContentWidget(
                      title: "Contact",
                      content: '+91 ${user.phoneNumber}',
                    ),
                    ProfileTitleContentWidget(
                      title: "Gender",
                      content: user.gender == 'M' ? 'Male' : 'Female',
                    ),
                    ProfileTitleContentWidget(
                      title: "College",
                      content: user.college,
                    ),
                    ProfileTitleContentWidget(
                      title: "Degree",
                      content: user.degree,
                    ),
                    ProfileTitleContentWidget(
                      title: "Stream",
                      content: user.stream,
                    ),
                    ProfileTitleContentWidget(
                      title: "Year of Study",
                      content:
                          '${user.yearOfStudy} ${getYearSuffix(year)} year',
                      isDivider: false,
                    ),
                  ],
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.only(top: 8),
              //   width: double.infinity,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: const Color(0xFFFEB139),
              //       // Text color

              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10.0),
              //       ),
              //     ),
              //     onPressed: () {
              //       // Validate and perform login
              //     },
              //     child: const Text(
              //       'Edit Profile',
              //       style: TextStyle(
              //         color: Colors.white,
              //       ),
              //     ),
              //   ),
              // ),
              Container(
                margin: const EdgeInsets.only(top: 8),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF55353),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    handleLogout();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.exit_to_app_outlined,
                        color: Colors.white,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        child: const Text('Log Out',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    ));
  }
}

class ProfileTitleContentWidget extends StatelessWidget {
  final String title;
  final String content;
  final bool isDivider;

  const ProfileTitleContentWidget(
      {Key? key,
      required this.title,
      required this.content,
      this.isDivider = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                  fontSize: 12
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              flex: 4,
              child: Text(
                content,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 12
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        isDivider
            ? const Divider(
                color: Colors.white,
                thickness: 0.1,
              )
            : Container(),
        isDivider
            ? const SizedBox(
                height: 6,
              )
            : Container(),
      ],
    );
  }
}

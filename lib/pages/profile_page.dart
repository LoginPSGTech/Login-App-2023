import 'package:flutter/material.dart';
import 'package:login/api/auth.dart';
import 'package:login/models/user.dart';
import 'package:login/pages/login_page.dart';
import 'package:login/widgets/title_bar_widget.dart';

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
    AuthApi.logout().then((value) => {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginPage()),
          )
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder<UserModel>(
      future: AuthApi.getUser(),
      builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
        if (snapshot.hasData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleBarWidget(title: "My Account"),
              Container(
                margin: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    snapshot.data!.name,
                    style: const TextStyle(color: Colors.white, fontSize: 32),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: const Color(0xFF143F6B), borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileTitleContentWidget(
                          title: "Roll Number",
                          content: snapshot.data?.rollNumber ?? "",
                        ),
                        ProfileTitleContentWidget(
                          title: "Email",
                          content: snapshot.data?.email ?? "",
                        ),
                        ProfileTitleContentWidget(
                          title: "Contact",
                          content: snapshot.data?.phoneNumber ?? "",
                        ),
                        ProfileTitleContentWidget(
                          title: "College",
                          content: snapshot.data?.college ?? "",
                        ),
                        ProfileTitleContentWidget(
                          title: "Gender",
                          content: snapshot.data?.gender ?? "",
                        ),
                        ProfileTitleContentWidget(
                          title: "Degree",
                          content: snapshot.data?.degree ?? "",
                        ),
                        ProfileTitleContentWidget(
                          title: "Stream",
                          content: snapshot.data?.stream ?? "",
                        ),
                        ProfileTitleContentWidget(
                          title: "Year of Study",
                          content: snapshot.data?.yearOfStudy ?? "",
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
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}

class ProfileTitleContentWidget extends StatelessWidget {
  final String title;
  final String content;
  final bool isDivider;

  const ProfileTitleContentWidget({Key? key, required this.title, required this.content, this.isDivider = true})
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
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              flex: 3,
              child: Text(
                content,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
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

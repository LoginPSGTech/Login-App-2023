import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/pages/schedule_page.dart';
import 'package:login/widgets/gradient_background_widget.dart';
import 'package:login/widgets/title_bar_widget.dart';

import 'events_page.dart';
import 'home_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selected = 1;
  late var events;
  late var schedule;
  late var home;
  late var profile;
  late var eventsdecoration;
  late var scheduledecoration;
  late var homedecoration;
  late var profiledecoration;
  late Widget page;
  late var decoration = const BoxDecoration(
      shape: BoxShape.circle,
      gradient: RadialGradient(
        colors: [
          //Color(0xffD14A4A),
          Color(0xffFEB139),
          Color(0xffF6F54D),
        ],
        //stops: [0.5,0.9]
      ),
      boxShadow: [
        BoxShadow(
          color: Color(0xfffecc51),
          blurRadius: 3.0,
          spreadRadius: 3.0,
        )
      ]);

  @override
  Widget build(BuildContext context) {
    return GradientBackgroundWidget(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const TitleBarWidget(title: "My Account"),
                Container(
                  margin: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                  child: const Text(
                    "S Prashant",
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                  padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 24),
                  decoration:  BoxDecoration(
                    color: Color(0xFF143F6B),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'NAME:',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          // Spacer(),
                          Expanded(
                            child: Text(
                              "Muhammed Razeen Amanullah bbbbbbbbbbbbbbG",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,

                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

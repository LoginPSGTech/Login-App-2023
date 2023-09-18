import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:login/pages/home_page.dart';
import 'package:login/pages/profile_page.dart';
import 'package:login/pages/schedule_page.dart';
import 'package:login/pages/events_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  int selected = 0;
  int prev = 0;
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
    switch (selected) {
      case 0:
        page = const HomePage();
        events = const Icon(
          Icons.emoji_events,
          size: 25,
          color: Colors.white,
        );
        schedule = const Icon(
          Icons.calendar_month,
          size: 25,
          color: Colors.white,
        );
        home = const Icon(
          Icons.home,
          size: 25,
          color: Colors.transparent,
        );
        profile = const Icon(
          Icons.account_circle_outlined,
          size: 25,
          color: Colors.white,
        );
        homedecoration = decoration;
        scheduledecoration = null;
        eventsdecoration = null;
        profiledecoration = null;
        break;
      case 1:
        page = const EventsPage();
        events = const Icon(
          Icons.assignment,
          size: 25,
          color: Colors.transparent,
        );
        schedule = const Icon(
          Icons.calendar_month,
          size: 25,
          color: Colors.white,
        );
        home = const Icon(
          Icons.home_filled,
          size: 25,
          color: Colors.white,
        );
        profile = const Icon(
          Icons.account_circle_outlined,
          size: 25,
          color: Colors.white,
        );
        homedecoration = null;
        scheduledecoration = null;
        eventsdecoration = decoration;
        profiledecoration = null;
        break;
      case 2:
        page = const SchedulePage();
        events = const Icon(
          Icons.emoji_events,
          size: 25,
          color: Colors.white,
        );
        schedule = const Icon(
          Icons.calendar_month,
          size: 25,
          color: Colors.transparent,
        );
        home = const Icon(
          Icons.home_filled,
          size: 25,
          color: Colors.white,
        );
        profile = const Icon(
          Icons.account_circle_outlined,
          size: 25,
          color: Colors.white,
        );
        homedecoration = null;
        scheduledecoration = decoration;
        eventsdecoration = null;
        profiledecoration = null;
        break;
      case 3:
        page = const ProfilePage();
        events = const Icon(
          Icons.emoji_events,
          size: 25,
          color: Colors.white,
        );
        schedule = const Icon(
          Icons.calendar_month,
          size: 25,
          color: Colors.white,
        );
        home = const Icon(
          Icons.home_filled,
          size: 25,
          color: Colors.white,
        );
        profile = const Icon(
          Icons.account_circle_outlined,
          size: 25,
          color: Colors.transparent,
        );
        homedecoration = null;
        scheduledecoration = null;
        eventsdecoration = null;
        profiledecoration = decoration;
        break;
      default:
        page = const HomePage();
    }

    return WillPopScope(
      onWillPop: () {
        if (selected != 0) {
          // If not on the HomePage, navigate to the HomePage
          setState(() {
            selected = prev;
            prev = 0;
          });
          bottomNavigationKey.currentState?.setPage(selected);
          return Future.value(false); // Prevent default back button behavior
        }
        // If already on the HomePage, allow the default back button behavior
        return Future.value(true);
      },
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff020507), Color(0xff152739)],
            begin: Alignment(-1.0, -1),
            end: Alignment(-1.0, 1),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: page,
          bottomNavigationBar: CurvedNavigationBar(
            key: bottomNavigationKey,
            iconPadding: 3,
            color: const Color(0xff1D4167),
            index: 0,
            height: 70,
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: Colors.transparent,
            animationDuration: const Duration(milliseconds: 200),
            items: [
              CurvedNavigationBarItem(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: homedecoration,
                  child: home,
                ),
                label: 'Home',
                labelStyle: const TextStyle(color: Colors.white, fontSize: 10),
              ),
              CurvedNavigationBarItem(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: eventsdecoration,
                  child: events,
                ),
                label: 'Events',
                labelStyle: const TextStyle(color: Colors.white, fontSize: 10),
              ),
              CurvedNavigationBarItem(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: scheduledecoration,
                  child: schedule,
                ),
                label: 'Schedule',
                labelStyle: const TextStyle(color: Colors.white, fontSize: 10),
              ),
              CurvedNavigationBarItem(
                // Replace this with your profile image widget
                // child: Container(
                //   width: 30, // Adjust the size as needed
                //   height: 30, // Adjust the size as needed
                //   decoration: profiledecoration,
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(
                //         15), // Half of the width/height to create a circle
                //     child: profiledecoration == null ? SvgPicture.string(
                //       RandomAvatarString('saytoonz',
                //           trBackground: true), // Replace with your SVG image path
                //       fit: BoxFit.cover,
                //     ): null,
                //   ),
                // ),
                // label: 'Profile',
                // labelStyle: const TextStyle(color: Colors.white, fontSize: 10),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: profiledecoration,
                  child: profile,
                ),
                label: 'Profile',
                labelStyle: const TextStyle(color: Colors.white, fontSize: 10),
              )
            ],
            onTap: (index) {
              setState(() {
                if (selected != index) {
                  prev = selected;
                  selected = index;
                }
              });
            },
          ),
        ),
      ),
    );
  }
}

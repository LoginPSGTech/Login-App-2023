import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:login/pages/home_page.dart';
import 'package:login/pages/schedule_page.dart';
import 'package:login/pages/events_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});


  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selected=1;
  late var events;
  late var schedule;
  late var home;
  late var eventsdecoration;
  late var scheduledecoration;
  late var homedecoration;
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
      ]
  );
  @override
  Widget build(BuildContext context) {

    switch(selected){
      case 0:
        page=EventsPage();
        events=const Icon(Icons.assignment,size: 30,color: Colors.transparent,);
        schedule=const Icon(Icons.timer_outlined,size: 30,color: Colors.white,);
        home=const Icon(Icons.home_outlined,size: 30,color: Colors.white,);
        homedecoration=null;
        scheduledecoration=null;
        eventsdecoration=decoration;
        break;
      case 1:
        page=HomePage();
        events=const Icon(Icons.assignment_outlined,size: 30,color: Colors.white,);
        schedule=const Icon(Icons.timer_outlined,size: 30,color: Colors.white,);
        home=const Icon(Icons.home,size: 30,color: Colors.transparent,);
        homedecoration=decoration;
        scheduledecoration=null;
        eventsdecoration=null;
        break;
      case 2:
        page=SchedulePage();
        events=const Icon(Icons.assignment_outlined,size: 30,color: Colors.white,);
        schedule=const Icon(Icons.timer,size: 30,color: Colors.transparent,);
        home=const Icon(Icons.home_outlined,size: 30,color: Colors.white,);
        homedecoration=null;
        scheduledecoration=decoration;
        eventsdecoration=null;
        break;
      default:
        page=HomePage();
    }

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff020507),
            Color(0xff152739)
          ],
          begin: Alignment(-1.0, -1),
          end: Alignment(-1.0, 1),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: page,
        bottomNavigationBar: CurvedNavigationBar(
          iconPadding: 10,
          color: const Color(0xff1D4167),
          index: 1,
          height: 75,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Colors.transparent,
          items:[
            CurvedNavigationBarItem(
              child: Container(
                padding:const EdgeInsets.all(8),
                decoration: eventsdecoration,
                child: events,
              ),
              label: 'Events',
              labelStyle: const TextStyle(color: Colors.white),
            ),
            CurvedNavigationBarItem(
              child: Container(
                padding:const EdgeInsets.all(8),
                decoration: homedecoration,
                child:home,
              ),
              label: 'Home',
              labelStyle: const TextStyle(color: Colors.white),
            ),
            CurvedNavigationBarItem(
              child: Container(
                padding:const EdgeInsets.all(8),
                decoration: scheduledecoration,
                child:schedule,
              ),
              label: 'Schedule',
              labelStyle: const TextStyle(color: Colors.white),
            ),
          ],
          onTap: (index){
            setState(() {
              if(selected!=index){
                selected=index;
              }
            });
          },
        ),
      ),
    );
  }
}
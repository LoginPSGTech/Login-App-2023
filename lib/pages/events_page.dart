import 'package:flutter/material.dart';
import 'package:login/widgets/event_card_widget.dart';
import 'package:login/widgets/title_bar_widget.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: const Column(
          children: [
            Row(
              children: [
                TitleBarWidget(title: "Events")
              ]
            ),
            Row(
              children: [
                EventCardWidget(eventLogoUrl: "assets/images/hackin_logo.png", eventName: "Hack-in", eventTagline: "Unravel the Digital Enigma: Hack, Crack & Conquer in the Ultimate Cyber Challenge")
              ]
            ),
          ],
        ),
      ),
    );
  }
}
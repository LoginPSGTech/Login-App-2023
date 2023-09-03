import 'package:flutter/material.dart';
import 'package:login/widgets/event_card_widget.dart';
import 'package:login/widgets/title_bar_widget.dart';
import 'package:login/pages/event_details_page.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {

  Widget buildEvents(){
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap : () async {
              await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const EventDetailsPage(),
              ));
            },
            child: const EventCardWidget(
              eventLogoUrl: "assets/images/hackin_logo.png",
              eventName: "Hack-in",
              eventTagline: "Unravel the Digital Enigma: Hack, Crack & Conquer in the Ultimate Cyber Challenge"),
          );
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Row(
            children: [
              TitleBarWidget(title: "Events")
            ]
          ),
          Expanded( // Wrap the ListView.builder with Expanded
            child: buildEvents(),
          ),
        ],
      ),
    );
  }

}
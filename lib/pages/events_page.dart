import 'package:flutter/material.dart';
import 'package:login/widgets/event_card_widget.dart';
import 'package:login/widgets/title_bar_widget.dart';
import 'package:login/pages/event_details_page.dart';
import 'package:provider/provider.dart';
import 'package:login/providers/app_data_provider.dart';
import 'package:login/models/event_model.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {

  Widget buildEvents(List<Event> events){
    return ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap : () async {
              await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const EventDetailsPage(),
              ));
            },
            child: EventCardWidget(
              eventLogoUrl: events[index].eventLogo,
              eventName: events[index].eventName,
              eventTagline: events[index].eventTagline),
          );
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<AppDataProvider>(context).appData;
    return SafeArea(
      child: Column(
        children: [
          const Row(
            children: [
              TitleBarWidget(title: "Events")
            ]
          ),
          Expanded( // Wrap the ListView.builder with Expanded
            child: buildEvents(appData.mscEvents),
          ),
        ],
      ),
    );
  }

}
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

class _EventsPageState extends State<EventsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // Number of tabs
  }

  // Widget buildTeams(){


  // }

  Widget buildEvents(List<Event> events) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () async {
            await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EventDetailsPage(event: events[index]),
            ));
          },
          child: EventCardWidget(
              eventLogoUrl: events[index].eventLogo,
              eventName: events[index].eventName,
              eventTagline: events[index].eventTagline,
              eventTeamSize: events[index].teamSize),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mcaEvents = Provider.of<AppDataProvider>(context).appData.mcaEvents;
    final mscEvents = Provider.of<AppDataProvider>(context).appData.mscEvents;
    return SafeArea(
      child: Column(
        children: [
          const Row(children: [TitleBarWidget(title: "Events")]),
          Container(
            margin: const EdgeInsets.fromLTRB(24, 0, 24, 16),
            child: TabBar(
                controller: _tabController,
                indicatorColor: const Color(0xFFF55353),
                indicatorWeight: 5,
                dividerColor: Colors.transparent,
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                labelColor: const Color(0xFFFEB139),
                unselectedLabelColor: const Color(0xFFFFFFFF),
                tabs: const [
                  Tab(
                    child: Text(
                      'All Events',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'My Events',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Teams',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ]),
          ),
          Expanded(
              // Wrap the ListView.builder with Expanded
              child: TabBarView(
            controller: _tabController,
            children: [
              buildEvents(mscEvents + mcaEvents),
              const Icon(Icons.directions_transit),
              buildTeams()
            ],
          )),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose(); // Don't forget to dispose of the TabController
    super.dispose();
  }
}

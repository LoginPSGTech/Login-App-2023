import 'package:flutter/material.dart';
import 'package:login/models/user.dart';
import 'package:login/widgets/event_card_widget.dart';
import 'package:login/widgets/event_team_card_widget.dart';
import 'package:login/widgets/my_event_card_widget.dart';
import 'package:login/widgets/title_bar_widget.dart';
import 'package:login/pages/event_details_page.dart';
import 'package:provider/provider.dart';
import 'package:login/providers/app_data_provider.dart';
import 'package:login/models/event_model.dart';

import 'form_constants.dart';

class Team {
  final String teamId;
  final String teamName;
  final String eventName;
  final String eventLogoUrl;

  Team({
    required this.teamId,
    required this.teamName,
    required this.eventName,
    required this.eventLogoUrl,
  });
}

class MyEvent {
  final String eventId;
  final String eventLogoUrl;
  final bool hasTeamAlready;

  MyEvent(
      {required this.eventId,
      required this.eventLogoUrl,
      required this.hasTeamAlready});
}

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

  Widget buildTeams(List<Team> teams) {
    if (teams.isEmpty) {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.info_rounded, // Use the InfoOutline icon
                color: Color(
                    0xFFFEB139), // You can adjust the color to match your design
                size: 16, // You can adjust the size as needed
              ),
              Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Text(
                    "Not a Member of Any Team",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ))
            ],
          )
        ],
      );
    }
    return ListView.builder(
      itemCount: teams.length,
      itemBuilder: (context, index) {
        return EventTeamCardWidget(
            teamId: teams[index].teamId,
            teamName: teams[index].teamName,
            eventName: teams[index].eventName,
            eventLogoUrl: teams[index].eventLogoUrl);
      },
    );
  }

  Widget buildMyEvents(List<MyEvent> myEvents, String emailId) {
    if (myEvents.isEmpty) {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.info_rounded, // Use the InfoOutline icon
                color: Color(
                    0xFFFEB139), // You can adjust the color to match your design
                size: 16, // You can adjust the size as needed
              ),
              Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Text(
                    "No Registered Events",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ))
            ],
          )
        ],
      );
    }
    return ListView.builder(
      itemCount: myEvents.length,
      itemBuilder: (context, index) {
        return MyEventCardWidget(
          eventId: myEvents[index].eventId,
          eventName: events[myEvents[index].eventId]!,
          eventLogoUrl: myEvents[index].eventLogoUrl,
          hasTeamAlready: myEvents[index].hasTeamAlready,
          emailId: emailId,
        );
      },
    );
  }

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
              eventTeamSize: events[index].teamSize,
              isTechnical: events[index].isTechnical,
              isOffline: events[index].isOffline),
        );
      },
    );
  }

  List<MyEvent> getMyEvents(UserModel user) {
    Set<String> eventsWithTeams =
        user.teams.map((UserTeamModel team) => team.event).toSet();
    return user.events
        .map((UserEventModel event) => MyEvent(
            eventId: event.event,
            eventLogoUrl: "assets/images/events/${event.event}.png",
            hasTeamAlready: eventsWithTeams.contains(event.event)))
        .toList();
  }

  List<Team> getTeams(UserModel user) {
    return user.teams
        .map((UserTeamModel team) => Team(
            teamId: team.team_id,
            teamName: team.team_name,
            eventName: events[team.event]!,
            eventLogoUrl: "assets/images/events/${team.event}.png"))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final mcaEvents = Provider.of<AppDataProvider>(context).appData.mcaEvents;
    final mscEvents = Provider.of<AppDataProvider>(context).appData.mscEvents;
    UserModel user = Provider.of<AppDataProvider>(context).user;
    List<MyEvent> myEvents = getMyEvents(user);
    List<Team> teams = getTeams(user);

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
              buildMyEvents(myEvents, user.email),
              buildTeams(teams)
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

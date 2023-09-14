import 'package:flutter/material.dart';

class EventTeamCardWidget extends StatelessWidget {
  final String teamId;
  final String teamName;
  final String eventName;
  final String eventLogoUrl;

  const EventTeamCardWidget(
      {super.key, required this.teamId, required this.teamName, required this.eventName, required this.eventLogoUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 8, 24, 8),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(color: const Color(0xFF143F6B), borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                height: 75,
                width: 75,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(eventLogoUrl),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  eventName,
                  style: const TextStyle(color: Color(0xFFFEB139), fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TeamTitleContentWidget(
            title: "Team ID",
            content: teamId,
          ),
          TeamTitleContentWidget(
            title: "Team Name",
            content: teamName,
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}

class TeamTitleContentWidget extends StatelessWidget {
  final String title;
  final String content;

  const TeamTitleContentWidget({Key? key, required this.title, required this.content}) : super(key: key);

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
          height: 8,
        ),
      ],
    );
  }
}

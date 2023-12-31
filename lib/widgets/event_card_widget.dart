import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventCardWidget extends StatelessWidget {
  const EventCardWidget(
      {super.key,
      required this.eventLogoUrl,
      required this.eventName,
      required this.eventTagline,
      required this.eventTeamSize,
      required this.isTechnical,
      required this.isOffline});

  final String eventLogoUrl;
  final String eventName;
  final String eventTagline;
  final String eventTeamSize;
  final bool isTechnical;
  final bool isOffline;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Card(
      color: const Color(0xFF143F6B),
      margin: const EdgeInsets.fromLTRB(24, 16, 24, 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        constraints: const BoxConstraints(minHeight: 120),
        width: screenWidth - 48,
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Column(
              children: [
                SizedBox(
                    height: 75,
                    width: 75,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(eventLogoUrl),
                    )),
              ],
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            eventName,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFFFEB139),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            eventTagline,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        const Icon(
                          CupertinoIcons.group_solid,
                          color: Color(0xFFF55353), // Icon color
                          size: 18, // Icon size
                        ),
                        const SizedBox(width: 8), // Space between icon and text
                        Flexible(
                          child: Text(
                            'Team Size : $eventTeamSize', // Replace with your team size text
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white70, // Text color
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: !isOffline
                              ? Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF00BB5D), // Accent green color
                                    borderRadius: BorderRadius.circular(15), // Rounded corners
                                  ),
                                  child: const Text(
                                    "Online",
                                    style: TextStyle(
                                      fontSize: 12,

                                      color: Color(0xFF152739), // Text color
                                    ),
                                  ),
                                )
                              : Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFEB139), // Yellow background
                                    borderRadius: BorderRadius.circular(15), // Rounded corners
                                  ),
                                  child: const Text(
                                    "Offline",
                                    style: TextStyle(
                                      fontSize: 12,

                                      color: Color(0xFF152739), // Text color
                                    ),
                                  ),
                                ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 16, left: 8),
                            child: isTechnical
                                ? Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF55353), // Red background
                                      borderRadius: BorderRadius.circular(15), // Rounded corners
                                    ),
                                    child: const Text(
                                      "Technical",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF152739), // Text color
                                      ),
                                    ),
                                  )
                                : Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFEB139), // Yellow background
                                      borderRadius: BorderRadius.circular(15), // Rounded corners
                                    ),
                                    child: const Text(
                                      "Non Technical",
                                      style: TextStyle(
                                        fontSize: 12,

                                        color: Color(0xFF152739), // Text color
                                      ),
                                    ),
                                  ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

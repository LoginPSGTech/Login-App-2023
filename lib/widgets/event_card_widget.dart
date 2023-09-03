import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventCardWidget extends StatelessWidget {
  const EventCardWidget({
    super.key,
    required this.eventLogoUrl,
    required this.eventName,
    required this.eventTagline
  });

  final String eventLogoUrl;
  final String eventName;
  final String eventTagline;
  

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Card(
        color: const Color(0xFF143F6B),
        margin: const EdgeInsets.fromLTRB(24, 16, 24, 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          constraints: const BoxConstraints(minHeight: 120),
          width: screenWidth-48,
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(eventLogoUrl),
                    )
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            eventName,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFFFEB139),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              eventTagline,
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
                      const Row(
                        children: [
                          Icon(
                            CupertinoIcons.group_solid,
                            color: Color(0xFFF55353), // Icon color
                            size: 18, // Icon size
                          ),
                          SizedBox(width: 8), // Space between icon and text
                          Text(
                            "Team : 2-3", // Replace with your team size text
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white, // Text color
                            ),
                          ),
                        ],
                      ),
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
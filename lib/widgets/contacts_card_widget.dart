import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactCardWidget extends StatelessWidget {
  final String contactName;
  final String contactPhone;
  final String contactEmail;
   
  const ContactCardWidget({
    super.key,
    required this.contactName,
    required this.contactPhone,
    required this.contactEmail
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Card(
        color: const Color(0xFF143F6B),
        margin: const EdgeInsets.fromLTRB(24, 16, 24, 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          constraints: const BoxConstraints(minHeight: 120),
          width: screenWidth-48,
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const Column(
                children: [
                  Icon(
                  CupertinoIcons.person_circle_fill,
                  size: 72,
                  color: Colors.white,
                )
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
                              contactName,
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                                color: Color.fromRGBO(230, 162, 16, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.phone,
                            size: 20,
                            color: Color.fromRGBO(18, 31, 44, 61),
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              contactPhone,
                              style: const TextStyle(fontSize: 14, color: Colors.white),
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
                            Icons.email,
                            size: 20,
                            color: Color.fromRGBO(18, 31, 44, 61),
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              contactEmail,
                              style: const TextStyle(fontSize: 14, color: Colors.white),
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
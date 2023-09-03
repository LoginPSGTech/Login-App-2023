import 'package:flutter/material.dart';

class TitleBarWidget extends StatelessWidget {
  const TitleBarWidget({
    super.key, 
    required this.title
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        margin: const EdgeInsets.fromLTRB(24, 16, 24, 0),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
        ]));
  }
}
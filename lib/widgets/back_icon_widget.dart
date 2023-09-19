import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackIconWidget extends StatelessWidget {
  const BackIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(24, 16, 0, 16),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white, // Background color of the circle
        ),
        child: const Icon(
          Icons.chevron_left_rounded,
          size: 34,
          color: Colors.black87,
        ),
      ),
    );
  }
}

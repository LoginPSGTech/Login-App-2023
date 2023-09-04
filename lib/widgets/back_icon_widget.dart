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
          padding: const EdgeInsets.fromLTRB(24, 16, 0, 16),          
          child: const Icon(
            CupertinoIcons.back,
            size: 32, 
            color: Colors.white,
          ),
        ),
      );
  }
}
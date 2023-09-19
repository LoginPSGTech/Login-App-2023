import 'package:flutter/material.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff152739), Color(0xFF143F6B)],
          begin: Alignment(0.0, -1.0), // 135 degrees from top-left
          end: Alignment(0.0, 1.0), // 315 degrees from bottom-right
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/foreground.png",
            height: 150,
            width: 150,
          ),
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                colors: [Color(0xFFF6F54D), Color(0xFFFEB139), Color(0xFFF55353)],
                stops: [0.0, 0.5, 1.0],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds);
            },
            child: const CircularProgressIndicator(
              strokeCap: StrokeCap.round,
              strokeWidth: 5.0, // Adjust the stroke width as needed
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFF6F54D)),
            ),
          )
        ],
      ),
    );
  }
}

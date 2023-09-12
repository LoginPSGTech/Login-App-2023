import 'package:flutter/cupertino.dart';

class GradientBackgroundWidget extends StatelessWidget {
  final Widget child;
  const GradientBackgroundWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff020507), Color(0xff152739)],
          begin: Alignment(-1.0, -1),
          end: Alignment(-1.0, 1),
        ),
      ),
      child: child,
    );
  }
}

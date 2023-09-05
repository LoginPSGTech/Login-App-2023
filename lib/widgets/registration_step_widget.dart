import 'package:flutter/material.dart';

class RegistrationStepWidget extends StatelessWidget {
  final int stepNumber;
  final String title;
  final Widget content;
  const RegistrationStepWidget({
    super.key,
    required this.stepNumber,
    required this.title,
    required this.content
  });

  List<Widget> buildForm(){
    return [
      Text('Step $stepNumber'),
      const SizedBox(height: 16),
      Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 16),
      Container(
        child: content,
      )
    ];
  }

  @override
  List<Widget> build(BuildContext context) {
    return buildForm();
  }
}
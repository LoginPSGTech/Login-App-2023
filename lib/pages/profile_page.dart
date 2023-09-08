import 'package:flutter/material.dart';
import 'package:login/widgets/title_bar_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(children: [
              Column(children: [TitleBarWidget(title: "My Account")])
            ]),
            Container(
              margin: const EdgeInsets.fromLTRB(24, 8, 24, 8),
              child: Row(children: [
                Column(children: [
                  const Text(
                    "Prashanth S",
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xff152739)
                    ),
                    child: const Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Email', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600))
                        ],
                      )
                    ]),
                  )
                ])
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

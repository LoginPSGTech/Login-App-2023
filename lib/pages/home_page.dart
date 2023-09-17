import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:login/providers/app_data_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> colored = <int>[600, 500, 100];
  late var descriptionButtonText;
  late var aboutButtonText;
  late var descriptiontext, abouttext;
  int descriptionState = 0;
  int aboutState = 0;
  late var event;

  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<AppDataProvider>(context).appData;
    final event = appData.mscEvents;
    final programs = appData.home.programs;
    final homeEvents = appData.home.events;
    final sponsors = appData.home.sponsors;
    switch (descriptionState) {
      case 0:
        descriptionButtonText = "Read More";
        descriptiontext = appData.home.description;
        break;
      case 1:
        descriptionButtonText = "Read Less";
        descriptiontext =
            appData.home.description + appData.home.addeddescription;
        break;
    }
    switch (aboutState) {
      case 0:
        aboutButtonText = "Read More";
        abouttext = appData.home.about;
        break;
      case 1:
        aboutButtonText = "Read Less";
        abouttext = appData.home.about + appData.home.addedabout;
        break;
    }
    return SafeArea(
      child: ListView(
        children: [
          //title image
          Container(
            margin: const EdgeInsets.fromLTRB(24, 16, 24, 0),
            child: SizedBox(
              width: 216, // New width
              height: 108, // New height
              child: Image.asset(
                'assets/images/login.png',
                width: 216,
                height: 108,
              ),
            ),
          ),
          //title digital horizon
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Container(
              color: Colors.transparent,
              child: const MergeSemantics(
                child: Wrap(
                  children: [
                    Text("DIGITAL ",
                        style: TextStyle(
                            color: Color(0xffF55353),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 22)),
                    Text("HORIZON ",
                        style: TextStyle(
                            color: Color(0xffFEB139),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            fontSize: 22)),
                  ],
                ),
              ),
            ),
          ),
          //title navigating the
          const Padding(
            padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Text("NAVIGATING THE ",
                style: TextStyle(
                    color: Color(0xffF55353),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    fontSize: 22)),
          ),
          //title hyper -connected world
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Container(
              color: Colors.transparent,
              child: const MergeSemantics(
                child: Wrap(
                  children: [
                    Text("HYPER",
                        style: TextStyle(
                            color: Color(0xffFEB139),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            fontSize: 22)),
                    Text("-CONNECTED WORLD",
                        style: TextStyle(
                            color: Color(0xffF55353),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            fontSize: 22)),
                  ],
                ),
              ),
            ),
          ),
          //description
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 1500),
              child: Column(
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    child: Text(
                      descriptiontext,
                      key: ValueKey<String>(descriptiontext),
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (descriptionState == 0) {
                            descriptionState = 1;
                          } else {
                            descriptionState = 0;
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: const Size(double.infinity, 40),
                        backgroundColor: const Color(0xffF55353),
                      ),
                      child: Text(
                        descriptionButtonText,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          //about
          const Padding(
            padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: MergeSemantics(
              child: Wrap(
                children: [
                  Text("ABOUT ",
                      style: TextStyle(
                          color: Color(0xffF55353),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 22)),
                  Text("LOGIN ",
                      style: TextStyle(
                          color: Color(0xffFEB139),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 22)),
                ],
              ),
            ),
          ),
          //about
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Column(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: Text(
                    abouttext,
                    key: ValueKey<String>(abouttext),
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (aboutState == 0) {
                          aboutState = 1;
                        } else {
                          aboutState = 0;
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color(0xffF55353),
                    ),
                    child: Text(
                      aboutButtonText,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                )
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.fromLTRB(24, 16, 16, 0),
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("LOGIN 2023 ",
                      style: TextStyle(
                          color: Color(0xffFEB139),
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                          fontSize: 24)),
                  Text("HIGHLIGHTS",
                      style: TextStyle(
                          color: Color(0xffF55353),
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                          fontSize: 24)),
                ]),
          ),
          //events
          Container(
            margin: const EdgeInsets.fromLTRB(8, 0, 8, 24),
            child: Flex(direction: Axis.horizontal, children: <Widget>[
              const Flexible(
                  flex: 1,
                  child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        "EVENTS",
                        style: TextStyle(
                          color: Color(0xffF55353),
                        ),
                      ))),
              Flexible(
                flex: 11,
                child: SizedBox(
                  height: 192,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    reverse: false,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white, // Border color
                              width: 1.0, // Border width
                            ),
                            image: DecorationImage(
                              image: AssetImage(event[index].eventLogo),
                              fit: BoxFit.contain,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFF143F6B),
                          ),
                          height: 192,
                          width: 108,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 4),
                              color: Colors.transparent,
                              child: Text(
                                event[index].eventName,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: homeEvents.length,
                  ),
                ),
              ),
            ]),
          ),
          //programs
          Container(
            margin: const EdgeInsets.fromLTRB(8, 0, 8, 24),
            child: Flex(direction: Axis.horizontal, children: <Widget>[
              Flexible(
                flex: 11,
                child: SizedBox(
                  height: 192,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    reverse: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(programs[index].itemImage),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xff123E6B),
                          ),
                          height: 192,
                          width: 108,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.transparent, Colors.black87],
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                color: Colors.transparent,
                                child: Text(
                                  programs[index].itemName,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: programs.length,
                  ),
                ),
              ),
              const Flexible(
                  flex: 1,
                  child: RotatedBox(
                      quarterTurns: 1,
                      child: Text(
                        "PROGRAMS",
                        style: TextStyle(
                          color: const Color(0xffF55353),
                        ),
                      ))),
            ]),
          ),
          //Sponsors
          Container(
            margin: const EdgeInsets.fromLTRB(8, 0, 8, 24),
            child: Flex(direction: Axis.horizontal, children: <Widget>[
              const Flexible(
                  flex: 1,
                  child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        "SPONSORS",
                        style: TextStyle(
                          color: Color(0xffF55353),
                        ),
                      ))),
              Flexible(
                flex: 11,
                child: SizedBox(
                  height: 192,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    reverse: false,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(sponsors[index].itemImage),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xff123E6B),
                          ),
                          height: 192,
                          width: 108,
                        ),
                      );
                    },
                    itemCount: sponsors.length,
                  ),
                ),
              ),
            ]),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(24, 16, 24, 0),
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("PSG TECH ",
                      style: TextStyle(
                          color: Color(0xffFEB139),
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                          fontSize: 24)),
                  Text("CAMPUS MAP",
                      style: TextStyle(
                          color: Color(0xffF55353),
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                          fontSize: 24)),
                ]),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(24, 8, 24, 24),
            child: SizedBox(
              width: double
                  .infinity, // Set the width to take up all available space
              height: 200, // Adjust the height to your desired value
              child: Image.asset('assets/images/college_map.png'),
            ),
          )
        ],
      ),
    );
  }
}

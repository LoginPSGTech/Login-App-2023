import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selected=1;
  late var events;
  late var schedule;
  late var home;
  late var eventsdecoration;
  late var scheduledecoration;
  late var homedecoration;
  late Widget page;
  late var decoration = const BoxDecoration(
  shape: BoxShape.circle,
  gradient: RadialGradient(
  colors: [
  //Color(0xffD14A4A),
  Color(0xffFEB139),
  Color(0xffF6F54D),
  ],
  //stops: [0.5,0.9]
  ),
  boxShadow: [
  BoxShadow(
  color: Color(0xfffecc51),
  blurRadius: 3.0,
  spreadRadius: 3.0,
  )
  ]
  );
  @override
  Widget build(BuildContext context) {

    switch(selected){
      case 0:
        page=eventsPage();
        events=const Icon(Icons.assignment,size: 30,color: Colors.transparent,);
        schedule=const Icon(Icons.timer_outlined,size: 30,color: Colors.white,);
        home=const Icon(Icons.home_outlined,size: 30,color: Colors.white,);
        homedecoration=null;
        scheduledecoration=null;
        eventsdecoration=decoration;
        break;
      case 1:
        page=homePage();
        events=const Icon(Icons.assignment_outlined,size: 30,color: Colors.white,);
        schedule=const Icon(Icons.timer_outlined,size: 30,color: Colors.white,);
        home=const Icon(Icons.home,size: 30,color: Colors.transparent,);
        homedecoration=decoration;
        scheduledecoration=null;
        eventsdecoration=null;
        break;
      case 2:
        page=schedulePage();
        events=const Icon(Icons.assignment_outlined,size: 30,color: Colors.white,);
        schedule=const Icon(Icons.timer,size: 30,color: Colors.transparent,);
        home=const Icon(Icons.home_outlined,size: 30,color: Colors.white,);
        homedecoration=null;
        scheduledecoration=decoration;
        eventsdecoration=null;
        break;
      default:
        page=homePage();
    }

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff020507),
            Color(0xff152739)
          ],
          begin: Alignment(-1.0, -1),
          end: Alignment(-1.0, 1),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: page,
        bottomNavigationBar: CurvedNavigationBar(
          iconPadding: 10,
          color: const Color(0xff1D4167),
          index: 1,
          height: 75,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Colors.transparent,
          items:[
              CurvedNavigationBarItem(
                child: Container(
                  padding:const EdgeInsets.all(8),
                  decoration: eventsdecoration,
                  child: events,
                ),
                label: 'Events',
                labelStyle: const TextStyle(color: Colors.white),
              ),
              CurvedNavigationBarItem(
                child: Container(
                  padding:const EdgeInsets.all(8),
                  decoration: homedecoration,
                    child:home,
                ),
                label: 'Home',
                labelStyle: const TextStyle(color: Colors.white),
              ),
              CurvedNavigationBarItem(
                child: Container(
                  padding:const EdgeInsets.all(8),
                  decoration: scheduledecoration,
                    child:schedule,
                ),
                label: 'Schedule',
                labelStyle: const TextStyle(color: Colors.white),
              ),
          ],
          onTap: (index){
            setState(() {
              if(selected!=index){
                selected=index;
              }
            });
          },
        ),
      ),
    );
  }
}

class homePage extends StatefulWidget{
  @override
  State<homePage> createState() => _homepageState();
}

class _homepageState extends State<homePage> {
  List<int> colored=<int>[600,500,100];
  late var text1;
  late var text2;
  int text1State=0;
  int text2State=0;
  @override
  Widget build(BuildContext context){
    switch(text1State){
      case 0:
        text1="We live in the world of interconnected technologies, where there is exponential growth and transformation impacting industries, societies, and individuals alike. Notably, the swift adoption rate of cutting-edge technology outpaces previous advancements.";
        break;
      case 1:
        text1="We live in the world of interconnected technologies, where there is exponential growth and transformation impacting industries, societies, and individuals alike. Notably, the swift adoption rate of cutting-edge technology outpaces previous advancements.A prime example is Al revolutionizing virtual assistants, autonomous vehicles, medical diagnoses and personalized content.Embracing this horizon requires responsible adaptation, addressing ethical concerns, privacy, and bridging the digital divide. By leveraging its potential, we pave the way for an exciting future!";
        break;
    }
    switch(text2State){
      case 0:
        text2="The 32nd edition of LOGIN, a highly celebarated technical symposium in PSG Tech, is brought to you by the Computer Applications, and the Computational Sciences Associations who look towards continuing to spread the far-reaching wings of their longstanding partnership, to expand their footprint on the digital horizon. ";
        break;
      case 1:
        text2="The 32nd edition of LOGIN, a highly celebarated technical symposium in PSG Tech, is brought to you by the Computer Applications, and the Computational Sciences Associations who look towards continuing to spread the far-reaching wings of their longstanding partnership, to expand their footprint on the digital horizon. Post graduate students of any stream from colleges around the globe are welcome to code, compete and conquer this quest for the creative and collaborative. The two-day symposium held on the 23rd and 24th of September, serves up a smorgasbord of sumptuous events that refine, recognize and reward students for their zeal and zest.";
        break;

    }
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(86, 70, 86, 30),
          child:Container(
            height: 61,
            width: 188,
            child: Image.asset(
              'images/login.png'
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
            child: Container(
              color: Colors.transparent,
              child: const MergeSemantics(
                child: Wrap(
                  children: [
                    Text(
                        "DIGITAL ",
                        style: TextStyle(
                            color:Color(0xffF55353),
                            fontFamily:'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize:22
                        )

                    ),
                    Text(
                        "HORIZON ",
                        style: TextStyle(
                            color:Color(0xffFEB139),
                            fontWeight: FontWeight.bold,
                            fontFamily:'Poppins',
                            fontSize:22
                        )

                    ),
                  ],
                ),
              ),
            ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
          child: Text(
              "NAVIGATING THE ",
              style: TextStyle(
                  color:Color(0xffF55353),
                  fontWeight: FontWeight.bold,
                  fontFamily:'Poppins',
                  fontSize:22
              )
          ),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 30, 0),
            child: Container(
              color: Colors.transparent,
              child: MergeSemantics(
                child: Wrap(
                  children: [
                    Text(
                        "HYPER",
                        style: TextStyle(
                            color:Color(0xffFEB139),
                            fontWeight: FontWeight.bold,
                            fontFamily:'Poppins',
                            fontSize:22
                        )
                    ),
                    Text(
                        "-CONNECTED WORLD",
                        style: TextStyle(
                            color:Color(0xffF55353),
                            fontWeight: FontWeight.bold,
                            fontFamily:'Poppins',
                            fontSize:22
                        )
                    ),
                  ],
                ),
              ),
            ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(22, 0, 18, 8),
          child: Container(
            child:Column(
              children: [
                Text(
                  text1,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                  child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          if(text1State==0){
                            text1State=1;
                          }else{
                            text1State=0;
                          }
                        });
                      },
                    child: const Text("Read More",style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Poppins'
                    ),),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffF55353),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(22, 0, 18, 8),
          child:Container(
           child: MergeSemantics(
             child: Wrap(
               children: [
                 Text(
                     "ABOUT ",
                     style: TextStyle(
                         color: Color(0xffF55353),
                         fontFamily:'Poppins',
                         fontWeight: FontWeight.bold,
                         fontSize:22
                     )

                 ),

                 Text(
                     "LOGIN ",
                     style: TextStyle(
                         color:Color(0xffFEB139),
                         fontFamily:'Poppins',
                         fontWeight: FontWeight.bold,
                         fontSize:22
                     )

                 ),
               ],
             ),
           ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(22, 0, 18, 8),
          child: Container(
            child:Column(
              children: [
                Text(
                  text2,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 0, 18, 70),
                  child: ElevatedButton(
                    onPressed: (){
                      setState(() {
                        if(text2State==0){
                          text2State=1;
                        }else{
                          text2State=0;
                        }
                      });
                    },
                    child: const Text("Read More",style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Poppins'
                    ),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffF55353),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Flex(
            direction: Axis.horizontal,
            children:<Widget> [
              Flexible(
                flex:11,
                child: Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    reverse: true,
                    itemBuilder: (BuildContext context, int index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.redAccent,
                          ),
                          height: 50,
                          width: 100,
                        ),
                      );
                    },
                    itemCount: 10,
                ),
            ),
              ),
              const Flexible(
                flex: 1,
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Text("EVENTS",style: TextStyle(color: Colors.redAccent,),
                  )
              )
              )
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Flex(
              direction: Axis.horizontal,
              children:<Widget> [
                const Flexible(
                    flex: 1,
                    child: RotatedBox(
                        quarterTurns: 3,
                        child: Text("PROGRAMS",style: TextStyle(color: Colors.redAccent,),
                        )
                    )
                ),
                Flexible(
                  flex:11,
                  child: Container(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      reverse: false,
                      itemBuilder: (BuildContext context, int index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.redAccent,
                            ),
                          ),
                        );
                      },
                      itemCount: 10,
                    ),
                  ),
                ),
              ]),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Flex(
              direction: Axis.horizontal,
              children:<Widget> [
                Flexible(
                  flex:11,
                  child: Container(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      itemBuilder: (BuildContext context, int index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.redAccent,
                            ),
                          ),
                        );
                      },
                      itemCount: 10,
                    ),
                  ),
                ),
                const Flexible(
                    flex: 1,
                    child: RotatedBox(
                        quarterTurns: 1,
                        child: Text("STALLS",style: TextStyle(color: Colors.redAccent,),
                        )
                    )
                )
              ]),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Flex(
              direction: Axis.horizontal,
              children:<Widget> [
                const Flexible(
                    flex: 1,
                    child: RotatedBox(
                        quarterTurns: 3,
                        child: Text("ACCESSORIES",style: TextStyle(color: Colors.redAccent,),
                        )
                    )
                ),
                Flexible(
                  flex:11,
                  child: Container(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      reverse: false,
                      itemBuilder: (BuildContext context, int index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.redAccent,
                            ),
                          ),
                        );
                      },
                      itemCount: 10,
                    ),
                  ),
                ),
              ]),
        ),
      ],
    );
  }
}

class eventsPage extends StatefulWidget{
  @override
  State<eventsPage> createState() => _eventsPageState();
}

class _eventsPageState extends State<eventsPage> {
  @override
  Widget build(BuildContext context){
    return Center(child: Container(child: const Text('events page',style: TextStyle(color: Colors.white))));
  }
}

class schedulePage extends StatefulWidget{
  @override
  State<schedulePage> createState() => _schedulePageState();
}

class _schedulePageState extends State<schedulePage> {
  @override
  Widget build(BuildContext context){
    return Center(child: Container(child: const Text('schedule page',style: TextStyle(color: Colors.white))));
  }
}




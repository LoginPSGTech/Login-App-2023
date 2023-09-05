import 'package:flutter/material.dart';
class SchedulePage extends StatefulWidget{
  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final List<String> eventname23 = <String>[
    'star-of-login',
    'inquizitives',
    'algocode',
    'triple-troble',
    'thinklytics',
    'techiadz'
  ];

  final List<String> eventvenue23 = <String>[
    'Fblock',
    'Fblock',
    'Fblock',
    'Fblock',
    'Fblock',
    'Fblock'
  ];

  final List<String> timehrs23 = <String>["09","09","09","09","09","09"];

  final List<String> timemin23 = <String>["30","30","30","30","30","30"];

  final List<int> colorCodes23 = <int>[0xFF4A148C];

  final List<String> ampm23 = <String>['AM','AM','AM','AM','AM','AM',];

  final List<String> eventname24 = <String>[
    'hero-of-login',
    'inquizitives',
    'algocode',
    'triple-troble',
    'thinklytics',
    'techiadz'
  ];

  final List<String> eventvenue24 = <String>[
    'Fblock',
    'Fblock',
    'Fblock',
    'Fblock',
    'Fblock',
    'Fblock'
  ];

  final List<String> timehrs24 = <String>["09","09","09","09","09","09"];

  final List<String> timemin24 = <String>["30","30","30","30","30","30"];

  //final List<String> colorCodes24 = <String>[0xFF4A148C];
  final List<String> ampm24 = <String>['AM','AM','AM','AM','AM','AM',];

  late var finallist;

  int buttonvalue=0;

  late var state23;

  late var state24;

  @override
  Widget build(BuildContext context) {

    switch(buttonvalue){
      case 0:
        finallist=[
          eventname23,
          eventvenue23,
          timehrs23,
          timemin23,
          ampm23,
        ];
        state23=const Color(0xFF123E6B);
        state24=const Color(0xFF121F2C);
        break;
      case 1:
        finallist=[
          eventname24,
          eventvenue24,
          timehrs24,
          timemin24,
          ampm24,
        ];
        state23=const Color(0xFF121F2C);
        state24=const Color(0xFF123E6B);
        break;
    }

    return Scaffold(
      body: Container(
          color: Colors.black,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Flexible(
                flex: 2,
                child: Card(
                  color: Colors.transparent,
                  margin: const EdgeInsets.fromLTRB(10, 45, 10, 10),
                  child: Row(
                    children: [
                      const Spacer(
                        flex:1,
                      ),
                      const Text(
                        'Schedule',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      const Spacer(
                        flex: 6,
                      ),
                      ElevatedButton(
                        onPressed: (){
                          setState(() {
                            if(buttonvalue!=0)
                            {
                              buttonvalue=0;
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: state23,
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)))
                        ),
                        child: const Text("23rd",style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 12,),),
                      ),
                      ElevatedButton(
                        onPressed: (){
                          setState(() {
                            if(buttonvalue!=1)
                            {
                              buttonvalue=1;
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: state24,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))),
                        ),
                        child: const Text("24th",style: TextStyle(color: Color(0xFF858585),fontSize: 12),),
                      ),
                      const Spacer(
                          flex:1
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 10,
                child: Container(
                  height: double.infinity,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context,int index){
                      return Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 31),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFF123E6B),
                        ),
                        height: 100,

                        child:Row(
                          children: [
                            const SizedBox(width: 20,),
                            Text(finallist[2][index],style: const TextStyle(color: Color(0xFFF55353),fontSize: 45,fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,),),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,20,0,20),
                              child: Column(
                                  children: [
                                    Text(finallist[3][index],style: const TextStyle(color: Color(0xFFF55353),fontSize: 16,fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,),),
                                    Text(finallist[4][index],style: const TextStyle(color: Color(0xFFF55353),fontSize: 16,fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,),),
                                  ]
                              ),
                            ),
                            const Spacer(flex: 1,),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(18,20,0,0),
                              child: Column(
                                  children:[Text(finallist[0][index],style: const TextStyle(color: Color(0xFFFEB139),fontSize: 20,fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,),),
                                    const SizedBox(height: 7,),
                                    Text(finallist[1][index],style: const TextStyle(color: Colors.white,fontSize: 12,fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,),),
                                  ]
                              ),
                            ),
                            const Spacer(flex: 1,),
                          ],
                        ),

                        // title: Text("event"),
                        // subtitle: Text("venue"),

                      );
                    },
                    itemCount: 6,
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
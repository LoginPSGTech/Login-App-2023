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
        state23=Color(0xFF123E6B);
        state24=Color(0xFF121F2C);
        break;
      case 1:
        finallist=[
          eventname24,
          eventvenue24,
          timehrs24,
          timemin24,
          ampm24,
        ];
        state23=Color(0xFF121F2C);
        state24=Color(0xFF123E6B);
        break;
    }

    return Scaffold(
      body: Container(
          color: Colors.black,
          //padding:EdgeInsets.all(25),
          child: Flex(
            direction: Axis.vertical,
            children: [
              Flexible(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(35,35,0,0),
                  child: Row(
                    children: [
                      Text(
                        'Schedule',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 64,
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
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)))
                        ),
                        child: Text("23rd",style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 16,),),
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
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))),
                        ),
                        child: Text("24th",style: TextStyle(color: Color(0xFF858585),fontSize: 16),),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 10,
                child: ListView.builder(
                  itemBuilder: (BuildContext context,int index){
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(52,31,23,0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF123E6B),
                        ),
                        height: 100,

                        child:Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(16,24,0,28),
                              child: Text(finallist[2][index],style: TextStyle(color: Color(0xFFF55353),fontSize: 40,fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,),),
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(6,28,0,24),
                              child: Column(
                                  children: [
                                    Text(finallist[3][index],style: TextStyle(color: Color(0xFFF55353),fontSize: 16,fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,),),
                                    Text(finallist[4][index],style: TextStyle(color: Color(0xFFF55353),fontSize: 16,fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,),),
                                  ]
                              ),
                            ),


                            Padding(
                              padding: EdgeInsets.fromLTRB(18,20,0,0),
                              child: Column(
                                  children:[Text(finallist[0][index],style: TextStyle(color: Color(0xFFFEB139),fontSize: 20,fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,),),
                                    SizedBox(height: 7,),
                                    Text(finallist[1][index],style: TextStyle(color: Colors.white,fontSize: 12,fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,),),
                                  ]
                              ),
                            ),
                          ],
                        ),

                        // title: Text("event"),
                        // subtitle: Text("venue"),

                      ),
                    );
                  },
                  itemCount: 6,
                ),
              )

            ],
          )
      ),
    );
  }
}
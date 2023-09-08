import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:login/providers/app_data_provider.dart';


class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> colored=<int>[600,500,100];
  late var descriptionButtonText;
  late var aboutButtonText;
  late var descriptiontext,abouttext;
  int descriptionState=0;
  int aboutState=0;
  late var event;
  @override
  Widget build(BuildContext context){
    final appData = Provider.of<AppDataProvider>(context).appData;
    final event=appData.mscEvents;
    switch(descriptionState){
      case 0:
        descriptionButtonText="Read More";
        descriptiontext=appData.home.description;
        break;
      case 1:
        descriptionButtonText="Read Less";
        descriptiontext=appData.home.description+appData.home.addeddescription;
        break;
    }
    switch(aboutState){
      case 0:
        aboutButtonText="Read More";
        abouttext=appData.home.about;
        break;
      case 1:
        aboutButtonText="Read Less";
        abouttext=appData.home.about+appData.home.addedabout;
        break;

    }
    return SafeArea(
      child: ListView(
        children: [
          //title image
          Padding(
            padding: const EdgeInsets.fromLTRB(86, 70, 86, 30),
            child:Container(
              height: 61,
              width: 188,
              child: Image.asset(
                  'assets/images/login.png'
              ),
            ),
          ),
          //title digital horizon
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
          //title navigating the
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 30, 0),
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
          //title hyper -connected world
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
            child: Container(
              color: Colors.transparent,
              child: const MergeSemantics(
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
          //description
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 0, 18, 8),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 1500),
              child: Container(
                child:Column(
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      transitionBuilder: (Widget child, Animation<double> animation){
                        return FadeTransition(opacity: animation,child: child,);
                      },
                      child: Text(
                        descriptiontext,
                        key: ValueKey<String>(descriptiontext),
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
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: ElevatedButton(
                        onPressed: (){
                          setState(() {
                            if(descriptionState==0){
                              descriptionState=1;
                            }else{
                              descriptionState=0;
                            }
                          });
                        },
                        child: Text(
                          descriptionButtonText,style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Poppins'
                        ),),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: const Size(double.infinity, 40),
                          backgroundColor: const Color(0xffF55353),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          //about login
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 0, 18, 8),
            child:Container(
              child: const MergeSemantics(
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
          //about
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 0, 18, 0),
            child: Container(
              child:Column(
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    transitionBuilder: (Widget child, Animation<double> animation){
                      return FadeTransition(opacity: animation,child: child,);
                    },
                    child: Text(
                      abouttext,
                      key: ValueKey<String>(abouttext),
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
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                    child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          if(aboutState==0){
                            aboutState=1;
                          }else{
                            aboutState=0;
                          }
                        });
                      },
                      child: Text(aboutButtonText,style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Poppins'
                      ),),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: const Color(0xffF55353),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          //events
          Padding(
            padding: const EdgeInsets.all(10),
            child: Flex(
                direction: Axis.horizontal,
                children:<Widget> [
                  const Flexible(
                      flex: 1,
                      child: RotatedBox(
                          quarterTurns: 3,
                          child: Text("EVENTS",style: TextStyle(color: Colors.redAccent,),
                          )
                      )
                  ),
                  Flexible(
                    flex:11,
                    child: Container(
                      height: 192,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        reverse: false,
                        itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                // image: DecorationImage(
                                //     image: AssetImage(event[index].eventLogo),
                                //     fit: BoxFit.cover,
                                // ),
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xff123E6B),
                              ),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  color: Colors.transparent,
                                  child: Text(event[index].eventName,style: const TextStyle(color: Colors.white,fontSize: 11),),
                                ),
                              ),
                              height: 192,
                              width: 108,
                            ),
                          );
                        },
                        itemCount: 8,
                      ),
                    ),
                  ),
                ]),
          ),
          //programs
          Padding(
            padding: const EdgeInsets.all(10),
            child: Flex(
                direction: Axis.horizontal,
                children:<Widget> [
                  Flexible(
                    flex:11,
                    child: Container(
                      height: 192,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        reverse: true,
                        itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                // image: DecorationImage(
                                //     image: AssetImage(event[index].eventLogo),
                                //     fit: BoxFit.cover,
                                // ),
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xff123E6B),
                              ),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  color: Colors.transparent,
                                  child: const Text("Programs",style: TextStyle(color: Colors.white,fontSize: 11),),
                                ),
                              ),
                              height: 192,
                              width: 108,
                            ),
                          );
                        },
                        itemCount: 8,
                      ),
                    ),
                  ),
                  const Flexible(
                      flex: 1,
                      child: RotatedBox(
                          quarterTurns: 1,
                          child:  Text("PROGRAMS",style: TextStyle(color: Colors.redAccent,),
                          )
                      )
                  ),
                ]),
          ),
          //stalls
          Padding(
            padding: const EdgeInsets.all(10),
            child: Flex(
                direction: Axis.horizontal,
                children:<Widget> [
                  const Flexible(
                      flex: 1,
                      child: RotatedBox(
                          quarterTurns: 3,
                          child: Text("STALLS",style: TextStyle(color: Colors.redAccent,),
                          )
                      )
                  ),
                  Flexible(
                    flex:11,
                    child: Container(
                      height: 192,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        reverse: false,
                        itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                // image: DecorationImage(
                                //     image: AssetImage(event[index].eventLogo),
                                //     fit: BoxFit.cover,
                                // ),
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xff123E6B),
                              ),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  color: Colors.transparent,
                                  child: const Text("Stalls",style: TextStyle(color: Colors.white,fontSize: 11),),
                                ),
                              ),
                              height: 192,
                              width: 108,
                            ),
                          );
                        },
                        itemCount: 8,
                      ),
                    ),
                  ),
    
                ]),
          ),
          //accessories
          Padding(
            padding: const EdgeInsets.all(10),
            child: Flex(
                direction: Axis.horizontal,
                children:<Widget> [
                  Flexible(
                    flex:11,
                    child: Container(
                      height: 192,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        reverse: true,
                        itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                // image: DecorationImage(
                                //     image: AssetImage(event[index].eventLogo),
                                //     fit: BoxFit.cover,
                                // ),
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xff123E6B),
                              ),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  color: Colors.transparent,
                                  child: const Text("Accessories",style: TextStyle(color: Colors.white,fontSize: 11),),
                                ),
                              ),
                              height: 192,
                              width: 108,
                            ),
                          );
                        },
                        itemCount: 8,
                      ),
                    ),
                  ),
                  const Flexible(
                      flex: 1,
                      child: RotatedBox(
                          quarterTurns: 1,
                          child: Text("ACCESSORIES",style: TextStyle(color: Colors.redAccent,),
                          )
                      )
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
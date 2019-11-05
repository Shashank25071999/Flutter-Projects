import 'package:flutter/material.dart';
import 'package:screens/secondscreen.dart';
import 'package:screens/thirdScreen.dart';

void main() {
  runApp(MaterialApp(
    home: SecondScreen(),
  ));
}

class FirstScreen extends StatefulWidget {
  var timming;
  
  String nameofativity;var member;
  FirstScreen(this.timming,this.nameofativity,this.member);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FirstScreenState(timming,nameofativity,member);
  }
}

class Time{
  var starttime;
  var endtime;
  Color selectedcolor;
}

class FirstScreenState extends State<FirstScreen> {
  var timming;
  void initState() {
    super.initState();
    
    builder();
    
  }
  int _selectedIndex = 0;
    _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  String nameofativity;var member;
  FirstScreenState(this.timming,this.nameofativity,this.member);
  List<Time>usertime=[];
  var progressvariable=false;
  Color boxcolor = Colors.white;
  int val = 0;
  int peoplelength = 0;
  Text peoplevalue = Text(
    "0",
    style: TextStyle(color: Colors.white),
  );
  Text timing = Text(
    "Not Selected",
    style: TextStyle(color: Colors.white),
  );
  
  void builder(){
    setState(() {
     progressvariable=true; 
    });
     List<Widget>totalboxes=[];
    // for(int i=0;i<timming.length;i++){
    //   print(timming[i]);
    // }

    for(int i=0;i<timming.length;i=i+2){
    var start=timming[i];
    var stop =timming[i+1];
    // print(start);
    // print(stop);
    var firsttime;
    var secondtime;
    
    
    for(int i=start;i<stop;i=i+2){
      Time user=Time();
       user.starttime=i;
      user.selectedcolor=Colors.orangeAccent;
      // print(i);
      if(i+2<=stop){
         user.endtime=i+2;
        // print(i+2);
      }
      else{
       user.endtime=i+1;
        // print(i+1);
      }
      usertime.add(user);
    }

      
    }
      // Widget box= Padding(
      //                           padding: const EdgeInsets.all(8.0),
      //                           child: GestureDetector(
      //                             onTap: () {
      //                               timing = Text(
      //                                 "${firsttime.toString()}"+"-"+"${secondtime.toString()}",
      //                                 style: TextStyle(color: Colors.white),
      //                               );
      //                               val = 1;
      //                               boxcolor = Colors.orangeAccent;
      //                               setState(() {});
      //                             },
      //                             child: Card(
      //                               shape: RoundedRectangleBorder(
      //                                 borderRadius:
      //                                     BorderRadius.circular(6.0),
      //                               ),
      //                               elevation: 6.0,
      //                               child: Container(
      //                                 decoration: BoxDecoration(
      //                                     borderRadius: BorderRadius.all(
      //                                         Radius.circular(6.0)),
      //                                     color: val == 1
      //                                         ? boxcolor
      //                                         : Colors.white,
      //                                     border: Border.all(
      //                                         color: Colors.grey.shade500)),
      //                                 height: 55.0, // height of the button
      //                                 width: 60.0, // width of the button
      //                                 child: Center(child: Text("${firsttime.toString()}"+"-"+"${secondtime.toString()}",style: TextStyle(color: val==1?Colors.white:Colors.grey.shade600))),
      //                               ),
      //                             ),
      //                           ),
      //                         );

      // totalboxes.add(box);
      
    
  
  // print(usertime[1].starttime);
  // print(usertime[1].endtime);
for(int i=0;i<usertime.length;i++){
    print(usertime[i].starttime);
    print(usertime[i].endtime);
  }
  setState(() {
   progressvariable=false; 
  });
  
  
  }
  Color tapcolor=Colors.white;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return progressvariable?Scaffold(body: Center(child: CircularProgressIndicator(),),):Scaffold(
      // bottomNavigationBar: Container(
      //   width: MediaQuery.of(context).size.width,
      //   color: Color.fromRGBO(116, 49, 155, 20),
      //   height: 90.0,
      //   child: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Row(
      //       children: <Widget>[
      //         CircleAvatar(),
      //         Padding(
      //           padding: const EdgeInsets.only(left: 12.0),
      //           child: Column(
      //             children: <Widget>[
      //               Text(
      //                 "No. of People",
      //                 style: TextStyle(color: Colors.white),
      //               ),
      //               Text(
      //                 "Select Timing",
      //                 style: TextStyle(color: Colors.white),
      //               ),
      //             ],
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.only(left: 12.0),
      //           child: Column(
      //             children: <Widget>[peoplevalue, timing],
      //           ),
      //         ),
      //         SizedBox(
      //           width: 40.0,
      //         ),
      //         Expanded(
      //             child: RaisedButton(
      //           onPressed: () {},
      //           child: Text("data"),
      //         ))
      //       ],
      //     ),
      //   ),
      // ),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(116, 49, 155, 20),
        title: Text("Book"),
      ),
      body: Column(
        children: <Widget>[
          
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
              padding:
                  EdgeInsets.only(top: 8.0, bottom: 2, left: 5.0, right: 5.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                  child: Row(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(22.0),
                          child: CircleAvatar(
                            minRadius: 50.0,
                            backgroundColor: Color.fromRGBO(116, 49, 155, 20),
                          )),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(nameofativity,
                            
                                style: TextStyle(fontSize: 20,
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.bold,
                                    // fontSize: 20.0
                                    )),
                            SizedBox(
                              height: 5.0,
                            ),
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Icon(Icons.access_time,color: Colors.grey.shade500,),
                                Container(width: MediaQuery.of(context).size.width*0.5,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:2.0,left: 2),
                                    child: Text(member.timeslot,overflow: TextOverflow.clip,style: TextStyle(color: Colors.grey.shade700),),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Icon(Icons.blur_linear,color: Colors.grey.shade500),
                                Padding(
                                  padding: const EdgeInsets.only(top:2.0,left: 2),
                                  child: Text(member.capacity.toString(),style: TextStyle(color: Colors.grey.shade700)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: member.available>member.capacity/2?Colors.lightGreen:Colors.orangeAccent,
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                    padding: EdgeInsets.only(
                                        left: 20.0, right: 20, top: 2, bottom: 3),
                                    child: Center(
                                      child: Text(member.available>member.capacity/2?"Vacant":"Fill Fast",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                          )),
                                    ),
                                  ),
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width/6,),
                                Row(
                                  children: <Widget>[
                                    Text("Book",style: TextStyle(color: Color.fromRGBO(116, 49, 155, 20),fontSize: 15 ),),
                                    Icon(Icons.play_arrow,color:  Color.fromRGBO(116, 49, 155, 20),)
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ),
            ),
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Select Timings",
                        style: TextStyle(color: Colors.grey.shade700,
                            fontWeight: FontWeight.normal, fontSize: 20.0),
                      ),
                    ),
                    padding: EdgeInsets.only(top: 8.0, left:33, bottom: 5),
                  ),
                  Container(height: MediaQuery.of(context).size.width/2,
                    child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),itemCount: usertime.length,itemBuilder: (context,int index){
                      return  GestureDetector(onTap: (){
                      val=1;
                      // print("${usertime[index].starttime}"+":"+"00"+"AM"+"-"+"${usertime[index].endtime}"+":"+"00"+"AM");
                      print(member.capacity);
                      usertime[index].starttime<12&&usertime[index].endtime>12?print("${usertime[index].starttime.toString()}"+":"+"00"+"AM"+"-"+"${(usertime[index].endtime-12).toString()}"+":"+"00"+"PM"):usertime[index].starttime>12&&usertime[index].endtime>12?print("${(usertime[index].starttime-12).toString()}"+":"+"00"+"PM"+"-"+"${(usertime[index].endtime-12).toString()}"+":"+"00"+"PM"):usertime[index].starttime>12&&usertime[index].endtime<12?print("${(usertime[index].starttime-12).toString()}"+":"+"00"+"PM"+"-"+"${usertime[index].endtime.toString()}"+":"+"00"+"AM"): print("${usertime[index].starttime.toString()}"+":"+"00"+"AM"+"-"+"${usertime[index].endtime.toString()}"+":"+"00"+"AM");
                      _onSelected(index);
                        timing=usertime[index].starttime<12&&usertime[index].endtime>12?Text("${usertime[index].starttime.toString()}"+"AM"+"-"+"${(usertime[index].endtime-12).toString()}"+"PM",style: TextStyle(color: Colors.white,fontSize: 12)):usertime[index].starttime>12&&usertime[index].endtime>12?Text("${(usertime[index].starttime-12).toString()}"+"PM"+"-"+"${(usertime[index].endtime-12).toString()}"+"PM",style: TextStyle(color: Colors.white,fontSize: 12)):usertime[index].starttime>12&&usertime[index].endtime<12?Text("${(usertime[index].starttime-12).toString()}"+"PM"+"-"+"${usertime[index].endtime.toString()}"+"AM",style: TextStyle(color: Colors.white,fontSize: 12)): Text("${usertime[index].starttime.toString()}"+"AM"+"-"+"${usertime[index].endtime.toString()}"+"AM",style: TextStyle(color: Colors.white,fontSize: 12));
                        setState(() {
                          
                        });
                      },
                        child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(6.0),
                                    ),
                                    elevation: 6.0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6.0)),
                                          color: _selectedIndex != null && _selectedIndex == index?Colors.orangeAccent:Colors.white,
                                            
                                
                                          border: Border.all(
                                              color: Colors.grey.shade500)),
                                      height: 55.0, // height of the button
                                      width: 60.0, // width of the button
                                      child: Center(child:usertime[index].starttime<12&&usertime[index].endtime>12?Text("${usertime[index].starttime.toString()}"+"AM"+"-"+"${(usertime[index].endtime-12).toString()}"+"PM",style: TextStyle(color: _selectedIndex != null && _selectedIndex == index?Colors.white:Colors.grey.shade600,fontSize: 12)):usertime[index].starttime>12&&usertime[index].endtime>12?Text("${(usertime[index].starttime-12).toString()}"+"PM"+"-"+"${(usertime[index].endtime-12).toString()}"+"PM",style: TextStyle(color: _selectedIndex != null && _selectedIndex == index?Colors.white:Colors.grey.shade600,fontSize: 12)):usertime[index].starttime>12&&usertime[index].endtime<12?Text("${(usertime[index].starttime-12).toString()}"+"PM"+"-"+"${usertime[index].endtime.toString()}"+"AM",style: TextStyle(color: _selectedIndex != null && _selectedIndex == index?Colors.white:Colors.grey.shade600,fontSize: 12)): Text("${usertime[index].starttime.toString()}"+"AM"+"-"+"${usertime[index].endtime.toString()}"+"AM",style: TextStyle(color: _selectedIndex != null && _selectedIndex == index?Colors.white:Colors.grey.shade600,fontSize: 12))),
                                    ),
                                  ),
                                ),
                      );
                    },),
                  )
                  // Padding(
                  //   padding: const EdgeInsets.only(left:12.0,right: 12,top: 10,bottom: 10),
                  //   child: Column(
                  //     children: <Widget>[
                  //       Padding(
                  //         padding: const EdgeInsets.all(2.0),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //           children: <Widget>[
                  //             Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: GestureDetector(
                  //                 onTap: () {
                  //                   timing = Text(
                  //                     "2-4am",
                  //                     style: TextStyle(color: Colors.white),
                  //                   );
                  //                   val = 1;
                  //                   boxcolor = Colors.orangeAccent;
                  //                   setState(() {});
                  //                 },
                  //                 child: Card(
                  //                   shape: RoundedRectangleBorder(
                  //                     borderRadius:
                  //                         BorderRadius.circular(6.0),
                  //                   ),
                  //                   elevation: 6.0,
                  //                   child: Container(
                  //                     decoration: BoxDecoration(
                  //                         borderRadius: BorderRadius.all(
                  //                             Radius.circular(6.0)),
                  //                         color: val == 1
                  //                             ? boxcolor
                  //                             : Colors.white,
                  //                         border: Border.all(
                  //                             color: Colors.grey.shade500)),
                  //                     height: 55.0, // height of the button
                  //                     width: 60.0, // width of the button
                  //                     child: Center(child: Text('2-4am',style: TextStyle(color: val==1?Colors.white:Colors.grey.shade600))),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //             Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: GestureDetector(
                  //                 onTap: () {
                  //                   timing = Text(
                  //                     "4-6pm",
                  //                     style: TextStyle(color: Colors.white),
                  //                   );
                  //                   val = 2;
                  //                   boxcolor = Colors.orangeAccent;
                  //                   setState(() {});
                  //                 },
                  //                 child: Card(
                  //                   shape: RoundedRectangleBorder(
                  //                     borderRadius:
                  //                         BorderRadius.circular(6.0),
                  //                   ),
                  //                   elevation: 6.0,
                  //                   child: Container(
                  //                     decoration: BoxDecoration(
                  //                         borderRadius: BorderRadius.all(
                  //                             Radius.circular(6.0)),
                  //                         color: val == 2
                  //                             ? boxcolor
                  //                             : Colors.white,
                  //                         border: Border.all(
                  //                             color: Colors.grey.shade500)),
                  //                     height: 55.0, // height of the button
                  //                     width: 60.0, // width of the button
                  //                     child: Center(child: Text('4-6pm',style: TextStyle(color: val==2?Colors.white:Colors.grey.shade600))),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //             Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: GestureDetector(
                  //                 onTap: () {
                  //                   timing = Text(
                  //                     "6-8pm",
                  //                     style: TextStyle(color: Colors.white),
                  //                   );
                  //                   val = 3;
                  //                   boxcolor = Colors.orangeAccent;
                  //                   setState(() {});
                  //                 },
                  //                 child: Card(
                  //                   shape: RoundedRectangleBorder(
                  //                     borderRadius:
                  //                         BorderRadius.circular(6.0),
                  //                   ),
                  //                   elevation: 6.0,
                  //                   child: Container(
                  //                     decoration: BoxDecoration(
                  //                         borderRadius: BorderRadius.all(
                  //                             Radius.circular(6.0)),
                  //                         color: val == 3
                  //                             ? boxcolor
                  //                             : Colors.white,
                  //                         border: Border.all(
                  //                             color: Colors.grey.shade500)),
                  //                     height: 55.0,
                  //                     width: 60.0,
                  //                     child: Center(child: Text('6-8pm',style: TextStyle(color: val==3?Colors.white:Colors.grey.shade600))),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //             Padding(
                  //               padding: const EdgeInsets.all(10.0),
                  //               child: GestureDetector(
                  //                 onTap: () {
                  //                   timing = Text(
                  //                     "8-9am",
                  //                     style: TextStyle(color: Colors.white),
                  //                   );
                  //                   val = 4;
                  //                   boxcolor = Colors.orangeAccent;
                  //                   setState(() {});
                  //                 },
                  //                 child: Card(
                  //                   shape: RoundedRectangleBorder(
                  //                     borderRadius:
                  //                         BorderRadius.circular(6.0),
                  //                   ),
                  //                   elevation: 6.0,
                  //                   child: Container(
                  //                     decoration: BoxDecoration(
                  //                         borderRadius: BorderRadius.all(
                  //                             Radius.circular(6.0)),
                  //                         // boxShadow: [
                  //                         //   BoxShadow(
                  //                         //     color: Colors.black,
                  //                         //     spreadRadius: 200.0,
                  //                         //   )
                  //                         // ],
                  //                         color: val == 4
                  //                             ? boxcolor
                  //                             : Colors.white,
                  //                         border: Border.all(
                  //                             color: Colors.grey.shade500)),
                  //                     height: 55.0, // height of the button
                  //                     width: 60.0, // width of the button
                  //                     child: Center(child: Text('8-9am',style: TextStyle(color: val==4?Colors.white:Colors.grey.shade600))),
                  //                   ),
                  //                 ),
                  //               ),
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.all(2.0),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //           children: <Widget>[
                  //             Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: GestureDetector(
                  //                 onTap: () {
                  //                   timing = Text(
                  //                     "3-4pm",
                  //                     style: TextStyle(color: Colors.white),
                  //                   );
                  //                   val = 5;
                  //                   boxcolor = Colors.orangeAccent;
                  //                   setState(() {});
                  //                 },
                  //                 child: Card(
                  //                   shape: RoundedRectangleBorder(
                  //                     borderRadius:
                  //                         BorderRadius.circular(6.0),
                  //                   ),
                  //                   elevation: 6.0,
                  //                   child: Container(
                  //                     decoration: BoxDecoration(
                  //                         borderRadius: BorderRadius.all(
                  //                             Radius.circular(6.0)),
                  //                         color: val == 5
                  //                             ? boxcolor
                  //                             : Colors.white,
                  //                         border: Border.all(
                  //                             color: Colors.grey.shade500)),
                  //                     height: 55.0, // height of the button
                  //                     width: 60.0, // width of the button
                  //                     child: Center(child: Text('3-4pm',style: TextStyle(color: val==5?Colors.white:Colors.grey.shade600))),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //             Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: GestureDetector(
                  //                 onTap: () {
                  //                   timing = Text(
                  //                     "7-9pm",
                  //                     style: TextStyle(color: Colors.white),
                  //                   );
                  //                   val = 6;
                  //                   boxcolor = Colors.orangeAccent;
                  //                   setState(() {});
                  //                 },
                  //                 child: Card(
                  //                   shape: RoundedRectangleBorder(
                  //                     borderRadius:
                  //                         BorderRadius.circular(6.0),
                  //                   ),
                  //                   elevation: 6.0,
                  //                   child: Container(
                  //                     decoration: BoxDecoration(
                  //                         borderRadius: BorderRadius.all(
                  //                             Radius.circular(6.0)),
                  //                         color: val == 6
                  //                             ? boxcolor
                  //                             : Colors.white,
                  //                         border: Border.all(
                  //                             color: Colors.grey.shade500)),
                  //                     height: 55.0, // height of the button
                  //                     width: 60.0, // width of the button
                  //                     child: Center(child: Text('7-9pm',style: TextStyle(color: val==6?Colors.white:Colors.grey.shade600))),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //             Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: GestureDetector(
                  //                 onTap: () {
                  //                   timing = Text(
                  //                     "8-9pm",
                  //                     style: TextStyle(color: Colors.white),
                  //                   );
                  //                   val = 7;
                  //                   boxcolor = Colors.orangeAccent;
                  //                   setState(() {});
                  //                 },
                  //                 child: Card(
                  //                   shape: RoundedRectangleBorder(
                  //                     borderRadius:
                  //                         BorderRadius.circular(6.0),
                  //                   ),
                  //                   elevation: 6.0,
                  //                   child: Container(
                  //                     decoration: BoxDecoration(
                  //                         borderRadius: BorderRadius.all(
                  //                             Radius.circular(6.0)),
                  //                         color: val == 7
                  //                             ? boxcolor
                  //                             : Colors.white,
                  //                         border: Border.all(
                  //                             color: Colors.grey.shade500)),
                  //                     height: 55.0, // height of the button
                  //                     width: 60.0, // width of the button
                  //                     child: Center(child: Text('8-9pm',style: TextStyle(color: val==7?Colors.white:Colors.grey.shade600))),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //             Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: GestureDetector(
                  //                 onTap: () {
                  //                   timing = Text(
                  //                     "6-7pm",
                  //                     style: TextStyle(color: Colors.white),
                  //                   );
                  //                   val = 8;
                  //                   boxcolor = Colors.orangeAccent;
                  //                   setState(() {});
                  //                 },
                  //                 child: Card(
                  //                   shape: RoundedRectangleBorder(
                  //                     borderRadius:
                  //                         BorderRadius.circular(6.0),
                  //                   ),
                  //                   elevation: 6.0,
                  //                   child: Container(
                  //                     decoration: BoxDecoration(
                  //                         borderRadius: BorderRadius.all(
                  //                             Radius.circular(6.0)),
                  //                         color: val == 8
                  //                             ? boxcolor
                  //                             : Colors.white,
                  //                         border: Border.all(
                  //                             color: Colors.grey.shade500)),
                  //                     height: 55.0, // height of the button
                  //                     width: 60.0, // width of the button
                  //                     child: Center(child: Text('6-7am',style: TextStyle(color: val==8?Colors.white:Colors.grey.shade600))),
                  //                   ),
                  //                 ),
                  //               ),
                  //             )
                  //           ],
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  ,
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "No. of People",
                        style: TextStyle(color: Colors.grey.shade700,
                            fontWeight: FontWeight.normal, fontSize: 20.0),
                      ),
                    ),
                    padding: EdgeInsets.only(bottom: 2, left: 33,top: 10),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    peoplevalue = Text(
                                      "1",
                                      style: TextStyle(color: Colors.white),
                                    );
                                    peoplelength = 1;
                                    boxcolor = Colors.orangeAccent;
                                    setState(() {});
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(6.0),
                                    ),
                                    elevation: 6,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6.0)),
                                          color: peoplelength == 1
                                              ? boxcolor
                                              : Colors.white,
                                          border: Border.all(
                                              color: Colors.grey.shade500)),
                                      height: 55.0, // height of the button
                                      width: 60.0, // width of the button
                                      child: Center(child: Text('1',style: TextStyle(color: peoplelength==1?Colors.white:Colors.grey.shade600),)),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    peoplevalue = Text(
                                      "2",
                                      style: TextStyle(color: Colors.white),
                                    );
                                    peoplelength = 2;
                                    boxcolor = Colors.orangeAccent;
                                    setState(() {});
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(6.0),
                                    ),
                                    elevation: 6,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6.0)),
                                          color: peoplelength == 2
                                              ? boxcolor
                                              : Colors.white,
                                          border: Border.all(
                                              color: Colors.grey.shade500)),
                                      height: 55.0, // height of the button
                                      width: 60.0, // width of the button
                                      child: Center(child: Text('2',style: TextStyle(color: peoplelength==2?Colors.white:Colors.grey.shade600))),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    peoplevalue = Text(
                                      "3",
                                      style: TextStyle(color: Colors.white),
                                    );
                                    peoplelength = 3;
                                    boxcolor = Colors.orangeAccent;
                                    setState(() {});
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(6.0),
                                    ),
                                    elevation: 6,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6.0)),
                                          color: peoplelength == 3
                                              ? boxcolor
                                              : Colors.white,
                                          border: Border.all(
                                              color: Colors.grey.shade500)),
                                      height: 55.0, // height of the button
                                      width: 60.0, // width of the button
                                      child: Center(child: Text('3',style: TextStyle(color: peoplelength==3?Colors.white:Colors.grey.shade600))),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    peoplevalue = Text(
                                      "4",
                                      style: TextStyle(color: Colors.white),
                                    );
                                    peoplelength = 4;
                                    boxcolor = Colors.orangeAccent;
                                    setState(() {});
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(6.0),
                                    ),
                                    elevation: 6,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6.0)),
                                          color: peoplelength == 4
                                              ? boxcolor
                                              : Colors.white,
                                          border: Border.all(
                                              color: Colors.grey.shade500)),
                                      height: 55.0, // height of the button
                                      width: 60.0, // width of the button
                                      child: Center(child: Text('4',style: TextStyle(color: peoplelength==4?Colors.white:Colors.grey.shade600))),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    peoplevalue = Text(
                                      "5",
                                      style: TextStyle(color: Colors.white),
                                    );
                                    peoplelength = 5;
                                    boxcolor = Colors.orangeAccent;
                                    setState(() {});
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(6.0),
                                    ),
                                    elevation: 6,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6.0)),
                                          color: peoplelength == 5
                                              ? boxcolor
                                              : Colors.white,
                                          border: Border.all(
                                              color: Colors.grey.shade500)),
                                      height: 55.0, // height of the button
                                      width: 60.0, // width of the button
                                      child: Center(child: Text('5',style: TextStyle(color: peoplelength==5?Colors.white:Colors.grey.shade600))),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    peoplevalue = Text(
                                      "6",
                                      style: TextStyle(color: Colors.white),
                                    );
                                    peoplelength = 6;
                                    boxcolor = Colors.orangeAccent;
                                    setState(() {});
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(6.0),
                                    ),
                                    elevation: 6,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6.0)),
                                          color: peoplelength == 6
                                              ? boxcolor
                                              : Colors.white,
                                          border: Border.all(
                                              color: Colors.grey.shade500)),
                                      height: 55.0, // height of the button
                                      width: 60.0, // width of the button
                                      child: Center(child: Text('6',style: TextStyle(color: peoplelength==6?Colors.white:Colors.grey.shade600))),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    peoplevalue = Text(
                                      "7",
                                      style: TextStyle(color: Colors.white),
                                    );
                                    peoplelength = 7;
                                    boxcolor = Colors.orangeAccent;
                                    setState(() {});
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(6.0),
                                    ),
                                    elevation: 6,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6.0)),
                                          color: peoplelength == 7
                                              ? boxcolor
                                              : Colors.white,
                                          border: Border.all(
                                              color: Colors.grey.shade500)),
                                      height: 55.0, // height of the button
                                      width: 60.0, // width of the button
                                      child: Center(child: Text('7',style: TextStyle(color: peoplelength==7?Colors.white:Colors.grey.shade600))),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    peoplevalue = Text(
                                      "8",
                                      style: TextStyle(color: Colors.white),
                                    );
                                    peoplelength = 8;
                                    boxcolor = Colors.orangeAccent;
                                    setState(() {});
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(6.0),
                                    ),
                                    elevation: 6,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6.0)),
                                          color: peoplelength == 8
                                              ? boxcolor
                                              : Colors.white,
                                          border: Border.all(
                                              color: Colors.grey.shade500)),
                                      height: 55.0, // height of the button
                                      width: 60.0, // width of the button
                                      child: Center(child: Text('8',style: TextStyle(color: peoplelength==8?Colors.white:Colors.grey.shade600))),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.0,)
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.all(6.0),
              child: Container(
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: CircleAvatar(
                        minRadius: 25,
                        child: Icon(
                          Icons.perm_contact_calendar,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12, top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "10 Oct'19",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              peoplevalue,
                              SizedBox(
                                width: 2.0,
                              ),
                              Text(
                                "People",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          timing
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 6),
                          child: GestureDetector(
                            onTap: () {
                              print("object");
                              
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text("Book Now",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 4.0, right: 4.0),
                                    child: Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:screens/thirdScreen.dart';

class SecondScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SecondScreenState();
  }
}
class Avabilty{
    int capacity;
    int totalbooked;
    int  available;
    String timeslot;
    String aminityid;
  }
  List<Avabilty>members=[];

class SecondScreenState extends State<SecondScreen> {
  
   void initState() {
    super.initState();
    
    getData();
    
  }
  
   var data;
   bool progressindicator=false;

 


  Future<void> getData() async {
    progressindicator=true;
    setState(() {
      
    });
    Map<String, dynamic> societydata = {
      "token": "conexo",
      "society_code": "1"
    };
    http.post(
        "http://conexo.in/main/conexo/public/index.php/api/customer/amenitieslist",
        body: json.encode(societydata),
        headers: {
          "Content-Type": "application/json"
        }).then((http.Response response) {
            print(response.body);
             data=json.decode(response.body);
             for(int i=0;i<data.length;i++){
             Avabilty object=Avabilty();
             object.capacity=int.parse(data[i]["capacity"]);
             object.totalbooked=int.parse(data[i]["total_booked"]);
             object.available=object.capacity-object.totalbooked;
             object.timeslot=data[i]["timings"];
             object.aminityid=data[i]["id"];
            //  print(object.timeslot);
             members.add(object);
            //  print(object.available);
            //  print(object.capacity);

             }

             progressindicator=false;
             setState(() {
               
             });

    });
  }
  

  void divideTimeSLot(String index,String nameofativity,var member){
    
    // print(index);
     String s = index;
  String k=s.replaceAll(new RegExp(','),'-'); 
  var b=(k.split('-'));
  List<int> timing=[];

  
  
  
  for(int i=0;i<b.length;i++){

    var newString = b[i].substring(b[i].length - 2);
//     print(newString);
//     var count=0;
    if(newString =="PM"){
     var firsttwo=b[i].substring(0,2);
//       print(firsttwo);
      String originalvalue=firsttwo.replaceAll(new RegExp(':'),''); 
//       print(originalvalue);
      var intvalue=int.parse(originalvalue);
      intvalue=intvalue+12;
      timing.add(intvalue);  
    }
    else{
      var firsttwo=b[i].substring(0,2);
//       print(firsttwo);
      String originalvalue=firsttwo.replaceAll(new RegExp(':'),''); 
//       print(originalvalue);
      var intvalue=int.parse(originalvalue);
      timing.add(intvalue);  
      
    }
  }

  Navigator.push(context, MaterialPageRoute(builder: (context)=>ThirdScreen(timing,nameofativity,member)));
  
  
  
  
 
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return progressindicator?Scaffold(body: Center(child: CircularProgressIndicator(),),):Scaffold(
      appBar: AppBar(backgroundColor: Color.fromRGBO(116, 49, 155, 20),
        title: Text("Ammenities",),
      ),
      body: ListView.builder(
        itemBuilder: (context, int index) {
          return GestureDetector(onTap: (){
                       divideTimeSLot(members[index].timeslot,data[index]["name"],members[index]);
          },
                      child: Container(
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
                            Text(data[index]["name"],
                            
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
                                    child: Text(data[index]["timings"],overflow: TextOverflow.clip,style: TextStyle(color: Colors.grey.shade700),),
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
                                  child: Text(data[index]["capacity"],style: TextStyle(color: Colors.grey.shade700)),
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
                                      color: members[index].available>members[index].capacity/2?Colors.lightGreen:Colors.orangeAccent,
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                    padding: EdgeInsets.only(
                                        left: 20.0, right: 20, top: 2, bottom: 3),
                                    child: Center(
                                      child: Text(members[index].available>members[index].capacity/2?"Vacant":"Fill Fast",
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
          );

        },
     itemCount: data.length, ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SecondScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SecondScreenState();
  }
}

class SecondScreenState extends State<SecondScreen> {
   void initState() {
    super.initState();
    
    getData();
  }
  
 


  Future<void> getData() async {
    Map<String, dynamic> societydata = {
      "token": "conexo",
      "society_id": "1"
    };
    http.post(
        "http://conexo.in/main/conexo/public/index.php/api/customer/amenitieslist",
        body: json.encode(societydata),
        headers: {
          "Content-Type": "application/json"
        }).then((http.Response response) {
            print(response.body);
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromRGBO(116, 49, 155, 20),
        title: Text("Ammenities",),
      ),
      body: ListView.builder(
        itemBuilder: (context, int index) {
          return Container(
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
                          Text("Swimming Pool",
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0)),
                          SizedBox(
                            height: 5.0,
                          ),
                          // RaisedButton(onPressed: (){
                          //   getData();
                          // },),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.access_time,color: Colors.grey.shade500,),
                              Padding(
                                padding: const EdgeInsets.only(top:2.0,left: 2),
                                child: Text("5:00am-9:00pm",style: TextStyle(color: Colors.grey.shade700),),
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
                                child: Text("150 Bookings",style: TextStyle(color: Colors.grey.shade700)),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.lightGreen,
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              padding: EdgeInsets.only(
                                  left: 20.0, right: 20, top: 2, bottom: 3),
                              child: Center(
                                child: Text("Vacant",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                    )),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top:120.0,),
                          child: Row(
                            children: <Widget>[
                              Text("Book",style: TextStyle(color: Color.fromRGBO(116, 49, 155, 20),fontSize: 15 ),),
                              Icon(Icons.play_arrow,color:  Color.fromRGBO(116, 49, 155, 20),)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );

        },
     itemCount: 5, ),
    );
  }
}

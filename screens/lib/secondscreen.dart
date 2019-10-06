import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SecondScreenState();
  }
}

class SecondScreenState extends State<SecondScreen> {
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
                EdgeInsets.only(top: 8.0, bottom: 5, left: 8.0, right: 8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
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
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.access_time),
                              Text("5:00am-9:00pm")
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.blur_linear),
                              Text("150 Bookings")
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
                                  left: 16.0, right: 16, top: 6, bottom: 6),
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
                              Text("Book",style: TextStyle(color: Color.fromRGBO(116, 49, 155, 20) ),),
                              Icon(Icons.play_circle_outline,color:  Color.fromRGBO(116, 49, 155, 20),)
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

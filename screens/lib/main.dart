import 'package:flutter/material.dart';
import 'package:screens/secondscreen.dart';
import 'package:screens/thirdScreen.dart';

void main() {
  runApp(MaterialApp(
    home: ThirdScreen(),
  ));
}

class FirstScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FirstScreenState();
  }
}

class FirstScreenState extends State<FirstScreen> {
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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
                    padding: EdgeInsets.only(
                        top: 12.0, bottom: 10, left: 12.0, right: 12.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 10.0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                        child: Row(
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.all(22.0),
                                child: CircleAvatar(
                                  minRadius: 50.0,
                                  backgroundColor:
                                      Color.fromRGBO(116, 49, 155, 20),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                      ),
                                      padding: EdgeInsets.only(
                                          left: 16.0,
                                          right: 16,
                                          top: 6,
                                          bottom: 6),
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
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Select Timing",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ),
                    padding: EdgeInsets.only(top: 5.0, left: 15, bottom: 5),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:12.0,right: 12,top: 10,bottom: 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
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
                                      timing = Text(
                                        "2-4am",
                                        style: TextStyle(color: Colors.white),
                                      );
                                      val = 1;
                                      boxcolor = Colors.lightGreen;
                                      setState(() {});
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      elevation: 10.0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            color: val == 1
                                                ? boxcolor
                                                : Colors.white,
                                            border: Border.all(
                                                color: Colors.grey.shade700)),
                                        height: 50.0, // height of the button
                                        width: 50.0, // width of the button
                                        child: Center(child: Text('2-4am')),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      timing = Text(
                                        "4-6pm",
                                        style: TextStyle(color: Colors.white),
                                      );
                                      val = 2;
                                      boxcolor = Colors.lightGreen;
                                      setState(() {});
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      elevation: 10.0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            color: val == 2
                                                ? boxcolor
                                                : Colors.white,
                                            border: Border.all(
                                                color: Colors.grey.shade700)),
                                        height: 50.0, // height of the button
                                        width: 50.0, // width of the button
                                        child: Center(child: Text('4-6pm')),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      timing = Text(
                                        "6-8pm",
                                        style: TextStyle(color: Colors.white),
                                      );
                                      val = 3;
                                      boxcolor = Colors.lightGreen;
                                      setState(() {});
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      elevation: 10.0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            color: val == 3
                                                ? boxcolor
                                                : Colors.white,
                                            border: Border.all(
                                                color: Colors.grey.shade700)),
                                        height: 50.0,
                                        width: 50.0,
                                        child: Center(child: Text('6-8pm')),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      timing = Text(
                                        "8-9am",
                                        style: TextStyle(color: Colors.white),
                                      );
                                      val = 4;
                                      boxcolor = Colors.lightGreen;
                                      setState(() {});
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      elevation: 10.0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            // boxShadow: [
                                            //   BoxShadow(
                                            //     color: Colors.black,
                                            //     spreadRadius: 200.0,
                                            //   )
                                            // ],
                                            color: val == 4
                                                ? boxcolor
                                                : Colors.white,
                                            border: Border.all(
                                                color: Colors.grey.shade700)),
                                        height: 50.0, // height of the button
                                        width: 50.0, // width of the button
                                        child: Center(child: Text('8-9am')),
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
                                      timing = Text(
                                        "3-4pm",
                                        style: TextStyle(color: Colors.white),
                                      );
                                      val = 5;
                                      setState(() {});
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      elevation: 10.0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            color: val == 5
                                                ? boxcolor
                                                : Colors.white,
                                            border: Border.all(
                                                color: Colors.grey.shade700)),
                                        height: 50.0, // height of the button
                                        width: 50.0, // width of the button
                                        child: Center(child: Text('3-4pm')),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      timing = Text(
                                        "7-9pm",
                                        style: TextStyle(color: Colors.white),
                                      );
                                      val = 6;
                                      boxcolor = Colors.lightGreen;
                                      setState(() {});
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      elevation: 10.0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            color: val == 6
                                                ? boxcolor
                                                : Colors.white,
                                            border: Border.all(
                                                color: Colors.grey.shade700)),
                                        height: 50.0, // height of the button
                                        width: 50.0, // width of the button
                                        child: Center(child: Text('7-9pm')),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      timing = Text(
                                        "8-9pm",
                                        style: TextStyle(color: Colors.white),
                                      );
                                      val = 7;
                                      boxcolor = Colors.lightGreen;
                                      setState(() {});
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      elevation: 10.0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            color: val == 7
                                                ? boxcolor
                                                : Colors.white,
                                            border: Border.all(
                                                color: Colors.grey.shade700)),
                                        height: 50.0, // height of the button
                                        width: 50.0, // width of the button
                                        child: Center(child: Text('8-9pm')),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      timing = Text(
                                        "6-7pm",
                                        style: TextStyle(color: Colors.white),
                                      );
                                      val = 8;
                                      boxcolor = Colors.lightGreen;
                                      setState(() {});
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      elevation: 10.0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            color: val == 8
                                                ? boxcolor
                                                : Colors.white,
                                            border: Border.all(
                                                color: Colors.grey.shade700)),
                                        height: 50.0, // height of the button
                                        width: 50.0, // width of the button
                                        child: Center(child: Text('6-7am')),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "No. of People",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ),
                    padding: EdgeInsets.only(bottom: 2, left: 15,top: 10),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
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
                                      boxcolor = Colors.lightGreen;
                                      setState(() {});
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      elevation: 10,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            color: peoplelength == 1
                                                ? boxcolor
                                                : Colors.white,
                                            border: Border.all(
                                                color: Colors.grey.shade700)),
                                        height: 50.0, // height of the button
                                        width: 50.0, // width of the button
                                        child: Center(child: Text('1')),
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
                                      boxcolor = Colors.lightGreen;
                                      setState(() {});
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      elevation: 10,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            color: peoplelength == 2
                                                ? boxcolor
                                                : Colors.white,
                                            border: Border.all(
                                                color: Colors.grey.shade700)),
                                        height: 50.0, // height of the button
                                        width: 50.0, // width of the button
                                        child: Center(child: Text('2')),
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
                                      boxcolor = Colors.lightGreen;
                                      setState(() {});
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      elevation: 10,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            color: peoplelength == 3
                                                ? boxcolor
                                                : Colors.white,
                                            border: Border.all(
                                                color: Colors.grey.shade700)),
                                        height: 50.0, // height of the button
                                        width: 50.0, // width of the button
                                        child: Center(child: Text('3')),
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
                                      boxcolor = Colors.lightGreen;
                                      setState(() {});
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      elevation: 10,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            color: peoplelength == 4
                                                ? boxcolor
                                                : Colors.white,
                                            border: Border.all(
                                                color: Colors.grey.shade700)),
                                        height: 50.0, // height of the button
                                        width: 50.0, // width of the button
                                        child: Center(child: Text('4')),
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
                                      peoplelength = 1;
                                      boxcolor = Colors.lightGreen;
                                      setState(() {});
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      elevation: 10,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            color: peoplelength == 1
                                                ? boxcolor
                                                : Colors.white,
                                            border: Border.all(
                                                color: Colors.grey.shade700)),
                                        height: 50.0, // height of the button
                                        width: 50.0, // width of the button
                                        child: Center(child: Text('5')),
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
                                      peoplelength = 2;
                                      boxcolor = Colors.lightGreen;
                                      setState(() {});
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      elevation: 10,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            color: peoplelength == 2
                                                ? boxcolor
                                                : Colors.white,
                                            border: Border.all(
                                                color: Colors.grey.shade700)),
                                        height: 50.0, // height of the button
                                        width: 50.0, // width of the button
                                        child: Center(child: Text('6')),
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
                                      peoplelength = 3;
                                      boxcolor = Colors.lightGreen;
                                      setState(() {});
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      elevation: 10,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            color: peoplelength == 3
                                                ? boxcolor
                                                : Colors.white,
                                            border: Border.all(
                                                color: Colors.grey.shade700)),
                                        height: 50.0, // height of the button
                                        width: 50.0, // width of the button
                                        child: Center(child: Text('7')),
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
                                      peoplelength = 4;
                                      boxcolor = Colors.lightGreen;
                                      setState(() {});
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      elevation: 10,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            color: peoplelength == 4
                                                ? boxcolor
                                                : Colors.white,
                                            border: Border.all(
                                                color: Colors.grey.shade700)),
                                        height: 50.0, // height of the button
                                        width: 50.0, // width of the button
                                        child: Center(child: Text('8')),
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

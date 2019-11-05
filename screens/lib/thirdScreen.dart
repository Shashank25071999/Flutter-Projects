import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:screens/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ThirdScreen extends StatefulWidget {
  var timing;
  String nameofativity;var member;
  ThirdScreen(this.timing,this.nameofativity,this.member);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ThirdScreenState(timing,nameofativity,member);
  }
}

class TimeSlotData{
  String time_slot;
  String total_booked;
  String booking_date;
}


DateTime now = DateTime.now();
String string = DateFormat('dd').format(now);
String string1 = DateFormat('MM').format(now);
String string2 = DateFormat('yyyy').format(now);
var userselectedDate;
int date = int.parse(string);
int month = int.parse(string1);
int year = int.parse(string2);
String selecteddatevalue="Selected";
List<TimeSlotData> timeslotdata=[];

class ThirdScreenState extends State<ThirdScreen> {
  var timing;
  String dateselcted;
  bool progressindicator=false;
  String nameofativity;var member;
  ThirdScreenState(this.timing,this.nameofativity,this.member);
  List<int> montharray = [];
  List<String>datestringarray=[];
  List<String>monthstringarray=[];
  List<int> datearray = [];
  List<int> yeararray = [];
  Color selecteddate = Colors.orangeAccent;
  int val = 0;
  bool leapyear = false;
  @override
  void initState() {
    day(date, month, year);
    
    super.initState();
  }

    Future<void> slotbooking() async {
    progressindicator=true;
    setState(() {
      
    });
    print(dateselcted);
    Map<String, dynamic> societydata = {
      "token":"conexo",
      "society_code":"1",
      "amenity_id":member.aminityid,
      "booking_date":"07/10/2019"
      //dateselcted
    };
    http.post(
        "http://conexo.in/main/conexo/public/index.php/api/customer/slotavalibility",
        body: json.encode(societydata),
        headers: {
          "Content-Type": "application/json"
        }).then((http.Response response) {
            print(response.body);
           var responsebody=json.decode(response.body);
           print(responsebody.length);
             for(int i =0;i<responsebody.length;i++){

             }

             progressindicator=false;
             setState(() {
               
             });
             Navigator.push(context, MaterialPageRoute(builder: (context)=>FirstScreen(timing,nameofativity,member)));

    });
  }
  


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(116, 49, 155, 20),
          title: Text(
            "Ammenities",
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 28, right: 10, left: 40),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Select Booking Date",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 19),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: 15.0, left: 15, top: 15, bottom: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left:8.0,right: 2,top: 8,bottom:2),
                            child: GestureDetector(
                              onTap: () {
                                dateselcted=datestringarray[0].toString()+"/"+monthstringarray[0].toString()+"/"+yeararray[0].toString();
                                print(dateselcted);
                                val = 1;
                                selecteddatevalue=datearray[0].toString() + ( montharray[0] == 1
                                            ? " Jan' "
                                            : montharray[0] == 2
                                                ? " Feb' "
                                                : montharray[0] == 3
                                                    ? " Mar' "
                                                    : montharray[0] == 4
                                                        ? " Apr' "
                                                        : montharray[0] == 5
                                                            ? " May' "
                                                            : montharray[0] == 6
                                                                ? " Jun' "
                                                                : montharray[
                                                                            0] ==
                                                                        7
                                                                    ? " July' "
                                                                    : montharray[0] ==
                                                                            8
                                                                        ? " Aug' "
                                                                        : montharray[0] ==
                                                                                9
                                                                            ?  " Sep' "
                                                                            : montharray[0] == 10
                                                                                ? " Oct' "
                                                                                : montharray[0] == 11 ? " Nov' " : montharray[0] == 12 ? " Dec' " : "selected") + yeararray[0].toString();
                                setState(() {userselectedDate=selecteddatevalue;
                                print(userselectedDate);});
                              },
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Container(
                                  child: Center(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        datearray[0].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: val == 1
                                                ? Colors.white
                                                : Colors.grey,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        montharray[0] == 1
                                            ? "Jan'"
                                            : montharray[0] == 2
                                                ? "Feb'"
                                                : montharray[0] == 3
                                                    ? "Mar"
                                                    : montharray[0] == 4
                                                        ? "Apr'"
                                                        : montharray[0] == 5
                                                            ? "May'"
                                                            : montharray[0] == 6
                                                                ? "Jun'"
                                                                : montharray[
                                                                            0] ==
                                                                        7
                                                                    ? "July'"
                                                                    : montharray[0] ==
                                                                            8
                                                                        ? "Aug'"
                                                                        : montharray[0] ==
                                                                                9
                                                                            ? "Sep'"
                                                                            : montharray[0] == 10
                                                                                ? "Oct'"
                                                                                : montharray[0] == 11 ? "Nov'" : montharray[0] == 12 ? "Dec" : "selected",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: val == 1
                                                ? Colors.white
                                                : Colors.grey,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        yeararray[0].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: val == 1
                                                ? Colors.white
                                                : Colors.grey,
                                            fontSize: 18),
                                      ),
                                    ],
                                  )),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    color:
                                        val == 1 ? selecteddate : Colors.white,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  height: 150,
                                  width: 160,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:2.0,right: 8,bottom:2 ,top: 8),
                            child: GestureDetector(
                              onTap: () {
                                dateselcted=datestringarray[1].toString()+"/"+monthstringarray[1].toString()+"/"+yeararray[1].toString();
                                print(dateselcted);
                                val = 2;
                                  selecteddatevalue=datearray[1].toString() + ( montharray[1] == 1
                                            ? " Jan' "
                                            : montharray[1] == 2
                                                ? " Feb' "
                                                : montharray[1] == 3
                                                    ? " Mar' "
                                                    : montharray[1] == 4
                                                        ? " Apr' "
                                                        : montharray[1] == 5
                                                            ? " May' "
                                                            : montharray[1] == 6
                                                                ? " Jun' "
                                                                : montharray[
                                                                            1] ==
                                                                        7
                                                                    ? " July' "
                                                                    : montharray[1] ==
                                                                            8
                                                                        ? " Aug' "
                                                                        : montharray[1] ==
                                                                                9
                                                                            ?  " Sep' "
                                                                            : montharray[1] == 10
                                                                                ? " Oct' "
                                                                                : montharray[1] == 11 ? " Nov' " : montharray[1] == 12 ? " Dec' " : "NOtselected") + yeararray[0].toString();
                                setState(() {userselectedDate=selecteddatevalue;
                                print(userselectedDate);});
                              },
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Container(
                                  child: Center(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        datearray[1].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: val == 2
                                                ? Colors.white
                                                : Colors.grey,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        montharray[1] == 1
                                            ? "Jan'"
                                            : montharray[1] == 2
                                                ? "Feb'"
                                                : montharray[1] == 3
                                                    ? "Mar"
                                                    : montharray[1] == 4
                                                        ? "Apr'"
                                                        : montharray[1] == 5
                                                            ? "May'"
                                                            : montharray[1] == 6
                                                                ? "Jun'"
                                                                : montharray[
                                                                            1] ==
                                                                        7
                                                                    ? "July'"
                                                                    : montharray[1] ==
                                                                            8
                                                                        ? "Aug'"
                                                                        : montharray[1] ==
                                                                                9
                                                                            ? "Sep'"
                                                                            : montharray[1] == 10
                                                                                ? "Oct'"
                                                                                : montharray[1] == 11 ? "Nov'" : montharray[1] == 12 ? "Dec" : "NOtselected",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: val == 2
                                                ? Colors.white
                                                : Colors.grey,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        yeararray[1].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: val == 2
                                                ? Colors.white
                                                : Colors.grey,
                                            fontSize: 18),
                                      ),
                                    ],
                                  )),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    color:
                                        val == 2 ? selecteddate : Colors.white,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  height: 150,
                                  width: 160,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 15.0, right: 15, top: 2, bottom: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left:8.0,right: 2,top: 2,bottom: 2),
                            child: GestureDetector(
                              onTap: () {
                                dateselcted=datestringarray[2].toString()+"/"+monthstringarray[2].toString()+"/"+yeararray[2].toString();
                                print(dateselcted);
                                
                                val = 3;
                                  selecteddatevalue=datearray[2].toString() + ( montharray[2] == 1
                                            ? " Jan' "
                                            : montharray[2] == 2
                                                ? " Feb' "
                                                : montharray[2] == 3
                                                    ? " Mar' "
                                                    : montharray[2] == 4
                                                        ? " Apr' "
                                                        : montharray[2] == 5
                                                            ? " May' "
                                                            : montharray[2] == 6
                                                                ? " Jun' "
                                                                : montharray[
                                                                            2] ==
                                                                        7
                                                                    ? " July' "
                                                                    : montharray[2] ==
                                                                            8
                                                                        ? " Aug' "
                                                                        : montharray[2] ==
                                                                                9
                                                                            ?  " Sep' "
                                                                            : montharray[2] == 10
                                                                                ? " Oct' "
                                                                                : montharray[2] == 11 ? " Nov' " : montharray[2] == 12 ? " Dec' " : "NOtselected") + yeararray[0].toString();
                                setState(() {userselectedDate=selecteddatevalue;
                                print(userselectedDate);});
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                elevation: 5,
                                child: Container(
                                  child: Center(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        datearray[2].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: val == 3
                                                ? Colors.white
                                                : Colors.grey,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        montharray[2] == 1
                                            ? "Jan'"
                                            : montharray[2] == 2
                                                ? "Feb'"
                                                : montharray[2] == 3
                                                    ? "Mar"
                                                    : montharray[2] == 4
                                                        ? "Apr'"
                                                        : montharray[2] == 5
                                                            ? "May'"
                                                            : montharray[2] == 6
                                                                ? "Jun'"
                                                                : montharray[
                                                                            2] ==
                                                                        7
                                                                    ? "July'"
                                                                    : montharray[2] ==
                                                                            8
                                                                        ? "Aug'"
                                                                        : montharray[2] ==
                                                                                9
                                                                            ? "Sep'"
                                                                            : montharray[2] == 10
                                                                                ? "Oct'"
                                                                                : montharray[2] == 11 ? "Nov'" : montharray[2] == 12 ? "Dec" : "NOtselected",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: val == 3
                                                ? Colors.white
                                                : Colors.grey,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        yeararray[2].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: val == 3
                                                ? Colors.white
                                                : Colors.grey,
                                            fontSize: 18),
                                      ),
                                    ],
                                  )),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    color:
                                        val == 3 ? selecteddate : Colors.white,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  height: 150,
                                  width: 160,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right:8.0,top: 2,left: 2,bottom: 2),
                            child: GestureDetector(
                              onTap: () {
                                dateselcted=datestringarray[3].toString()+"/"+monthstringarray[3].toString()+"/"+yeararray[3].toString();
                                print(dateselcted);
                                val = 4;
                                  selecteddatevalue=datearray[3].toString() + ( montharray[3] == 1
                                            ? " Jan' "
                                            : montharray[3] == 2
                                                ? " Feb' "
                                                : montharray[3] == 3
                                                    ? " Mar' "
                                                    : montharray[3] == 4
                                                        ? " Apr' "
                                                        : montharray[3] == 5
                                                            ? " May' "
                                                            : montharray[3] == 6
                                                                ? " Jun' "
                                                                : montharray[
                                                                            3] ==
                                                                        7
                                                                    ? " July' "
                                                                    : montharray[3] ==
                                                                            8
                                                                        ? " Aug' "
                                                                        : montharray[3] ==
                                                                                9
                                                                            ?  " Sep' "
                                                                            : montharray[3] == 10
                                                                                ? " Oct' "
                                                                                : montharray[3] == 11 ? " Nov' " : montharray[3] == 12 ? " Dec' " : "NOtselected") + yeararray[0].toString();
                                setState(() {userselectedDate=selecteddatevalue;
                                print(userselectedDate);});
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                elevation: 5,
                                child: Container(
                                  child: Center(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        datearray[3].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: val == 4
                                                ? Colors.white
                                                : Colors.grey,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        montharray[3] == 1
                                            ? "Jan'"
                                            : montharray[3] == 2
                                                ? "Feb'"
                                                : montharray[3] == 3
                                                    ? "Mar"
                                                    : montharray[3] == 4
                                                        ? "Apr'"
                                                        : montharray[3] == 5
                                                            ? "May'"
                                                            : montharray[3] == 6
                                                                ? "Jun'"
                                                                : montharray[
                                                                            3] ==
                                                                        7
                                                                    ? "July'"
                                                                    : montharray[3] ==
                                                                            8
                                                                        ? "Aug'"
                                                                        : montharray[3] ==
                                                                                9
                                                                            ? "Sep'"
                                                                            : montharray[3] == 10
                                                                                ? "Oct'"
                                                                                : montharray[3] == 11 ? "Nov'" : montharray[3] == 12 ? "Dec" : "NOtselected",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: val == 4
                                                ? Colors.white
                                                : Colors.grey,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        yeararray[3].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: val == 4
                                                ? Colors.white
                                                : Colors.grey,
                                            fontSize: 18),
                                      ),
                                    ],
                                  )),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    color:
                                        val == 4 ? selecteddate : Colors.white,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  height: 150,
                                  width: 160,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 15.0, right: 15, top: 2, bottom: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left:8.0,right: 2,top: 2,bottom: 2),
                            child: GestureDetector(
                              onTap: () {
                                dateselcted=datestringarray[4].toString()+"/"+monthstringarray[4].toString()+"/"+yeararray[4].toString();
                                print(dateselcted);
                                val = 5;
                                  selecteddatevalue=datearray[4].toString() + ( montharray[4] == 1
                                            ? " Jan' "
                                            : montharray[4] == 2
                                                ? " Feb' "
                                                : montharray[4] == 3
                                                    ? " Mar' "
                                                    : montharray[4] == 4
                                                        ? " Apr' "
                                                        : montharray[4] == 5
                                                            ? " May' "
                                                            : montharray[4] == 6
                                                                ? " Jun' "
                                                                : montharray[
                                                                            4] ==
                                                                        7
                                                                    ? " July' "
                                                                    : montharray[4] ==
                                                                            8
                                                                        ? " Aug' "
                                                                        : montharray[4] ==
                                                                                9
                                                                            ?  " Sep' "
                                                                            : montharray[4] == 10
                                                                                ? " Oct' "
                                                                                : montharray[4] == 11 ? " Nov' " : montharray[4] == 12 ? " Dec' " : "NOtselected") + yeararray[0].toString();
                                setState(() {userselectedDate=selecteddatevalue;
                                print(userselectedDate);});
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                elevation: 5,
                                child: Container(
                                  child: Center(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        datearray[4].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: val == 5
                                                ? Colors.white
                                                : Colors.grey,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        montharray[4] == 1
                                            ? "Jan'"
                                            : montharray[4] == 2
                                                ? "Feb'"
                                                : montharray[4] == 3
                                                    ? "Mar"
                                                    : montharray[4] == 4
                                                        ? "Apr'"
                                                        : montharray[4] == 5
                                                            ? "May'"
                                                            : montharray[4] == 6
                                                                ? "Jun'"
                                                                : montharray[
                                                                            4] ==
                                                                        7
                                                                    ? "July'"
                                                                    : montharray[4] ==
                                                                            8
                                                                        ? "Aug'"
                                                                        : montharray[4] ==
                                                                                9
                                                                            ? "Sep'"
                                                                            : montharray[4] == 10
                                                                                ? "Oct'"
                                                                                : montharray[4] == 11 ? "Nov'" : montharray[4] == 12 ? "Dec" : "NOtselected",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: val == 5
                                                ? Colors.white
                                                : Colors.grey,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        yeararray[4].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: val == 5
                                                ? Colors.white
                                                : Colors.grey,
                                            fontSize: 18),
                                      ),
                                    ],
                                  )),
                                  decoration: BoxDecoration(
                                    color:
                                        val == 5 ? selecteddate : Colors.white,
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  height: 150,
                                  width: 160,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right:8.0,top: 2,bottom: 2,left: 2),
                            child: GestureDetector(
                              onTap: () {
                                dateselcted=datestringarray[5].toString()+"/"+monthstringarray[5].toString()+"/"+yeararray[5].toString();
                                print(dateselcted);
                                val = 6;
                                  selecteddatevalue=datearray[5].toString() + ( montharray[5] == 1
                                            ? " Jan' "
                                            : montharray[5] == 2
                                                ? " Feb' "
                                                : montharray[5] == 3
                                                    ? " Mar' "
                                                    : montharray[5] == 4
                                                        ? " Apr' "
                                                        : montharray[5] == 5
                                                            ? " May' "
                                                            : montharray[5] == 6
                                                                ? " Jun' "
                                                                : montharray[
                                                                            5] ==
                                                                        7
                                                                    ? " July' "
                                                                    : montharray[5] ==
                                                                            8
                                                                        ? " Aug' "
                                                                        : montharray[5] ==
                                                                                9
                                                                            ?  " Sep' "
                                                                            : montharray[5] == 10
                                                                                ? " Oct' "
                                                                                : montharray[5] == 11 ? " Nov' " : montharray[5] == 12 ? " Dec' " : "NOtselected") + yeararray[0].toString();
                                setState(() {userselectedDate=selecteddatevalue;
                                print(userselectedDate);});
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                elevation: 5,
                                child: Container(
                                  child: Center(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        datearray[5].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: val == 6
                                                ? Colors.white
                                                : Colors.grey,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        montharray[5] == 1
                                            ? "Jan'"
                                            : montharray[5] == 2
                                                ? "Feb'"
                                                : montharray[5] == 3
                                                    ? "Mar"
                                                    : montharray[5] == 4
                                                        ? "Apr'"
                                                        : montharray[5] == 5
                                                            ? "May'"
                                                            : montharray[5] == 6
                                                                ? "Jun'"
                                                                : montharray[
                                                                            5] ==
                                                                        7
                                                                    ? "July'"
                                                                    : montharray[5] ==
                                                                            8
                                                                        ? "Aug'"
                                                                        : montharray[5] ==
                                                                                9
                                                                            ? "Sep'"
                                                                            : montharray[5] == 10
                                                                                ? "Oct'"
                                                                                : montharray[5] == 11 ? "Nov'" : montharray[5] == 12 ? "Dec" : "NOtselected",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: val == 6
                                                ? Colors.white
                                                : Colors.grey,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        yeararray[5].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: val == 6
                                                ? Colors.white
                                                : Colors.grey,
                                            fontSize: 18),
                                      ),
                                    ],
                                  )),
                                  decoration: BoxDecoration(
                                    color:
                                        val == 6 ? selecteddate : Colors.white,
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  height: 150,
                                  width: 160,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 15.0, right: 15, top: 2, bottom: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left:8.0,right: 2,top: 2,bottom: 2),
                            child: GestureDetector(
                              onTap: () {
                                dateselcted=datestringarray[6].toString()+"/"+monthstringarray[6].toString()+"/"+yeararray[6].toString();
                                print(dateselcted);
                                val = 7;
                                  selecteddatevalue=datearray[6].toString() + ( montharray[6] == 1
                                            ? " Jan' "
                                            : montharray[6] == 2
                                                ? " Feb' "
                                                : montharray[6] == 3
                                                    ? " Mar' "
                                                    : montharray[6] == 4
                                                        ? " Apr' "
                                                        : montharray[6] == 5
                                                            ? " May' "
                                                            : montharray[6] == 6
                                                                ? " Jun' "
                                                                : montharray[
                                                                            6] ==
                                                                        7
                                                                    ? " July' "
                                                                    : montharray[6] ==
                                                                            8
                                                                        ? " Aug' "
                                                                        : montharray[6] ==
                                                                                9
                                                                            ?  " Sep' "
                                                                            : montharray[6] == 10
                                                                                ? " Oct' "
                                                                                : montharray[6] == 11 ? " Nov' " : montharray[6] == 12 ? " Dec' " : "NOtselected") + yeararray[0].toString();
                                setState(() {userselectedDate=selecteddatevalue;
                                print(userselectedDate);});
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                elevation: 5,
                                child: Container(
                                  child: Center(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        datearray[6].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: val == 7
                                                ? Colors.white
                                                : Colors.grey,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        montharray[6] == 1
                                            ? "Jan'"
                                            : montharray[6] == 2
                                                ? "Feb'"
                                                : montharray[6] == 3
                                                    ? "Mar"
                                                    : montharray[6] == 4
                                                        ? "Apr'"
                                                        : montharray[6] == 5
                                                            ? "May'"
                                                            : montharray[6] == 6
                                                                ? "Jun'"
                                                                : montharray[
                                                                            6] ==
                                                                        7
                                                                    ? "July'"
                                                                    : montharray[6] ==
                                                                            8
                                                                        ? "Aug'"
                                                                        : montharray[6] ==
                                                                                9
                                                                            ? "Sep'"
                                                                            : montharray[6] == 10
                                                                                ? "Oct'"
                                                                                : montharray[6] == 11 ? "Nov'" : montharray[6] == 12 ? "Dec" : "NOtselected",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: val == 7
                                                ? Colors.white
                                                : Colors.grey,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        yeararray[6].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: val == 7
                                                ? Colors.white
                                                : Colors.grey,
                                            fontSize: 18),
                                      ),
                                    ],
                                  )),
                                  decoration: BoxDecoration(
                                    color:
                                        val == 7 ? selecteddate : Colors.white,
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  height: 150,
                                  width: 160,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right:8.0,top: 2,bottom: 2,left: 2),
                            child: GestureDetector(
                              onTap: () {
                                dateselcted=datestringarray[7].toString()+"/"+monthstringarray[7].toString()+"/"+yeararray[7].toString();
                                print(dateselcted);
                                val = 8;
                                  selecteddatevalue=datearray[7].toString() + ( montharray[7] == 1
                                            ? " Jan' "
                                            : montharray[7] == 2
                                                ? " Feb' "
                                                : montharray[7] == 3
                                                    ? " Mar' "
                                                    : montharray[7] == 4
                                                        ? " Apr' "
                                                        : montharray[7] == 5
                                                            ? " May' "
                                                            : montharray[7] == 6
                                                                ? " Jun' "
                                                                : montharray[
                                                                            7] ==
                                                                        7
                                                                    ? " July' "
                                                                    : montharray[7] ==
                                                                            8
                                                                        ? " Aug' "
                                                                        : montharray[7] ==
                                                                                9
                                                                            ?  " Sep' "
                                                                            : montharray[7] == 10
                                                                                ? " Oct' "
                                                                                : montharray[7] == 11 ? " Nov' " : montharray[7] == 12 ? " Dec' " : "NOtselected") + yeararray[0].toString();
                                setState(() {userselectedDate=selecteddatevalue;
                                print(userselectedDate);});
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                elevation: 5,
                                child: Container(
                                  child: Center(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        datearray[7].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: val == 8
                                                ? Colors.white
                                                : Colors.grey,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        montharray[7] == 1
                                            ? "Jan'"
                                            : montharray[7] == 2
                                                ? "Feb'"
                                                : montharray[7] == 3
                                                    ? "Mar"
                                                    : montharray[7] == 4
                                                        ? "Apr'"
                                                        : montharray[7] == 5
                                                            ? "May'"
                                                            : montharray[7] == 6
                                                                ? "Jun'"
                                                                : montharray[
                                                                            7] ==
                                                                        7
                                                                    ? "July'"
                                                                    : montharray[7] ==
                                                                            8
                                                                        ? "Aug'"
                                                                        : montharray[7] ==
                                                                                9
                                                                            ? "Sep'"
                                                                            : montharray[7] == 10
                                                                                ? "Oct'"
                                                                                : montharray[7] == 11 ? "Nov'" : montharray[7] == 12 ? "Dec" : "NOtselected",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: val == 8
                                                ? Colors.white
                                                : Colors.grey,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        yeararray[7].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: val == 8
                                                ? Colors.white
                                                : Colors.grey,
                                            fontSize: 18),
                                      ),
                                    ],
                                  )),
                                  decoration: BoxDecoration(
                                    color:
                                        val == 8 ? selecteddate : Colors.white,
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  height: 150,
                                  width: 160,
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
                          child: Center(
                            child: Icon(
                              Icons.perm_contact_calendar,
                              color: Colors.white,
                            ),
                          ),
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Center(
                          child: Text(
                            selecteddatevalue,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 19),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 9),
                            child: Builder(
                              builder: (context) => GestureDetector(
                                onTap: () {
                                  print("object");
                                  if(dateselcted==null){
                                    _displaySnackBar(context, "Please select a date");
                                  }
                                  else{
                                    slotbooking();
                                  }
                                  
                                  
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
                                        padding: EdgeInsets.only(
                                            left: 4.0, right: 4.0),
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
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  void day(int date, int month, int year) {
  //   for(int i=0,j=1;j<timing.length;i++,j++){
  //   var start=timing[i];
  //   var stop =timing[j];
    
  //   var total=(stop-start)/2;
  //   for(int i=start;i<stop;i=i+2){
  //     print(i);
  //     if(i+2<=stop){
  //       print(i+2);
  //     }
  //     else{
  //       print(i+1);
  //     }
      
      
  //   }
  // }
    // print(year);
    if (year % 400 == 0) {
      // print("leap year");
      leapyear = true;
    } else if (year % 100 == 0) {
      // print("not leap year");
      leapyear = false;
    } else if (year % 4 == 0 && year % 100 != 0) {
      // print("leap year");
      leapyear = true;
    } else {
      leapyear = false;
      // print("not leap year");
    }
    // months in which 31 days are present
    if (month == 1 ||
        month == 3 ||
        month == 5 ||
        month == 7 ||
        month == 8 ||
        month == 10 ||
        month == 12) {
      int maxdays = 31;

      for (int i = date, j = 1; i <= maxdays && j <= 8; i++, j++) {
        if (i == 31) {
          montharray.add(month);
          datearray.add(i);
          yeararray.add(year);
          date = 1;
          if (month < 12) {
            month = month + 1;
          } else {
            month = 1;
            year = year + 1;
          }
        } else {
          datearray.add(i);
          montharray.add(month);
          yeararray.add(year);
        }
      }
    }

    //months in which 30 days are present
    if ((month == 4 || month == 6 || month == 9 || month == 11) && month != 2) {
      int maxdays = 30;

      for (int i = date, j = 1; i <= maxdays && j <= 8; i++, j++) {
        if (i == 30) {
          montharray.add(month);
          datearray.add(i);
          yeararray.add(year);
          date = 1;
          if (month < 12) {
            month = month + 1;
          } else {
            month = 1;
            year = year + 1;
          }
        } else {
          datearray.add(i);
          montharray.add(month);
          yeararray.add(year);
        }
      }
    }

    //if month is feb

    if (month == 2) {
      if (leapyear) {
        int maxdays = 29;

        for (int i = date, j = 1; i <= maxdays && j <= 8; i++, j++) {
          if (i == 29) {
            montharray.add(month);
            datearray.add(i);
            yeararray.add(year);
            date = 1;
            if (month < 12) {
              month = month + 1;
            } else {
              month = 1;
              year = year + 1;
            }
          } else {
            datearray.add(i);
            montharray.add(month);
            yeararray.add(year);
          }
        }
      }
      //year is not a leap year
      else {
        int maxdays = 28;

        for (int i = date, j = 1; i <= maxdays && j <= 8; i++, j++) {
          if (i == 28) {
            montharray.add(month);
            datearray.add(i);
            yeararray.add(year);
            date = 1;
            if (month < 12) {
              month = month + 1;
            } else {
              month = 1;
              year = year + 1;
            }
          } else {
            datearray.add(i);
            montharray.add(month);
            yeararray.add(year);
          }
        }
      }
    }

    // for (int i = 0; i < datearray.length; i++) {
    //   print(datearray[i]);
    //   print(montharray[i]);
    //   print("\n");
    // }

    inttoString();
  }

  void inttoString(){

    for(int i=0;i<montharray.length;i++){

      var stringmonthtype=montharray[i].toString();
      var stringdatetype=datearray[i].toString();


      if(stringmonthtype.length==1){
        stringmonthtype="0"+stringmonthtype;
        monthstringarray.add(stringmonthtype);
      }
      else{
        monthstringarray.add(stringmonthtype);
      }

      if(stringdatetype.length==1){
        stringdatetype="0"+stringdatetype;
        datestringarray.add(stringdatetype);
      }
      else{
        datestringarray.add(stringdatetype);
      }
    }

    

  }

  _displaySnackBar(BuildContext context,String a) {
  final snackBar = SnackBar(content: Text(a));
  Scaffold.of(context).showSnackBar(snackBar);
}
}

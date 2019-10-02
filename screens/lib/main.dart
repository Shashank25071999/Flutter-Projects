import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: FirstScreen(),
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
    "Not Selected",
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
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        color: Color.fromRGBO(116, 49, 155, 20),
        height: 60.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Icon(Icons.info),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "No of People",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Timing",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  children: <Widget>[peoplevalue, timing],
                ),
              ),
              SizedBox(
                width: 40.0,
              ),
              Expanded(
                  child: RaisedButton(
                onPressed: () {},
                child: Text("data"),
              ))
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(116, 49, 155, 20),
        title: Text("Book"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  top: 42.0, bottom: 42, left: 12.0, right: 12.0),
              child: Card(elevation: 15.0,
                child: Row(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(22.0),
                        child: CircleAvatar(minRadius: 40.0,
                          backgroundColor: Color.fromRGBO(116, 49, 155, 20),
                        )),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text("Swimming Pool",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(children: <Widget>[Icon(Icons.access_time),Text("5:00am-9:00pm")],),
                          
                          SizedBox(
                            height: 5.0,
                          ),
                          Text("Occupancy",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0,backgroundColor: Colors.lightGreen))
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
                  "Timing",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              padding: EdgeInsets.all(15.0),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                timing = Text(
                                  "2-4",
                                  style: TextStyle(color: Colors.white),
                                );
                                val = 1;
                                boxcolor = Colors.lightGreen;
                                setState(() {});
                              },
                              child: Card(
                                elevation: 15.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: val == 1
                                          ? boxcolor
                                          : Colors.white,
                                      border:
                                          Border.all(color: Colors.black)),
                                  height: 50.0, // height of the button
                                  width: 50.0, // width of the button
                                  child: Center(child: Text('2-4')),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                timing = Text(
                                  "4-6",
                                  style: TextStyle(color: Colors.white),
                                );
                                val = 2;
                                boxcolor = Colors.lightGreen;
                                setState(() {});
                              },
                              child: Card(
                                elevation: 15.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: val == 2
                                          ? boxcolor
                                          : Colors.white,
                                      border:
                                          Border.all(color: Colors.black)),
                                  height: 50.0, // height of the button
                                  width: 50.0, // width of the button
                                  child: Center(child: Text('4-6')),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                timing = Text(
                                  "6-8",
                                  style: TextStyle(color: Colors.white),
                                );
                                val = 3;
                                boxcolor = Colors.lightGreen;
                                setState(() {});
                              },
                              child: Card(
                                elevation: 15.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: val == 3
                                          ? boxcolor
                                          : Colors.white,
                                      border:
                                          Border.all(color: Colors.black)),
                                  height: 50.0,
                                  width: 50.0,
                                  child: Center(child: Text('6-8')),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                timing = Text(
                                  "8-10",
                                  style: TextStyle(color: Colors.white),
                                );
                                val = 4;
                                boxcolor = Colors.lightGreen;
                                setState(() {});
                              },
                              child: Card(
                                elevation: 15.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //     color: Colors.black,
                                      //     spreadRadius: 200.0,
                                      //   )
                                      // ],
                                      color: val == 4
                                          ? boxcolor
                                          : Colors.white,
                                      border:
                                          Border.all(color: Colors.black)),
                                  height: 50.0, // height of the button
                                  width: 50.0, // width of the button
                                  child: Center(child: Text('8-10')),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                timing = Text(
                                  "10-12",
                                  style: TextStyle(color: Colors.white),
                                );
                                val = 5;
                                setState(() {});
                              },
                              child: Card(
                                elevation: 15.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: val == 5
                                          ? boxcolor
                                          : Colors.white,
                                      border:
                                          Border.all(color: Colors.black)),
                                  height: 50.0, // height of the button
                                  width: 50.0, // width of the button
                                  child: Center(child: Text('10-12')),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                timing = Text(
                                  "12-14",
                                  style: TextStyle(color: Colors.white),
                                );
                                val = 6;
                                boxcolor = Colors.lightGreen;
                                setState(() {});
                              },
                              child: Card(
                                elevation: 15.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: val == 6
                                          ? boxcolor
                                          : Colors.white,
                                      border:
                                          Border.all(color: Colors.black)),
                                  height: 50.0, // height of the button
                                  width: 50.0, // width of the button
                                  child: Center(child: Text('12-14')),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                timing = Text(
                                  "14-16",
                                  style: TextStyle(color: Colors.white),
                                );
                                val = 7;
                                boxcolor = Colors.lightGreen;
                                setState(() {});
                              },
                              child: Card(
                                elevation: 15.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: val == 7
                                          ? boxcolor
                                          : Colors.white,
                                      border:
                                          Border.all(color: Colors.black)),
                                  height: 50.0, // height of the button
                                  width: 50.0, // width of the button
                                  child: Center(child: Text('14-16')),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                timing = Text(
                                  "16-18",
                                  style: TextStyle(color: Colors.white),
                                );
                                val = 8;
                                boxcolor = Colors.lightGreen;
                                setState(() {});
                              },
                              child: Card(
                                elevation: 15.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: val == 8
                                          ? boxcolor
                                          : Colors.white,
                                      border:
                                          Border.all(color: Colors.black)),
                                  height: 50.0, // height of the button
                                  width: 50.0, // width of the button
                                  child: Center(child: Text('16-18')),
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
                  "No of People",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              padding: EdgeInsets.all(15.0),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                peoplevalue = Text(
                                  "2-4",
                                  style: TextStyle(color: Colors.white),
                                );
                                peoplelength = 1;
                                boxcolor = Colors.lightGreen;
                                setState(() {});
                              },
                              child: Card(
                                elevation: 15,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: peoplelength == 1
                                          ? boxcolor
                                          : Colors.white,
                                      border:
                                          Border.all(color: Colors.black)),
                                  height: 50.0, // height of the button
                                  width: 50.0, // width of the button
                                  child: Center(child: Text('2-4')),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                peoplevalue = Text(
                                  "4-6",
                                  style: TextStyle(color: Colors.white),
                                );
                                peoplelength = 2;
                                boxcolor = Colors.lightGreen;
                                setState(() {});
                              },
                              child: Card(
                                elevation: 15,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: peoplelength == 2
                                          ? boxcolor
                                          : Colors.white,
                                      border:
                                          Border.all(color: Colors.black)),
                                  height: 50.0, // height of the button
                                  width: 50.0, // width of the button
                                  child: Center(child: Text('4-6')),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                peoplevalue = Text(
                                  "6-8",
                                  style: TextStyle(color: Colors.white),
                                );
                                peoplelength = 3;
                                boxcolor = Colors.lightGreen;
                                setState(() {});
                              },
                              child: Card(
                                elevation: 15,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: peoplelength == 3
                                          ? boxcolor
                                          : Colors.white,
                                      border:
                                          Border.all(color: Colors.black)),
                                  height: 50.0, // height of the button
                                  width: 50.0, // width of the button
                                  child: Center(child: Text('6-8')),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                peoplevalue = Text(
                                  "8-10",
                                  style: TextStyle(color: Colors.white),
                                );
                                peoplelength = 4;
                                boxcolor = Colors.lightGreen;
                                setState(() {});
                              },
                              child: Card(
                                elevation: 15,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: peoplelength == 4
                                          ? boxcolor
                                          : Colors.white,
                                      border:
                                          Border.all(color: Colors.black)),
                                  height: 50.0, // height of the button
                                  width: 50.0, // width of the button
                                  child: Center(child: Text('8-10')),
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
            )
          ],
        ),
      ),
    );
  }
}

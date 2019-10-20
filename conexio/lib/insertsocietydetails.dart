import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoder/geocoder.dart';

class InsertSocietyDetails extends StatefulWidget {
  var memberid;

  InsertSocietyDetails(this.memberid);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InsertSocietyDetailsState(memberid);
  }
}

GlobalKey<FormState> validatekey = GlobalKey<FormState>();

class InsertSocietyDetailsState extends State<InsertSocietyDetails> {
  var memberid;

  InsertSocietyDetailsState(this.memberid);

  var longitude;
  double  latitude;
  var cordinatesfetch = false;
  String societyName;
  String status;
  var numberofflats;
  var progressvariable=false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return progressvariable?Scaffold(body: Center(child: CircularProgressIndicator(),),):Scaffold(
      appBar: AppBar(backgroundColor: Color.fromRGBO(116, 49, 155, 20),title: Text("Insert Details")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Form(
            key: validatekey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "enter the String";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      societyName=value;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Society Name",
                      labelText: "Society Name",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(36.0)),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(style: BorderStyle.solid, width: 1),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "enter the String";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      numberofflats=value.toString();
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Number of Flats",
                      labelText: "Number of Flats",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(36.0)),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(style: BorderStyle.solid, width: 1),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
                RaisedButton(
                  child: Text("Fetch Co-ordinates"),
                  onPressed: () {
                    // validatekey.currentState.validate();
                    // validatekey.currentState.save();
                    // getLoactionhere();
                    // _getLocation();
                    getlocation();
                  },
                ),
                cordinatesfetch
                    ? Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text("latitude:"),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(latitude.toString()),
                            ),
                          ],
                        ),
                      )
                    : Container(child: Text("Fetch the latitude"),),
                cordinatesfetch
                    ? Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text("Longitude:"),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(longitude.toString()),
                            ),
                          ],
                        ),
                      )
                    : Container(child: Text("Fetch the longitude"),),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "enter the String";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      status=value;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Status",
                      labelText: "Status",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(36.0)),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(style: BorderStyle.solid, width: 1),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10.0),child: RaisedButton(child: Text("Add Society"),onPressed: (){
                  validatekey.currentState.validate();
                  validatekey.currentState.save();
                  addsociety();
                },),)
              ],
            ),
          ),
        ),
      ),
    );
  }
var currentLocation = LocationData;

var location = new Location();

  void getlocation()async{
    
 try {
 var currentLocation = await location.getLocation();
 latitude=currentLocation.latitude;
 longitude=currentLocation.longitude;
 cordinatesfetch=true;
 setState(() {
   
 });
 print(currentLocation.longitude);
 print(currentLocation.latitude);
} on PlatformException catch (e) {
  if (e.code == 'PERMISSION_DENIED') {
   var error = 'Permission denied';
  } 
  currentLocation = null;
}
  }

  // void getLoactionhere() async {
  //   var location = Location();
  //   try {
  //     var currentLocation = await location.getLocation();
  //     altitude = currentLocation.altitude;
  //     longitude = currentLocation.longitude;
  //     if(altitude==0.0||longitude==0.0){
  //       print("0000000");
  //       setState(() {
          
  //         cordinatesfetch=false;

  //       });
  //     }
  //    else if (altitude != null && longitude != null) {
        
  //       setState(() {
  //         cordinatesfetch = true;
  //       });
  //     }
  //   } on PlatformException catch (e) {}
  // }
  // _getLocation() async
  //     {
  //       Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //       // debugPrint('location: ${position.latitude}');
  //       print(position.latitude);
  //       print(position.longitude);
  //       final coordinates = new Coordinates(position.latitude, position.longitude);
  //       var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
  //       var first = addresses.first;
  //       print("${first.featureName} : ${first.addressLine}");
  //     }

  Future<void> addsociety()async {
    progressvariable=true;
    setState(() { 
    });
    Map<String, dynamic> societydata = {
      "token": "conexo",
      "society_name": societyName,
      "member_id": memberid,
      "coordinates": "($latitude,$longitude)",
      "status": status,
      "no_of_flats": numberofflats
    };
    http.post(
        "http://conexo.in/main/conexo-marketing/public/index.php/api/customer/addsociety",
        body: json.encode(societydata),
        headers: {
          "Content-Type": "application/json"
        }).then((http.Response response) {

          print(json.decode(response.body));
          var data=json.decode(response.body);
          if(data["message"]=="success"){
            progressvariable=false;
            setState(() {
              
            });
             showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text("Successfully Added"),
              title: Text("Sucess"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Okay"),
                  onPressed: () {
                    
            // setState(() {
            //  pageloading=false; 
            // });
                    Navigator.of(context).pop();
                    
                   // authkey.currentState.reset();
                  },
                )
              ],
            );
          });
          }
    });
  }
}

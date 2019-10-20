import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';

class ContactDetailsOfSociety extends StatefulWidget {
  String societyid;
  Function societycontactdata;
  ContactDetailsOfSociety(this.societyid,this.societycontactdata);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ContactDetailsOfSocietyState(societyid,societycontactdata);
  }
}

GlobalKey<FormState> validatekey = GlobalKey<FormState>();

class ContactDetailsOfSocietyState extends State<ContactDetailsOfSociety> {
  String societyid;
  String position;
  Function societycontactdata;
  String name;
  int number;
  bool progressindicatorvariable=false;

  ContactDetailsOfSocietyState(this.societyid,this.societycontactdata);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return progressindicatorvariable==true?Scaffold(body: Center(child: CircularProgressIndicator(),),):Scaffold(
      appBar: AppBar(
          title: Text("data"),
          backgroundColor: Color.fromRGBO(116, 49, 155, 20)),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Enter Contact Details",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Form(key: validatekey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "enter the name";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        name = value;
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Name",
                        labelText: "Name",
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
                        number = int.parse(value);
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Mobile Number",
                        labelText: "Mobile Number",
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
                        position = value;
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Position",
                        labelText: "Position",
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
                    padding: EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: Color.fromRGBO(116, 49, 155, 20),
                      onPressed: () {
                        validatekey.currentState.validate();
                        validatekey.currentState.save();
                        print(societyid);
                        print(name);
                        print(number);
                        print(societyid);
                        contactDetailsOfSociety();
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> contactDetailsOfSociety() async {
    setState(() {
     progressindicatorvariable=true; 
    });
    Map<String, dynamic> contactdeails = {
      "token": "conexo",
      "society_id": societyid,
      "name": name,
      "mobile_no": number,
      "position": position,
    };
    http.post(
        "http://conexo.in/main/conexo-marketing/public/index.php/api/customer/addcontact",
        body: json.encode(contactdeails),
        headers: {
          "Content-Type": "application/json"
        }).then((http.Response response) {
      print(json.decode(response.body));
    var data =json.decode(response.body);
    var result=data["message"];
    if(result=="success"){
      societycontactdata();
      setState(() {
       progressindicatorvariable=false; 
      });
      Navigator.pop(context);
    }
    });
  }
}

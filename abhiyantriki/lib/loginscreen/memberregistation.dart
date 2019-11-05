import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MemberRegistation extends StatefulWidget {
  var token;
  var teamid;
  var email;
  var scrollsid;
  MemberRegistation(this.token, this.scrollsid, this.teamid, this.email);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MemberRegistationtateState(token, scrollsid, teamid, email);
  }
}

GlobalKey<FormState> validatekey = GlobalKey<FormState>();

class MemberRegistationtateState extends State<MemberRegistation> {
  MemberRegistationtateState(
      this.token, this.scrollsid, this.teamid, this.email);
  var email;
  var token;
  var teamid;
  var scrollsid;
  bool hostel = false;
  String college;
  String password;
  String confirmpassword;
  String mobilenumber;
  String firstname;
  String lastname;

  Future<void> registation() async {
    Map<String, dynamic> memberdata = {
      "last_name": lastname,
      "mob_no": mobilenumber,
      "college": college,
      "hostel_accomodation": 1,
      "password": password,
      "password_confirmation": confirmpassword,
    };

    http.post("https://scrolls19-backend.herokuapp.com/api/register/member",
        body: json.encode(memberdata),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer " + token
        }).then((http.Response response) {
      print(response.statusCode);
      print(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Color(0xff1f1f1f),
        appBar: AppBar(
          elevation: 0,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Color(0xffefb168)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Container(
              height: 60,
              width: 130,
              color: Color(0xff1f1f1f),
              child: Image.asset(
                "assets/REGISTER.png",
                fit: BoxFit.fitWidth,
              ),),
          centerTitle: true,
          backgroundColor: Color(0xff1f1f1f),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              elevation: 20,
              color: Color(0xff1f1f1f),
              child: Container(
                child: Form(
                  key: validatekey,
                  child: Column(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Center(
                        child: Text(
                          "Member Registation",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xffefb168),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: TextFormField(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return "Enter the First name";
                                  } else
                                    return null;
                                },
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  // fillColor: Color(0xffefb168),
                                  hintText: "First Name",
                                  alignLabelWithHint: true,
                                  labelText: "First Name",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffefb168),
                                        style: BorderStyle.solid,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffffffff),
                                        style: BorderStyle.solid,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                ),
                                onSaved: (value) {
                                  firstname = value;
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 3.0,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: TextFormField(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return "Enter the First name";
                                  } else
                                    return null;
                                },
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: "Last Name",
                                  labelText: "Last Name",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffefb168),
                                        style: BorderStyle.solid,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffffffff),
                                        style: BorderStyle.solid,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                ),
                                onSaved: (value) {
                                  lastname = value;
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        validator: (value) {
                          if (value == null) {
                            return "Enter the First name";
                          } else
                            return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Mobile Number",
                          labelText: "Mobile Number",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffefb168),
                                style: BorderStyle.solid,
                                width: 1),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffffffff),
                                style: BorderStyle.solid,
                                width: 1),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        onSaved: (value) {
                          mobilenumber = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        validator: (value) {
                          if (value == null) {
                            return "Enter the First name";
                          } else
                            return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "College Name",
                          labelText: "College Name",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffefb168),
                                style: BorderStyle.solid,
                                width: 1),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffffffff),
                                style: BorderStyle.solid,
                                width: 1),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        onSaved: (value) {
                          college = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Hostel Required?",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xffefb168),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 10),
                            child: GestureDetector(
                              onTap: () {
                                hostel = !hostel;
                                setState(() {});
                              },
                              child: Card(
                                elevation: 10,
                                color: hostel
                                    ? Color(0xffefb168)
                                    : Color(0xff1f1f1f),
                                child: Container(
                                    height: 40,
                                    child: hostel
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                Icons.radio_button_checked,
                                                color: Colors.white,
                                                size: 13,
                                              ),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text(
                                                "YES",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                Icons.radio_button_unchecked,
                                                color: Color(0xffefb168),
                                                size: 13,
                                              ),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text(
                                                "YES",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Color(0xffefb168)),
                                              ),
                                            ],
                                          )),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, right: 20),
                            child: GestureDetector(
                              onTap: () {
                                hostel = !hostel;
                                setState(() {});
                              },
                              child: Card(
                                elevation: 10,
                                color: hostel
                                    ? Color(0xff1f1f1f)
                                    : Color(0xffefb168),
                                child: Container(
                                    height: 40,
                                    child: hostel
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                Icons.radio_button_unchecked,
                                                color: Color(0xffefb168),
                                                size: 13,
                                              ),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text(
                                                "NO",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Color(0xffefb168)),
                                              ),
                                            ],
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                Icons.radio_button_checked,
                                                color: Colors.white,
                                                size: 13,
                                              ),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text(
                                                "NO",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: TextFormField(
                        obscureText: true,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        validator: (value) {
                          if (value == null) {
                            return "Enter the First name";
                          } else
                            return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          //hintText: "Password",
                          //labelText: "Password",
                          
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffefb168),
                                style: BorderStyle.solid,
                                width: 1),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffffffff),
                                style: BorderStyle.solid,
                                width: 1),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        onSaved: (value) {
                          password = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: TextFormField(
                        obscureText: true,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        validator: (value) {
                          if (value == null) {
                            return "Enter the First name";
                          } else
                            return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          labelText: "Confirm Password",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffefb168),
                                style: BorderStyle.solid,
                                width: 1),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffffffff),
                                style: BorderStyle.solid,
                                width: 1),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        onSaved: (value) {
                          confirmpassword = value;
                        },
                      ),
                    ),
                    Builder(
                      builder: (context) => Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: RaisedButton(
                            color: Color(0xffefb168),
                            onPressed: () {
                              // validatekey.currentState.validate();
                              validatekey.currentState.save();
                              print(lastname);
                              if (firstname.isEmpty ||
                                  lastname.isEmpty ||
                                  college.toString().isEmpty ||
                                  mobilenumber.isEmpty ||
                                  password.isEmpty ||
                                  confirmpassword.isEmpty) {
                                _displaySnackBar(
                                    context, "Please fill all the Details");
                              } else if (password.compareTo(confirmpassword) !=
                                  0) {
                                _displaySnackBar(
                                    context, "Entered Passwords do not match");
                              } else if (password.length < 8) {
                                _displaySnackBar(context, "Password too short");
                              } else if (mobilenumber.length != 10) {
                                _displaySnackBar(
                                    context, "Enter a valid mobile no.");
                              } else {
                                registation();
                              }
                              // registrationFunction();
                              // print(firstName);
                              // print(lastName);
                              // print(collegeName);
                              // print(teaName);
                              // print(firstMemberName);
                              // print(secondMemberName);
                              // print(secondMemberEmail);
                            },
                            child: Text(
                              "SUBMIT",
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
              ),
            ),
          ),
        ));
  }

  _displaySnackBar(BuildContext context, String a) {
    final snackBar = SnackBar(content: Text(a));
    Scaffold.of(context).showSnackBar(snackBar);
  }
}

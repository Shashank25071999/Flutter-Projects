import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class RemarkOfSociety extends StatefulWidget {
  String societyid;
  Function societydata;
  RemarkOfSociety(this.societyid,this.societydata);
  @override
  State<StatefulWidget> createState() {
    return RemarkOfSocietyState(societyid,societydata);
  }
}

GlobalKey<FormState> validatekey = GlobalKey<FormState>();

class RemarkOfSocietyState extends State<RemarkOfSociety> {
  DateTime selectedDate = DateTime.now();
  Function societydata;
  String societyid;
  var date;
  String text;
  RemarkOfSocietyState(this.societyid,this.societydata);
  var progressindicatorvariable=false;

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        date = "${selectedDate.day}" +
            "/" +
            "${selectedDate.month}" +
            "/" +
            "${selectedDate.year}";
      });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return progressindicatorvariable?Scaffold(body: Center(child: CircularProgressIndicator(),),): Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(116, 49, 155, 20),
        title: Text("Add remark"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // BasicDateField(),
            Row(
              children: <Widget>[
                Expanded(
                    child: Center(
                        child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Select Follow up date",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ))),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(color: Colors.orangeAccent,
                      onPressed: () => _selectDate(context),
                      child: Text('Select date',style: TextStyle(color: Colors.white)),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding:
                      EdgeInsets.only(left: 18, right: 10, top: 10, bottom: 10),
                  child: Text("Follow up date",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                )),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(date != null
                        ? date
                        : "${selectedDate.day}" +
                            "/" +
                            "${selectedDate.month}" +
                            "/" +
                            "${selectedDate.year}"),
                  ),
                )
              ],
            ),
            Form(
              key: validatekey,
              child: Padding(
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
                    text = value;
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Add Remark",
                    labelText: "Add Remark",
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
            ),
            RaisedButton(
              color: Color.fromRGBO(116, 49, 155, 20),
              onPressed: () {
                validatekey.currentState.validate();
                validatekey.currentState.save();
                contactDetailsOfSociety();
              },
              child: Text("Submit", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> contactDetailsOfSociety() async {
    setState(() {
     progressindicatorvariable=true; 
    });
    Map<String, dynamic> remarkdata = {
      "token": "conexo",
      "society_id": societyid,
      "text": text,
      "follow_up_date": date,
    };
    http.post(
        "http://conexo.in/main/conexo-marketing/public/index.php/api/customer/addremarks",
        body: json.encode(remarkdata),
        headers: {
          "Content-Type": "application/json"
        }).then((http.Response response) {
      // print(json.decode(response.body));
      var data=json.decode(response.body);
      print(data);
      var result=data["message"];
    if(result=="success"){
      societydata();
      setState(() {
       progressindicatorvariable=false; 
      });
      Navigator.pop(context);
    }


    });
  }
}

// class BasicDateField extends StatelessWidget {
//   DateTime selectedDate = DateTime.now();
//   final format = DateFormat("dd/MM/yyyy");
//   fun(){
//     print(format);

//   }
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: <Widget>[
//       Text('Basic date field (${format.pattern})'),
//       DateTimeField(
//         format: format,
//         onShowPicker: (context, currentValue) {

//           return showDatePicker(
//               context: context,
//               firstDate: DateTime(1900),
//               initialDate: currentValue ?? DateTime.now(),
//               lastDate: DateTime(2100));

//         },
//       ),
//       RaisedButton(onPressed: (){
//         fun();
//       },)
//     ]);
//   }
// }

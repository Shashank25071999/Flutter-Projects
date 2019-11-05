

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sparsh extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SparshState();
  }
}
GlobalKey<FormState>validatekey=GlobalKey<FormState>();

class SparshState extends State<Sparsh>{
  String textdata="Shashank";

     void initState() {
    super.initState();
    
  }
  Future<void>pageopen()async{
      SharedPreferences pref = await SharedPreferences.getInstance();
      textdata=pref.getString("data");
  }

  Future<void> fun()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("data", textdata);

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(body: Column(
      children: <Widget>[
        Form(key: validatekey,
          child: TextFormField(onSaved: (value){
            textdata=value;
            setState(() {
              
            });
          },),
        ),
        Center(child: RaisedButton(onPressed: (){
          validatekey.currentState.save();
          fun();
        },child: Text("Submit"),),),
      ],
    ),);
  }
}
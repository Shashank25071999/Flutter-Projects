import 'package:drawer/drawer.dart';
import 'package:flutter/material.dart';


class DrawerExample extends StatefulWidget{
    int index;
    DrawerExample(this.index);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DrawerExampleState(index);
    throw UnimplementedError();
  }
}

class DrawerExampleState extends State<DrawerExample>{
  int index;
  DrawerExampleState(this.index);
    List<DrawerItem> listpages = [
        
        DrawerItem(
          icon: Icon(Icons.library_books),
          label:"News"
        ),
        DrawerItem(
          icon: Icon(Icons.calendar_today),
          label: "Schedule"
        ),
         DrawerItem(
          icon: Icon(Icons.home),
          label:"Home"
        ),
         DrawerItem(
          icon: Icon(Icons.person_add),
          label:"Register"
        ),
        DrawerItem(
          icon: Icon(Icons.people),
          label:"About Us"
        ),

    
  ];
  List<Widget> pages=[Scaffold(backgroundColor: Colors.green,),
  Scaffold(backgroundColor: Colors.pink,),
  Scaffold(backgroundColor: Colors.purple,),
  Scaffold(backgroundColor: Colors.blue,),
  Scaffold(backgroundColor: Colors.brown,)];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(
                  title: Text("AppBar"),
                  leading: Builder(
        builder: (context) => IconButton(
            icon: new Icon(Icons.settings),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
                ),
                drawer: Stack(children:[ CurvedDrawer(items: listpages)]),
                body: pages[index],);
  }
}
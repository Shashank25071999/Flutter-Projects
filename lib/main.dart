// import 'package:curved_drawer/curved_drawer.dart';
import 'package:drawer/drawerexample.dart';
import 'package:flutter/material.dart';
import 'package:drawer/drawer.dart';


void main() {
  List<DrawerItem>items=[DrawerItem(icon: Icon(Icons.home),label: "Riya Garg"),
 DrawerItem(icon: Icon(Icons.hot_tub),label: "Shashank"),
 DrawerItem(icon: Icon(Icons.hotel),label: "Anshul Sahai"),
 DrawerItem(icon: Icon(Icons.http),label: "Appu Garg"),
 DrawerItem(icon: Icon(Icons.image),label: "Nautanki sala")];
  runApp(MaterialApp(home:DrawerExample(2)));
}


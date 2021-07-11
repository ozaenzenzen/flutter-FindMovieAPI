import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api2/screens/home.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "FAM Movie Details App",
      home: new HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

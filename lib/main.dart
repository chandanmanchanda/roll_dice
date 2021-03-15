import 'package:flutter/material.dart';
import 'package:rolldice/homescreen.dart';
import 'package:rolldice/splashscreen.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({Key key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen()

    );
  }

}
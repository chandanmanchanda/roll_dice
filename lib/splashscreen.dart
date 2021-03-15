import 'dart:ui';
import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';

class splashscreen extends StatefulWidget {
  @override
  __splashscreenState createState() => __splashscreenState();
}

class __splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<Timer> loadData() async {
    return Timer(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.lime, Colors.lightBlue])),
          child: Shimmer.fromColors(
              baseColor: Color(0xff7f70ff),
              highlightColor: Color(0xfff100ff),
              child: Text(
                'Let\'s  Play',
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 60,
                    shadows: <Shadow>[
                      Shadow(
                          blurRadius: 18,
                          color: Colors.black87,
                          offset: Offset.fromDirection(90, 2))
                    ]),
              )),
        ),
      ),
    );
  }
}

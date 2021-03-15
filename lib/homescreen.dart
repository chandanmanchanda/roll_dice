import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int leftDiceNumbr = 1;
  int rightDiceNumber = 1;
  AnimationController _controller;
  CurvedAnimation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  animate() {
    _controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
      animation=CurvedAnimation(parent: _controller,curve: Curves.bounceOut);
//    _controller.forward();
    animation.addListener(() {
      setState(() {

      });
      print(_controller.value);
    });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          leftDiceNumbr = Random().nextInt(6) + 1;
          rightDiceNumber = Random().nextInt(6) + 1;
        });
        print('Completed');
        _controller.reverse();
      }
    });

  }

  void roll() {
    _controller.forward();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text(
          'Roll Dice',
          textScaleFactor: 1.35,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onDoubleTap: roll,
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Image(height: 200-(animation.value)*200,
                        image: AssetImage(
                            'asset/images/dice-png-$leftDiceNumbr.png'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onDoubleTap: roll,
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Image(height: 200-(animation.value)*200,
                        image: AssetImage(
                            'asset/images/dice-png-$rightDiceNumber.png'),
                      ),
                    ),
                  ),
                )
              ],
            ),
            RaisedButton(
              textTheme: ButtonTextTheme.normal,
              onPressed: roll,
              child: Text(
                'Roll',
                style: TextStyle(fontSize: 15.0, color: Colors.cyan),
              ),
            )
          ],
        ),
      ),
    );
  }
}

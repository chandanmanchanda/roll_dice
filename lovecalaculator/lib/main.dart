import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'calculation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LOVE CALCULATOR',
      home: MyCalculator(),
    );
  }
}

class MyCalculator extends StatefulWidget {
  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  String firstName;
  String secondName;
  int score;

  void LoveScore() {
    score = calculation(firstName: firstName, secondName: secondName);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ScorePage(score: score)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOVE CALCULATOR'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Hero(
                tag: 'lovegif',
                child: Image(
                  image: AssetImage('lib/assets/lovegif.gif'),
                ),
              ),
            ),
          ),
          TextField(

            onChanged: (value) {
              firstName = value;
            },
            decoration: InputDecoration(

                hintText: 'Enter Your Name',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 1.5),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                )),
          ),
          TextField(
            onChanged: (value) {
              secondName = value;
            },
            decoration: InputDecoration(
                hintText: 'Enter Second Name',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0))),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 1.5),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                )),
          ),
          RaisedButton(
            onPressed: () {
              LoveScore();
            },
            child: Text(
              'CALCULATE',
            ),
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}

class ScorePage extends StatelessWidget {
  const ScorePage({
    Key key,
    @required this.score,
  }) : super(key: key);
  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Hero(
                tag: 'lovegif',
                child: Image(image: AssetImage('lib/assets/lovegif.gif')),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: Text(
              'Your Score is $score %',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                backgroundColor: Colors.redAccent,
                fontSize: 20.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}

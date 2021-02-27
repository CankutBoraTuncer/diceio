import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(DicePage(

  ));
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  List colors = [Colors.red, Colors.green, Colors.yellow, Colors.blue, Colors.brown, Colors.deepPurple, Colors.blueGrey, Colors.teal, Colors.redAccent, Colors.greenAccent, Colors.blueAccent, Colors.purpleAccent];

  int index = 0;

  Random random = new Random();
  void changeIndex() {
    setState(() => index = random.nextInt(12));
  }
  void randomizeDiceL() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
    });
  }

  void randomizeDiceR() {
    setState(() {
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        backgroundColor: colors[index],
        appBar: AppBar(
          backgroundColor: colors[index].shade700,
          title: Center(
            child: Text(
              'DICE.IO',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: FlatButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      onPressed: () {
                        setState(() {
                          randomizeDiceL();
                        });
                      },
                      child: Image.asset('images/dice$leftDiceNumber.png'),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      onPressed: () {
                        randomizeDiceR();
                      },
                      child: Image.asset('images/dice$rightDiceNumber.png'),
                    ),
                  ),
                ],
              ),
              Container(
                height: 75,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 15,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    setState(() {
                      rightDiceNumber = Random().nextInt(6) + 1;
                      leftDiceNumber = Random().nextInt(6) + 1;
                      changeIndex();
                    });
                  },
                  child: Center(
                    child: Text(
                      'ROLL BOTH',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

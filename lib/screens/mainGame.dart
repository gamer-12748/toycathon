import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';
import 'homepage.dart';

class MainGame extends StatefulWidget {
  final List players;
  MainGame({this.players});

  @override
  _MainGameState createState() => _MainGameState();
}

class _MainGameState extends State<MainGame> {
  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to exit the app?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  Future<bool> _endGame() {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to End the Game?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () => HomePage(),
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  String player1Initials;
  String player2Initials;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var nameparts1 = widget.players[0].split(" ");
    var p1I = nameparts1[0][0].toUpperCase() + nameparts1[1][0].toUpperCase();
    player1Initials = p1I;

    var nameparts2 = widget.players[1].split(" ");
    var p2I = nameparts2[0][0].toUpperCase() + nameparts2[1][0].toUpperCase();
    player2Initials = p2I;
  }

  int newDiceImage = 1;
  Color activeColor1 = Colors.blue;
  Color activeColor2 = Colors.black;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: activeColor1,
                      radius: 50,
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).highlightColor,
                        radius: 45,
                        child: Text(
                          player1Initials,
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: activeColor2,
                      radius: 50,
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).highlightColor,
                        radius: 45,
                        child: Text(
                          player2Initials,
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0)),
                      height: 100.0,
                      width: 100.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/Dice-$newDiceImage.png'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      newDiceImage = Random().nextInt(6) + 1;
                      if (activeColor1 == Colors.blue) {
                        activeColor1 = Colors.black;
                        activeColor2 = Colors.blue;
                      } else {
                        activeColor1 = Colors.blue;
                        activeColor2 = Colors.black;
                      }
                    });
                  },
                  height: 40.0,
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  shape: StadiumBorder(),
                  child: Text(
                    "Roll Dice",
                    style: TextStyle(
                        fontFamily: 'LexendDeca',
                        fontSize: 16.0,
                        color: Theme.of(context).cardColor),
                  ),
                  color: Theme.of(context).highlightColor,
                ),
                SizedBox(
                  height: 30.0,
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      newDiceImage = Random().nextInt(6) + 1;
                    });
                  },
                  height: 50.0,
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  shape: StadiumBorder(),
                  child: Text(
                    "Available Monuments",
                    style: TextStyle(
                        fontFamily: 'LexendDeca',
                        fontSize: 16.0,
                        color: Theme.of(context).cardColor),
                  ),
                  color: Theme.of(context).highlightColor,
                ),
                SizedBox(
                  height: 20.0,
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      newDiceImage = Random().nextInt(6) + 1;
                    });
                  },
                  height: 50.0,
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  shape: StadiumBorder(),
                  child: Text(
                    "My Monuments",
                    style: TextStyle(
                        fontFamily: 'LexendDeca',
                        fontSize: 16.0,
                        color: Theme.of(context).cardColor),
                  ),
                  color: Theme.of(context).highlightColor,
                ),
                SizedBox(
                  height: 30.0,
                ),
                MaterialButton(
                  onPressed: () {
                    _endGame();
                  },
                  height: 50.0,
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  shape: StadiumBorder(),
                  child: Text(
                    "End Game",
                    style: TextStyle(
                        fontFamily: 'LexendDeca',
                        fontSize: 16.0,
                        color: Theme.of(context).cardColor),
                  ),
                  color: Theme.of(context).highlightColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

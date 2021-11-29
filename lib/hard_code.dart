// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'players_team.dart';

class HardCode {
  var playerid;
  var name;
  var matchno;
  var runs;
  var highscore;
  var average;
  var strikerate;
  var centuries;
  var halfcen;
  var fours;
  var sixes;
  var teamid;
  List<String> homeGround = [
    'Wankhede Stadium',
    'M. A. Chidambaram Stadium',
    ''
  ];
}

Widget popup(BuildContext context) {
  return Center(
    child: Container(
      height: 500,
      width: 500,
      // padding: EdgeInsets.all(10),
      child: Card(
        // margin: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text('Please Enter Players Details'),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: 335,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Player Name',
                  hintText: 'Enter Player Name',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 150,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Matches Played',
                      hintText: 'Enter No of matches played',
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 150,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'player id',
                      hintText: 'Enter Player id',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 150,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'High Score',
                      hintText: 'Enter High Score',
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 150,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Average',
                      hintText: 'Enter Average',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 150,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Runs',
                      hintText: 'Enter Runs',
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 150,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Strike Rate',
                      hintText: 'Enter Strike Rate',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 150,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Centuries',
                      hintText: 'Enter No of centuries',
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 150,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Half Centuries',
                      hintText: 'No. of Half Centuries',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 150,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Fours',
                      hintText: 'No. of fours',
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 150,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Sixes',
                      hintText: 'No. of Sixes',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("SUBMIT")),
          ],
        ),
      ),
    ),
  );
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ipl_2021/extra_data.dart';
import 'package:mysql1/mysql1.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PlayersTeam extends StatefulWidget {
  const PlayersTeam({Key? key, this.teamId}) : super(key: key);
  final teamId;

  @override
  _PlayersTeamState createState() => _PlayersTeamState();
}

class _PlayersTeamState extends State<PlayersTeam> {
  bool controller = true;
  late List<ResultRow> playersList;
  var data = Extra();
  void query() async {
    var settings = ConnectionSettings(
      host: 'database-2.co4a74ziokri.us-east-1.rds.amazonaws.com',
      port: 3306,
      user: 'root',
      password: 'shreyash',
      db: 'cricketmanagement',
    );
    var conn = await MySqlConnection.connect(settings);
    var result = await conn.query(
        'select * from players where teamId = ${widget.teamId} order by highScore DESC');
    playersList = result.toList();
    // print(result.where((element) => element.values![0] == 2));
    conn.close();
    setState(() {
      controller = false;
    });
  }

  void delete(var deleteplayerId) async {
    var settings = ConnectionSettings(
      host: 'database-2.co4a74ziokri.us-east-1.rds.amazonaws.com',
      port: 3306,
      user: 'root',
      password: 'shreyash',
      db: 'cricketmanagement',
    );
    var conn = await MySqlConnection.connect(settings);
    var result = await conn
        .query('delete from players where playerid = $deleteplayerId');
    conn.close();
  }

  void create(
      var playerid,
      var name,
      var matchno,
      var runs,
      var highscore,
      var average,
      var strikerate,
      var centuries,
      var halfcen,
      var fours,
      var sixes,
      var teamid) async {
    var settings = ConnectionSettings(
      host: 'database-2.co4a74ziokri.us-east-1.rds.amazonaws.com',
      port: 3306,
      user: 'root',
      password: 'shreyash',
      db: 'cricketmanagement',
    );
    var conn = await MySqlConnection.connect(settings);
    var result = await conn
        .query('insert into players values(?,?,?,?,?,?,?,?,?,?,?,?)', [
      playerid,
      '$name',
      matchno,
      runs,
      highscore,
      average,
      strikerate,
      centuries,
      halfcen,
      fours,
      sixes,
      teamid
    ]);
    print('excuted');
    conn.close();
    Fluttertoast.showToast(msg: 'Record Added', backgroundColor: Colors.grey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TEAM DETAILS"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
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
                                  onChanged: (value) {
                                    data.name = value;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                      onChanged: (value) {
                                        data.matchno = value;
                                      },
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
                                      onChanged: (value) {
                                        data.playerid = value;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                      onChanged: (value) {
                                        data.highscore = value;
                                      },
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
                                      onChanged: (value) {
                                        data.average = value;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                      onChanged: (value) {
                                        data.runs = value;
                                      },
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
                                      onChanged: (value) {
                                        data.strikerate = value;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                      onChanged: (value) {
                                        data.centuries = value;
                                      },
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
                                      onChanged: (value) {
                                        data.halfcen = value;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                      onChanged: (value) {
                                        data.fours = value;
                                      },
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
                                      onChanged: (value) {
                                        data.sixes = value;
                                      },
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
                                    create(
                                        data.playerid,
                                        data.name,
                                        data.matchno,
                                        data.runs,
                                        data.highscore,
                                        data.average,
                                        data.strikerate,
                                        data.centuries,
                                        data.halfcen,
                                        data.fours,
                                        data.sixes,
                                        widget.teamId);
                                  },
                                  child: Text("SUBMIT")),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            },
            icon: Icon(Icons.add_box_rounded),
          ),
          IconButton(
              onPressed: () {
                query();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: controller
          ? Center(
              child: Text('Data is loading'),
            )
          : SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Text('STATS'),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: playersList.length,
                      padding: EdgeInsets.only(top: 25, right: 10, bottom: 10),
                      itemBuilder: (context, index) {
                        var item = playersList[index].values;
                        var playerid = item![0];
                        var playername = item[1];
                        var matchid = item[2];
                        var runs = item[3];
                        var highscore = item[4];
                        var average = item[5];
                        var strike = item[6];
                        var century = item[7];
                        var halfcen = item[8];
                        var fours = item[9];
                        var six = item[10];
                        return ListTile(
                            leading: Icon(
                              Icons.person_rounded,
                              size: 50,
                            ),
                            title: Text(
                              playername.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 20),
                            ),
                            subtitle: Text(
                              'playerid : $playerid  Runs: $runs  Highscore: $highscore  Average: $average Strike: $strike Centuries: $century  Halfcenturies: $halfcen  Fours: $fours  Sixes: $six',
                              softWrap: true,
                            ),
                            isThreeLine: true,
                            // horizontalTitleGap: 15,
                            trailing: IconButton(
                                onPressed: () {
                                  delete(playerid);
                                  Fluttertoast.showToast(
                                    msg: 'Record is deleted',
                                    backgroundColor: Colors.grey,
                                  );
                                },
                                icon: Icon(
                                  Icons.delete_outlined,
                                  size: 40,
                                  color: Colors.red,
                                )));
                      })
                ],
              ),
            ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ipl_2021/extra_data.dart';
import 'package:ipl_2021/players_team.dart';
import 'package:mysql1/mysql1.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var code = new Extra();

  late List listOfdata;
  bool controller = true;
  var result = 'Intial data';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/ipl.png',
          height: 60,
        ),
        centerTitle: true,
        elevation: 10,
        toolbarHeight: 70,
      ),
      body: controller
          ? Center(
              child: Container(
                child: Text('Data is being fetched'),
              ),
            )
          : ListView.builder(
              itemCount: listOfdata.length,
              itemBuilder: (context, int index) {
                var item = listOfdata[index].values;
                var teamId = item[0];
                var teamName = item[1];
                return Center(
                  child: Container(
                    width: 600,
                    height: 150,
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.white,
                      elevation: 10,
                      child: Column(
                        // mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ListTile(
                            leading: Image.asset(
                              'assets/$index.jpg',
                              height: 300,
                              width: 90,
                              fit: BoxFit.fill,
                            ),
                            title: Text(
                              teamName,
                              style: TextStyle(fontSize: 25.0),
                            ),
                            subtitle: Text(
                              code.homeGround[index],
                              style: TextStyle(fontSize: 18.0),
                            ),
                            minVerticalPadding: 8,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PlayersTeam(teamId: teamId)));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var settings = ConnectionSettings(
            host: 'database-2.co4a74ziokri.us-east-1.rds.amazonaws.com',
            port: 3306,
            user: 'root',
            password: 'shreyash',
            db: 'cricketmanagement',
          );
          var conn = await MySqlConnection.connect(settings);
          //Results varIntiate = await conn.query('show tables');
          var results3 = await conn.query('select * from teams');
          listOfdata = results3.toList();
          conn.close();
          setState(() {
            controller = false;
          });
        },
        child: const Icon(Icons.replay_outlined),
      ),
    );
  }
}

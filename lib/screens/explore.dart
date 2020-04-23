import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:manga_ui/screens/action_screen.dart';
import 'package:manga_ui/screens/adventure_screen.dart';
import 'package:manga_ui/screens/music_screen.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).primaryColor,
                    offset: Offset(0.0, 1.5),
                    blurRadius: 1.0,
                  ),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                color: Colors.white70,
              ),
              child: Row(
                children: <Widget>[
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        Feather.search,
                        color: Theme.of(context).accentColor,
                        size: 17,
                      ),
                    ),
                    onTap: () {},
                  ),
                  Text('search manga',
                      style: TextStyle(fontSize: 14, color: Colors.grey))
                ],
              ),
            ),
          ),
        ),
        body: ListView(padding: EdgeInsets.only(left: 10), children: <Widget>[
          ListTile(
            title: Text(
              'Popular Genres',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ),
          Container(
              height: 35,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(children: <Widget>[
                      InkWell(
                        child: Container(
                          height: 30,
                          width: 110,
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                                bottomRight: Radius.circular(12)),
                          ),
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ActionScreen()),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.whatshot,
                                    color: Colors.white,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 3.0),
                                    child: Text(
                                      'Action',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => AdventureScreen()));
                        },
                        child: Container(
                          height: 30,
                          width: 110,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                                bottomRight: Radius.circular(12)),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.wc,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 3.0),
                                  child: Text(
                                    'Adventure',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => MusicScreen()));
                        },
                        child: Container(
                          height: 30,
                          width: 90,
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                                bottomRight: Radius.circular(12)),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Feather.music,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 3.0),
                                  child: Text(
                                    'Music',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                  )
                ],
              )),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 10),
                child: Text(
                  'Recommend',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, right: 10),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 13,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        height: 150,
                        width: 110,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          elevation: 4,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            child: Image.asset(
                              "assets/images/${Random().nextInt(16)}.jpg",
                              height: 150,
                              width: 110,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Text("Team Reptile"),
                      Text(
                        "Hot",
                        style: TextStyle(
                            color: Theme.of(context).accentColor, fontSize: 16),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10, bottom: 10),
                child: Text(
                  'New Episodes',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, right: 10, bottom: 10),
                child: Icon(
                  Icons.arrow_drop_down,
                  size: 20,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 200,
                            width: 150,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              elevation: 4,
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: Image.asset(
                                  "assets/images/${Random().nextInt(6)}.jpg",
                                  height: 210,
                                  width: 135,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }))
        ]));
  }
}

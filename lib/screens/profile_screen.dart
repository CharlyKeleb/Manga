import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Feather.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: Icon(Feather.settings), onPressed: () {})
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 80,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/7.jpg'),
                        radius: 35.0,
                      ),
                      SizedBox(width: 10),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Container(
                          height: 40,
                          width: 120,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Sasha Ashley',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                'Colorado Springs',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              ' Best character',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Container(
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                  child: Text(
                                'NARUTO',
                                style: TextStyle(
                                    fontWeight: FontWeight.w100,
                                    fontSize: 15,
                                    color: Colors.white),
                              )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 63,
                  child: Container(
                    height: 17,
                    width: 17,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Icon(
                        Feather.check,
                        color: Colors.white,
                        size: 12,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 80,
            color: Colors.white30,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        '150',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        'Favorite Animes',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Container(
                      height: 50,
                      width: 0.3,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        '754',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        'Likes',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Container(
                      height: 50,
                      width: 0.3,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        '305',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        'Disikes',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15, top: 10),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Best Animes',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            Icon(
                              Feather.heart,
                              color: Theme.of(context).accentColor,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10, top: 10),
                        child: Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              itemCount: 6,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(1),
                                    ),
                                  ),
                                  elevation: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(1),
                                    ),
                                    child: Image.asset(
                                      "assets/images/${Random().nextInt(6)}.jpg",
                                      height: 300,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 10.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Most Commented',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 10),
                        child: Container(
                          height: 80,
                          color: Colors.white30,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 0.0),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/12.jpg'),
                                  radius: 30,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Boruto Naruto'),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.star,
                                          color: Theme.of(context).accentColor,
                                          size: 15,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Theme.of(context).accentColor,
                                          size: 15,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Theme.of(context).accentColor,
                                          size: 15,
                                        ),
                                        Icon(
                                          Icons.star_half,
                                          color: Theme.of(context).accentColor,
                                          size: 15,
                                        ),
                                        Icon(
                                          Icons.star_border,
                                          color: Theme.of(context).accentColor,
                                          size: 15,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 10.0, top: 10),
                                child: Container(
                                  height: 80,
                                  width: 170,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue,
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 3.0),
                                        child: Container(
                                          height: 50,
                                          width: 110,
                                          child: ListView(
                                              scrollDirection: Axis.vertical,
                                              shrinkWrap: true,
                                              children: <Widget>[
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 3.0,
                                                            bottom: 3),
                                                    child: Text(
                                                      'This is my Best Anime, i love  watching it!',
                                                      style: TextStyle(
                                                          color: Colors.white, fontWeight: FontWeight.w300,fontSize: 13),
                                                    ),
                                                  ),
                                                )
                                              ]),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/1.jpg'),
                                              fit: BoxFit.cover,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

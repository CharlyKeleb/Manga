import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Downloads extends StatefulWidget {
  @override
  _Downloads createState() => _Downloads();
}

class _Downloads extends State<Downloads> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
          children: <Widget>[
            SizedBox(
              width: 120,
            ),
            IconButton(icon: Icon(Feather.heart), onPressed: null),
            IconButton(icon: Icon(Feather.share), onPressed: null),
            IconButton(icon: Icon(Feather.bookmark), onPressed: null),
          ],
        )),
        body: ListView(children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 170,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(children: <Widget>[
                    Container(
                      height: 170,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/images/${Random().nextInt(16)}.jpg',
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 152,
                      width: 210,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Animes Collection',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Boruto Style',
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(height: 4),
                            Container(
                              height: 27,
                              width: 170,
                              child: Row(
                                children: <Widget>[
                                  Icon(Feather.eye,size: 15,
                                      color: Theme.of(context).accentColor),
                                  SizedBox(width: 3),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6.0),
                                    child: Text(
                                      '65K',
                                      style: TextStyle(
                                          color: Theme.of(context).accentColor),
                                    ),
                                  ),
                                  SizedBox(width: 2,),
                                  Icon(
                                    Feather.bookmark,size: 15,
                                    color: Theme.of(context).accentColor,
                                  ),
                                  SizedBox(width: 3),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6.0),
                                    child: Text(
                                      '4420',
                                      style: TextStyle(
                                          color: Theme.of(context).accentColor),
                                    ),
                                  ),
                                  SizedBox(width: 2,),
                                  Icon(
                                    Feather.star,size: 15,
                                    color: Theme.of(context).accentColor,
                                  ),
                                  SizedBox(width: 3),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6.0),
                                    child: Text(
                                      '4420',
                                      style: TextStyle(
                                          color: Theme.of(context).accentColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Feather.user,
                                  color: Colors.grey,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6.0),
                                  child: Text(' 420 Reviews '),
                                ),
                                Icon(Feather.chevron_right,
                                    color: Colors.grey, size: 13),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ]),
                ),
              ),
            ],
          ),
          ListTile(
            title: Text(
              'Summary',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Text(
              'more',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: Container(
              height: 80,
              width: 170,
              child: Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                    'Spice and Wolf Story Revolves Around Kraft Lawrence, a 25year old who travelling mercchant who peddles various goods from town to town to make a living'),
              ),
            ),
          ),
          Container(
            height: 45,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          height: 30,
                          width: 90,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                                bottomRight: Radius.circular(12)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Adventure',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Drama',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Fantasy',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Romance',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Shows',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Tv series',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Container(
            height: 35,
            width: MediaQuery.of(context).size.width,
            child: ListTile(
              title: Text(
                'Episode - 17',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                'Sort',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Column(children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                        topLeft: Radius.circular(16),
                      ),
                      image: DecorationImage(
                          image: AssetImage('assets/images/0.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    height: 19,
                    width: 300,
                    child: ListTile(
                      title: Text(
                        'Episode 19',
                        style: TextStyle(
                            fontSize: 10, color: Theme.of(context).accentColor),
                      ),
                      subtitle: Text('Solar Gold Coin(Vol 1)'),
                      trailing: Icon(
                        Feather.chevron_right,
                        size: 10,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                        topLeft: Radius.circular(16),
                      ),
                      image: DecorationImage(
                          image: AssetImage('assets/images/2.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    height: 19,
                    width: 300,
                    child: ListTile(
                      title: Text(
                        'Episode 16',
                        style: TextStyle(
                            fontSize: 10, color: Theme.of(context).accentColor),
                      ),
                      subtitle: Text('Solar Gold Coin(Vol 2)'),
                      trailing: Icon(
                        Feather.chevron_right,
                        size: 10,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                        topLeft: Radius.circular(16),
                      ),
                      image: DecorationImage(
                          image: AssetImage('assets/images/4.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    height: 19,
                    width: 300,
                    child: ListTile(
                      title: Text(
                        'Episode 12',
                        style: TextStyle(
                            fontSize: 10, color: Theme.of(context).accentColor),
                      ),
                      subtitle: Text('Lonely Smile'),
                      trailing: Icon(
                        Feather.chevron_right,
                        size: 10,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                        topLeft: Radius.circular(16),
                      ),
                      image: DecorationImage(
                          image: AssetImage('assets/images/6.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 19,
                    width: 300,
                    child: ListTile(
                      title:
                      Text(
                        'Episode 10',
                        style: TextStyle(
                            fontSize: 10, color: Theme.of(context).accentColor),
                      ),
                      subtitle: Text('Side Color'),
                      trailing: Icon(
                        Feather.chevron_right,
                        size: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          )
        ]));
  }
}

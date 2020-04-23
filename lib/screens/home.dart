import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:manga_ui/util/constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List compilation = [
    {
      "title": "10 Best Compilation Manga",
      "subtitle": "Nulla qutur sed, convallis at tellus."
    },
    {
      "title": "10 Best Compilation Anime",
      "subtitle": "Nulla quis lorem ut libero malesuada feugiat. Vivamus "
          "magna justo, lacinetur sed, convallis at tellus."
    },
    {
      "title": "10 Best Compilation Hentai",
      "subtitle": "Nulla quis loro malesuada feugiat. Vivamus "
          "magna justo, lacinia eget consectetur sed, convallis at tellus."
    },
    {
      "title": "10 Best Compilation Cartoon",
      "subtitle": "rem ut libero malesuada feugiat. Vivamus "
          "magna justo, lacinia eget consectetur sed, convallis at tellus."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "${Constants.appName}",
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).accentColor,
                    offset: Offset(0.0, 1.5),
                    blurRadius: 4.0,
                  ),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                color: Theme.of(context).accentColor,
              ),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Icon(
                      Feather.search,
                      color: Colors.white,
                      size: 17,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 10),
        children: <Widget>[
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: compilation.length,
              itemBuilder: (BuildContext context, int index) {
                MaterialColor color = Colors.primaries[Random().nextInt(16)];
                Map item = compilation[index];
                Compile i = Compile.fromJson(item);

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    width: 320,
                    decoration: BoxDecoration(
                      color: color,
                      boxShadow: [
                        BoxShadow(
                          color: color,
                          offset: Offset(0.0, 1.5),
                          blurRadius: 5.0,
                        ),
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              i.title,
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              i.subtitle,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
            child: Row(
              children: <Widget>[
                Text(
                  'Recent Trends',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Spacer(),
                Icon(
                  Feather.chevron_right,
                  size: 30,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 5,
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
                              "assets/images/${Random().nextInt(5)}.jpg",
                              height: 150,
                              width: 110,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Text("Hare kon"),
                      Text(
                        "Romance",
                        style: TextStyle(
                            color: Theme.of(context).accentColor, fontSize: 16),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:10.0, right: 10.0, top: 10, bottom: 10),
            child: Row(
              children: <Widget>[
                Text(
                  'Top Collections',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Spacer(),
                Icon(
                  Feather.chevron_right,
                  color: Colors.grey,
                  size: 30,
                )
              ],
            ),
          ),
          Container(
            height: 130,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      height: 130,
                      width: 40,
                      //color: Colors.amber,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        image: DecorationImage(
                            image: AssetImage('assets/images/0.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(width: 2),
                    Row(children: <Widget>[
                      Container(
                        height: 130,
                        width: 40,
                        //color: Colors.amber,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/2.jpg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ]),
                    SizedBox(width: 2),
                    Row(children: <Widget>[
                      Container(
                        height: 130,
                        width: 40,
                        //color: Colors.amber,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/4.jpg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ]),
                    SizedBox(width: 2),
                    Row(children: <Widget>[
                      Container(
                        height: 130,
                        width: 40,
                        //color: Colors.amber,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          image: DecorationImage(
                              image: AssetImage('assets/images/15.jpg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ]),
                    SizedBox(width: 20),
                    Row(
                      children: <Widget>[
                        Container(
                          height: 130,
                          width: 40,
                          //color: Colors.amber,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            image: DecorationImage(
                                image: AssetImage('assets/images/7.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(width: 2),
                        Row(children: <Widget>[
                          Container(
                            height: 130,
                            width: 40,
                            //color: Colors.amber,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/13.jpg'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ]),
                        SizedBox(width: 2),
                        Row(children: <Widget>[
                          Container(
                            height: 130,
                            width: 40,
                            //color: Colors.amber,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/3.jpg'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ]),
                        SizedBox(width: 2),
                        Row(children: <Widget>[
                          Container(
                            height: 130,
                            width: 40,
                            //color: Colors.amber,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              image: DecorationImage(
                                  image: AssetImage('assets/images/0.jpg'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Row(
                  children: <Widget>[
                    Container(
                      height: 130,
                      width: 40,
                      //color: Colors.amber,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        image: DecorationImage(
                            image: AssetImage('assets/images/4.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(width: 2),
                    Row(children: <Widget>[
                      Container(
                        height: 130,
                        width: 40,
                        //color: Colors.amber,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/1.jpg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ]),
                    SizedBox(width: 2),
                    Row(children: <Widget>[
                      Container(
                        height: 130,
                        width: 40,
                        //color: Colors.amber,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/0.jpg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ]),
                    SizedBox(width: 2),
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Row(children: <Widget>[
                        Container(
                          height: 130,
                          width: 40,
                          //color: Colors.amber,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            image: DecorationImage(
                                image: AssetImage('assets/images/2.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Compile {
  String title;
  String subtitle;

  Compile({this.title, this.subtitle});

  Compile.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    return data;
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MusicScreen extends StatefulWidget {
  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
          children: <Widget>[
            Spacer(),
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
                      height: 150,
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
                              'assets/images/14.jpg',
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
                                  fontSize: 19, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Music Style',
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(height: 5),
                            Container(
                              height: 27,
                              width: 170,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(Feather.eye,
                                      size: 15,
                                      color: Theme.of(context).accentColor),
                                  SizedBox(width: 3),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6.0),
                                    child: Text(
                                      '9M',
                                      style: TextStyle(
                                          color: Theme.of(context).accentColor),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Icon(
                                    Feather.bookmark,
                                    size: 15,
                                    color: Theme.of(context).accentColor,
                                  ),
                                  SizedBox(width: 3),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6.0),
                                    child: Text(
                                      '55K',
                                      style: TextStyle(
                                          color: Theme.of(context).accentColor),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Icon(
                                    Feather.star,
                                    size: 15,
                                    color: Theme.of(context).accentColor,
                                  ),
                                  SizedBox(width: 3),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6.0),
                                    child: Text(
                                      '8M',
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
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text(' 7M Reviews '),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Icon(Feather.chevron_right,
                                      color: Colors.grey, size: 13),
                                ),
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
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 5, right: 5),
            child: Container(
              height: 0.5,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Row(
              children: <Widget>[
                Text(
                  'Episodes 1-19',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Icon(Icons.arrow_drop_down, size: 30)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0, left: 5, right: 5),
            child: Container(
              height: 0.5,
              color: Colors.grey,
            ),
          ),
          Container(
            height: 320,
            width: MediaQuery.of(context).size.width,
            child: Column(children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: Container(
                      height: 70,
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
                  ),
                  SizedBox(
                    width: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      height: 50,
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Episode 19',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).accentColor)),
                          SizedBox(
                            height: 4,
                          ),
                          Text('Solar Gold Coin(Vol 1)',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, right: 10),
                    child: Icon(
                      Feather.chevron_right,
                      size: 15,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      height: 70,
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
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      height: 50,
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Episode 16',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).accentColor)),
                          SizedBox(
                            height: 4,
                          ),
                          Text('Solar Gold Coin(Vol 2)',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, right: 10),
                    child: Icon(
                      Feather.chevron_right,
                      size: 15,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      height: 70,
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
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      height: 50,
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Episode 17',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).accentColor)),
                          SizedBox(
                            height: 4,
                          ),
                          Text('The Deaf shall hear(Vol 1)',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, right: 10),
                    child: Icon(
                      Feather.chevron_right,
                      size: 15,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      height: 70,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                          topLeft: Radius.circular(16),
                        ),
                        image: DecorationImage(
                            image: AssetImage('assets/images/8.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      height: 50,
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Episode 14',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).accentColor)),
                          SizedBox(
                            height: 4,
                          ),
                          Text('Final Fights(Vol 2)',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, right: 10),
                    child: Icon(
                      Feather.chevron_right,
                      size: 15,
                    ),
                  )
                ],
              ),
            ]),
          )
        ]));
  }
}

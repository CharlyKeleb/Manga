import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manga_ui/providers/action_manga_provider.dart';
import 'package:manga_ui/providers/romance_anime_provider.dart';
import 'package:provider/provider.dart';
import 'package:manga_ui/providers/category_item_provider.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  PageController _pageController;
  int _page = 0;
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Popular Genres',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 30.0,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              physics: AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            navigationTapped(0);
                          });
                          selectItem(0);
                        },
                        child: Container(
                          height: 30,
                          width: 108,
                          decoration: BoxDecoration(
                            color: 0 == selectedItem ? Colors.red : Colors.pink,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.tv,
                                  color: 0 == selectedItem
                                      ? Colors.white
                                      : Colors.white,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 3.0),
                                  child: Text(
                                    'Recommended',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5.0),
                      InkWell(
                        onTap: () {
                          setState(() {
                            navigationTapped(1);
                          });
                          selectItem(1);
                        },
                        child: Container(
                          height: 30,
                          width: 110,
                          decoration: BoxDecoration(
                            color: 1 == selectedItem ? Colors.red : Colors.pink,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.whatshot,
                                  color: Theme.of(context).accentColor,
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
                      SizedBox(width: 5.0),
                      InkWell(
                        onTap: () {
                          setState(() {
                            navigationTapped(2);
                          });
                          selectItem(2);
                          print(_page);
                        },
                        child: Container(
                          height: 30,
                          width: 110,
                          decoration: BoxDecoration(
                            color: 2 == selectedItem ? Colors.red : Colors.pink,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 3.0),
                                  child: Text(
                                    'Romance',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5.0),
                      InkWell(
                        onTap: () {
                          setState(() {
                            navigationTapped(3);
                          });
                          selectItem(3);
                        },
                        child: Container(
                          height: 30,
                          width: 110,
                          decoration: BoxDecoration(
                            color: 3 == selectedItem ? Colors.red : Colors.pink,
                            borderRadius: BorderRadius.circular(20.0),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: onPageChanged,
                children: [
                  buildRecommended(),
                  buildActionAnime(),
                  buildRomanceAnime(),
                  buildAdventureAnime(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRecommended() {
    return Column(
      children: [
        ListTile(
          leading: Text(
            'Recommended',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20.0),
          ),
          trailing: Icon(Icons.arrow_drop_down_sharp),
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Column(
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
                  Text("Dragon ball Z"),
                  Text(
                    "Manga",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        ListTile(
          leading: Text(
            'New Trends',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20.0),
          ),
          trailing: Icon(Icons.arrow_drop_down_sharp),
        ),
        Container(
          height: 225,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 210,
                    width: 135,
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
                  SizedBox(height: 3.0),
                  Center(
                    child: Text(
                      "Boruto-Naruto",
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        )
      ],
    );
  }

  Widget buildActionAnime() {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        FutureBuilder(
          future: Provider.of<CategoryAnimeProvider>(context, listen: false)
              .fetchAndSetByCategories('anime', 'action', 0),
          builder: (context, dataSnapShot) {
            if (dataSnapShot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (dataSnapShot.error == null) {
              print('successful');
              return Consumer<CategoryAnimeProvider>(
                builder: (context, anime, _) {
                  return Column(
                    children: [
                      ListTile(
                        leading: Text(
                          'Anime\'s 💥',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 20.0),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: anime.movieItems.length,
                            itemBuilder: (BuildContext context, int i) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 230,
                                    width: 135,
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
                                        child: Image.network(
                                          anime.movieItems[i]?.coverImage ?? "",
                                          height: 210,
                                          width: 135,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 3.0),
                                  Center(
                                    child: Text(
                                      anime.movieItems[i].title,
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).accentColor,
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          'Manga\'s 💥',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 20.0),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  );
                },
              );
            } else {
              return Center(
                child: Text(
                  dataSnapShot.error.toString(),
                ),
              );
            }
          },
        ),
        FutureBuilder(
          future: Provider.of<ActionMangaProvider>(context, listen: false)
              .fetchAndActionManga(0),
          builder: (context, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (dataSnapshot.error == null) {
              print('successful');
              print(dataSnapshot.data);
              return Consumer<ActionMangaProvider>(
                builder: (context, manga, _) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: manga.movieItems.length,
                        itemBuilder: (BuildContext context, int i) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 230,
                                width: 135,
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
                                    child: Image.network(
                                      manga.movieItems[i]?.posterImage ?? "",
                                      height: 210,
                                      width: 135,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 3.0),
                              Center(
                                child: Text(
                                  manga.movieItems[i].title,
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text(dataSnapshot.error),
              );
            }
          },
        )
      ],
    );
  }

  Widget buildRomanceAnime() {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        FutureBuilder(
          future: Provider.of<RomanceAnimeProvider>(context, listen: false)
              .fetchAndRomanceAnime(10),
          builder: (context, dataSnapShot) {
            if (dataSnapShot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (dataSnapShot.error == null) {
              print('successful');
              return Consumer<CategoryAnimeProvider>(
                builder: (context, anime, _) {
                  return Column(
                    children: [
                      ListTile(
                        leading: Text(
                          'Anime\'s 💥',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 20.0),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      Container(
                        height: 230,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: anime.movieItems.length,
                          itemBuilder: (BuildContext context, int i) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 210,
                                  width: 135,
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
                                      child: Image.network(
                                        anime.movieItems[i].coverImage,
                                        height: 210,
                                        width: 135,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 3.0),
                                Center(
                                  child: Text(
                                    anime.movieItems[i].type,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).accentColor,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          'Manga\'s 💥',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 20.0),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      // FutureBuilder(
                      //     future: Provider.of<CategoryAnimeProvider>(context,
                      //             listen: false)
                      //         .fetchAndSetByCategories('manga', 'romance', 10),
                      //     builder: (context, dataSnapShot) {
                      //       if (dataSnapShot.connectionState ==
                      //           ConnectionState.waiting) {
                      //         return Center(child: CircularProgressIndicator());
                      //       } else if (dataSnapShot.error == null) {
                      //         print('successful');
                      //         return Consumer<CategoryAnimeProvider>(
                      //             builder: (context, manga, _) {
                      //           return Container(
                      //             height: 230.0,
                      //             width: MediaQuery.of(context).size.width,
                      //             child: ListView.builder(
                      //               scrollDirection: Axis.horizontal,
                      //               shrinkWrap: true,
                      //               itemCount: manga.movieItems.length,
                      //               itemBuilder: (BuildContext context, int i) {
                      //                 return Column(
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.start,
                      //                   children: <Widget>[
                      //                     Container(
                      //                       height: 210,
                      //                       width: 135,
                      //                       child: Card(
                      //                         shape: RoundedRectangleBorder(
                      //                           borderRadius: BorderRadius.all(
                      //                             Radius.circular(10),
                      //                           ),
                      //                         ),
                      //                         elevation: 4,
                      //                         child: ClipRRect(
                      //                           borderRadius: BorderRadius.all(
                      //                             Radius.circular(10),
                      //                           ),
                      //                           child: Image.network(
                      //                             manga.movieItems[i].coverImage,
                      //                             height: 210,
                      //                             width: 135,
                      //                             fit: BoxFit.cover,
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     ),
                      //                     SizedBox(height: 3.0),
                      //                     Center(
                      //                       child: Text(
                      //                         manga.movieItems[i].title,
                      //                         style: TextStyle(
                      //                           fontWeight: FontWeight.bold,
                      //                           color:
                      //                               Theme.of(context).accentColor,
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 );
                      //               },
                      //             ),
                      //           );
                      //         });
                      //       } else {
                      //         return Center(
                      //           child: Text(
                      //             dataSnapShot.error.toString(),
                      //           ),
                      //         );
                      //       }
                      //     })
                    ],
                  );
                },
              );
            } else {
              return Center(
                child: Text(
                  dataSnapShot.error.toString(),
                ),
              );
            }
          },
        ),
      ],
    );
  }

  Widget buildAdventureAnime() {
    return FutureBuilder(
      future: Provider.of<CategoryAnimeProvider>(context, listen: false)
          .fetchAndSetByCategories('anime', 'adventure', 10),
      builder: (context, dataSnapShot) {
        if (dataSnapShot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (dataSnapShot.error == null) {
          print('successful');
          return Consumer<CategoryAnimeProvider>(
            builder: (context, anime, _) {
              return Column(
                children: [
                  ListTile(
                    leading: Text(
                      'Anime\'s 💥',
                      style: TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 20.0),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Container(
                    height: 230,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: anime.movieItems.length,
                      itemBuilder: (BuildContext context, int i) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 210,
                              width: 135,
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
                                  child: Image.network(
                                    anime.movieItems[i].coverImage,
                                    height: 210,
                                    width: 135,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 3.0),
                            Center(
                              child: Text(
                                anime.movieItems[i].title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  ListTile(
                    leading: Text(
                      'Manga\'s 💥',
                      style: TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 20.0),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  // FutureBuilder(
                  //     future: Provider.of<CategoryAnimeProvider>(context,
                  //             listen: false)
                  //         .fetchAndSetByCategories('manga', 'adventure', 10),
                  //     builder: (context, dataSnapShot) {
                  //       if (dataSnapShot.connectionState ==
                  //           ConnectionState.waiting) {
                  //         return Center(child: CircularProgressIndicator());
                  //       } else if (dataSnapShot.error == null) {
                  //         print('successful');
                  //         return Consumer<CategoryAnimeProvider>(
                  //             builder: (context, manga, _) {
                  //           return Container(
                  //             height: 230.0,
                  //             width: MediaQuery.of(context).size.width,
                  //             child: ListView.builder(
                  //               scrollDirection: Axis.horizontal,
                  //               shrinkWrap: true,
                  //               itemCount: manga.movieItems.length,
                  //               itemBuilder: (BuildContext context, int i) {
                  //                 return Column(
                  //                   crossAxisAlignment:
                  //                       CrossAxisAlignment.start,
                  //                   children: <Widget>[
                  //                     Container(
                  //                       height: 210,
                  //                       width: 135,
                  //                       child: Card(
                  //                         shape: RoundedRectangleBorder(
                  //                           borderRadius: BorderRadius.all(
                  //                             Radius.circular(10),
                  //                           ),
                  //                         ),
                  //                         elevation: 4,
                  //                         child: ClipRRect(
                  //                           borderRadius: BorderRadius.all(
                  //                             Radius.circular(10),
                  //                           ),
                  //                           child: Image.network(
                  //                             manga.movieItems[i].coverImage,
                  //                             height: 210,
                  //                             width: 135,
                  //                             fit: BoxFit.cover,
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     ),
                  //                     SizedBox(height: 3.0),
                  //                     Center(
                  //                       child: Text(
                  //                         manga.movieItems[i].title,
                  //                         style: TextStyle(
                  //                           fontWeight: FontWeight.bold,
                  //                           color:
                  //                               Theme.of(context).accentColor,
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 );
                  //               },
                  //             ),
                  //           );
                  //         });
                  //       } else {
                  //         return Center(
                  //           child: Text(
                  //             dataSnapShot.error.toString(),
                  //           ),
                  //         );
                  //       }
                  //     })
                ],
              );
            },
          );
        } else {
          return Center(
            child: Text(
              dataSnapShot.error.toString(),
            ),
          );
        }
      },
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  selectItem(page) {
    setState(() {
      selectedItem = page;
    });
  }
}

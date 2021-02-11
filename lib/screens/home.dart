import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:manga_ui/providers/anime_items_provider.dart';
import 'package:manga_ui/providers/popular_anime_item.dart';
import 'package:manga_ui/providers/trending_anime_provider.dart';
import 'package:manga_ui/screens/search.dart';
import 'package:manga_ui/util/constants.dart';
import 'package:provider/provider.dart';

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
                  onTap: () {
                    Navigator.push(
                        context, CupertinoPageRoute(builder: (_) => Search()));
                  },
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
            // child: ListView.builder(
            //   scrollDirection: Axis.horizontal,
            //   shrinkWrap: true,
            //   itemCount: compilation.length,
            //   itemBuilder: (BuildContext context, int index) {
            //     MaterialColor color = Colors.primaries[Random().nextInt(16)];
            //     Map item = compilation[index];
            //     Compile i = Compile.fromJson(item);
            //
            //     return Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Container(
            //         height: 200,
            //         width: 320,
            //         decoration: BoxDecoration(
            //           color: color,
            //           boxShadow: [
            //             BoxShadow(
            //               color: color,
            //               offset: Offset(0.0, 1.5),
            //               blurRadius: 5.0,
            //             ),
            //           ],
            //           borderRadius: BorderRadius.all(
            //             Radius.circular(15),
            //           ),
            //         ),
            //         child: Align(
            //           alignment: Alignment.bottomLeft,
            //           child: Padding(
            //             padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.end,
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: <Widget>[
            //                 Text(
            //                   i.title,
            //                   style: TextStyle(
            //                     fontSize: 17,
            //                     color: Colors.white,
            //                   ),
            //                 ),
            //                 SizedBox(
            //                   height: 5,
            //                 ),
            //                 Text(
            //                   i.subtitle,
            //                   style: TextStyle(
            //                     fontSize: 12,
            //                     color: Colors.white,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //     );
            //   },
            // ),
            child: FutureBuilder(
              future: Provider.of<AnimeItemsProvider>(context, listen: false)
                  .fetchAndSetMovieItems("anime", 10),
              builder: (context, dataSnapShot) {
                if (dataSnapShot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (dataSnapShot.error == null) {
                  print('successful');
                  return Consumer<AnimeItemsProvider>(
                    builder: (context, anime, _) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: anime.movieItems.length,
                        itemBuilder: (BuildContext context, i) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 200,
                              width: 320,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      anime.movieItems[i].coverImage),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context).accentColor,
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 1.0,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        anime.movieItems[i].title,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                } else {
                  return Center(child: Text(dataSnapShot.error.toString()));
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10, top: 20.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Recent Trends',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
            child: FutureBuilder(
              future:
                  Provider.of<TrendingAnimesProvider>(context, listen: false)
                      .fetchAndSetMovieItems('anime', 10),
              builder: (context, dataSnapShot) {
                if (dataSnapShot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (dataSnapShot.error == null) {
                  print('successful');
                  return Consumer<TrendingAnimesProvider>(
                    builder: (context, anime, _) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        reverse: true,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, i) {
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
                                      // child: Image.asset(
                                      //   "assets/images/${Random().nextInt(5)}.jpg",
                                      //   height: 150,
                                      //   width: 110,
                                      //   fit: BoxFit.cover,
                                      // ),
                                      child: Image.network(
                                        anime.movieItems[i].coverImage,
                                        height: 150.0,
                                        width: 110,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  anime.movieItems[i].title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0,
                                  ),
                                ),
                                Text(
                                  anime.movieItems[i].type,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).accentColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  );
                } else {
                  return Center(child: Text(dataSnapShot.error.toString()));
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
              top: 10,
              bottom: 10,
            ),
            child: Row(
              children: <Widget>[
                Text(
                  'Top Manga\'s of the week',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
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
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder(
              future: Provider.of<PopularAnimeProvider>(context, listen: false)
                  .fetchAndSetPopularMovieItems('manga', 10),
              builder: (context, dataSnapShot) {
                if (dataSnapShot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (dataSnapShot.error == null) {
                  print('Successful');
                  return Consumer<PopularAnimeProvider>(
                    builder: (context, manga, _) {
                      return ListView.builder(
                        itemCount: manga.movieItems.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int i) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Container(
                                  height: 130.0,
                                  width: 160.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Theme.of(context).accentColor,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        manga.movieItems[i]?.posterImage ?? "",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.0),
                                Text(
                                  manga.movieItems[i].title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                      color: Theme.of(context).accentColor),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                  );
                } else
                  return Center(
                    child: Text(
                      dataSnapShot.error.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
              },
            ),
          ),
        ],
      ),
    );
  }
}
//
// class Compile {
//   String title;
//   String subtitle;
//
//   Compile({this.title, this.subtitle});
//
//   Compile.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     subtitle = json['subtitle'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['title'] = this.title;
//     data['subtitle'] = this.subtitle;
//     return data;
//   }
// }

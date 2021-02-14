import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:manga_ui/providers/items/anime_items_provider.dart';
import 'package:manga_ui/providers/popular/popular_anime_item.dart';
import 'package:manga_ui/providers/trending/trending_anime_provider.dart';
import 'package:manga_ui/screens/search.dart';
import 'package:manga_ui/screens/settings.dart';
import 'package:manga_ui/util/constants.dart';
import 'package:manga_ui/widgets/details.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var initOffset = Random().nextInt(4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: InkWell(
          onTap: (){
            Navigator.push(context, CupertinoPageRoute(builder: (_)=>Settings()));
          },
          child: Text(
            "${Constants.appName}",
          ),
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
                        context,
                        CupertinoPageRoute(
                          builder: (_) => Search(),
                        ));
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
            child: FutureBuilder(
              future: Provider.of<AnimeItemsProvider>(context, listen: false)
                  .fetchAndSetMovieItems("anime", initOffset),
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
                            child: CachedNetworkImage(
                              imageUrl: anime.movieItems[i]?.coverImage ??
                                  'https://images.app.goo.gl/d2AGCefmiJmpF8QA8',
                              imageBuilder: (context, imageProvider) => InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (_) => Details(
                                        movie: anime.movieItems[i],
                                      ),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: anime.movieItems[i].id,
                                  child: Container(
                                    height: 200,
                                    width: 320,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
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
                                        padding:
                                            EdgeInsets.fromLTRB(16, 0, 16, 16),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              anime.movieItems[i].title,
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              placeholder: (context, url) => Center(
                                child: SpinKitFadingCircle(
                                  size: 25,
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                              errorWidget: (context, url, error) => Center(
                                child: SizedBox(width: 0.1),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Container(
                      height: 42.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 1.5),
                            blurRadius: 1.0,
                          ),
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          onTap: () => Provider.of<AnimeItemsProvider>(context, listen: false)
                              .fetchAndSetMovieItems("anime", initOffset),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Retry',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.w900,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
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
                InkWell(
                  onTap: () {
                    setState(() {
                      initOffset += 10;
                    });
                  },
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder(
              future:
                  Provider.of<TrendingAnimesProvider>(context, listen: false)
                      .fetchAndSetMovieItems('anime', initOffset),
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
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (_) => Details(
                                          movie: anime.movieItems[i],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: anime.movieItems[i].id,
                                    child: Container(
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
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                anime.movieItems[i].coverImage,
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              height: 150.0,
                                              width: 110.0,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            placeholder: (context, url) =>
                                                Center(
                                              child: SpinKitFadingCircle(
                                                size: 25,
                                                color: Theme.of(context)
                                                    .accentColor,
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) => Center(
                                              child: Icon(
                                                Icons.error,
                                              ),
                                            ),
                                          ),
                                        ),
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
                                Center(
                                  child: Text(
                                    anime.movieItems[i].type,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).accentColor,
                                      fontSize: 16,
                                    ),
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
                  return Center(
                    child: Container(
                      height: 42.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 1.5),
                            blurRadius: 1.0,
                          ),
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Retry',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.w900,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
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
                InkWell(
                  onTap: () {
                    setState(() {
                      initOffset += 10;
                    });
                  },
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder(
              future: Provider.of<PopularAnimeProvider>(context, listen: false)
                  .fetchAndSetPopularMovieItems('manga', initOffset),
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
                                CachedNetworkImage(
                                  imageUrl: manga.movieItems[i].posterImage,
                                  imageBuilder: (context, imageProvider) =>
                                      InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (_) => Details(
                                            movie: manga.movieItems[i],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: manga.movieItems[i].id,
                                      child: Container(
                                        height: 150.0,
                                        width: 160.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          color: Theme.of(context).accentColor,
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.0),
                                Text(
                                  manga.movieItems[i].title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0,
                                    color: Theme.of(context).accentColor,
                                  ),
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
                    child: Container(
                      height: 42.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 1.5),
                            blurRadius: 1.0,
                          ),
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Retry',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.w900,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
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

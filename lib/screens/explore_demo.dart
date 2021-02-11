import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:manga_ui/providers/anime_items_provider.dart';
import 'package:manga_ui/providers/popular_anime_item.dart';
import 'package:manga_ui/providers/trending_anime_provider.dart';
import 'package:provider/provider.dart';

class ExploreDemo extends StatefulWidget {
  @override
  _ExploreDemoState createState() => _ExploreDemoState();
}

class _ExploreDemoState extends State<ExploreDemo> {
  PageController _pageController;
  int _page = 0;
  int selectedItem = 0;

  buildTitle() {
    if (0 == selectedItem) {
      return Text('Manga Series');
    } else if (1 == selectedItem) {
      return Text('Anime Series');
    } else if (2 == selectedItem) {
      return Text('Popular Manga\'s');
    } else if (3 == selectedItem) {
      return Text('Popular Anime\'s');
    } else if (4 == selectedItem) {
      return Text('Trending Manga\'s');
    } else if (5 == selectedItem) {
      return Text('Trending Anime\'s');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildTitle(),
      ),
      body: Column(
        children: [
          Row(
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
                  height: 35.0,
                  width: 35.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: 0 == selectedItem ? Colors.red : Colors.grey[300],
                  ),
                  child: Center(
                    child: Icon(
                      Feather.tablet,
                      color: 0 == selectedItem ? Colors.white : Colors.black,
                      size: 15.0,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    navigationTapped(1);
                  });
                  selectItem(1);
                  print(_page);
                },
                child: Container(
                  height: 35.0,
                  width: 35.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: 1 == selectedItem ? Colors.red : Colors.grey[300],
                  ),
                  child: Center(
                    child: Icon(
                      Feather.tv,
                      color: 1 == selectedItem ? Colors.white : Colors.black,
                      size: 15.0,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    navigationTapped(2);
                  });
                  selectItem(2);
                },
                child: Container(
                  height: 35.0,
                  width: 35.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: 2 == selectedItem ? Colors.red : Colors.grey[300],
                  ),
                  child: Center(
                    child: Icon(
                      Feather.globe,
                      color: 2 == selectedItem ? Colors.white : Colors.black,
                      size: 15.0,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    navigationTapped(3);
                  });
                  selectItem(3);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Container(
                    height: 35.0,
                    width: 35.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: 3 == selectedItem ? Colors.red : Colors.grey[300],
                    ),
                    child: Center(
                      child: Icon(
                        Feather.map,
                        color: 3 == selectedItem ? Colors.white : Colors.black,
                        size: 15.0,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    navigationTapped(4);
                  });
                  selectItem(4);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Container(
                    height: 35.0,
                    width: 35.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: 4 == selectedItem ? Colors.red : Colors.grey[300],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.whatshot_sharp,
                        color: 4 == selectedItem ? Colors.white : Colors.black,
                        size: 15.0,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    navigationTapped(5);
                  });
                  selectItem(5);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Container(
                    height: 35.0,
                    width: 35.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: 5 == selectedItem ? Colors.red : Colors.grey[300],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.whatshot,
                        color: 5 == selectedItem ? Colors.white : Colors.black,
                        size: 15.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: onPageChanged,
                children: [
                  //MangaSeries(),
                  buildMangaSeries(),
                  //AnimeSeries(),
                  buildAnimeSeries(),
                  //TrendingManga(),
                  buildTrendingManga(),
                  //TrendingAnime(),
                  buildTrendingAnime(),
                  // PopularManga(),
                  buildPopularManga(),
                  //  PopularAnime(),
                  buildPopularAnime()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildMangaSeries() {
    return FutureBuilder(
      future: Provider.of<AnimeItemsProvider>(context, listen: false)
          .fetchAndSetMovieItems('manga', 10),
      builder: (context, dataSnapShot) {
        if (dataSnapShot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (dataSnapShot.error == null) {
          print('successfull');
          return Consumer<AnimeItemsProvider>(
            builder: (context, manga, _) {
              return GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.8 / 2.3,
                ),
                itemBuilder: (BuildContext context, int i) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (_) => HeroDetails(
                          //       hero: superhero,
                          //     ),
                          //   ),
                          // );
                        },
                        child: Hero(
                          tag: manga.movieItems[i].coverImage,
                          child: Container(
                            height: 200,
                            width: 150,
                            child: Card(
                              color: Theme.of(context).accentColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 5,
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: manga.movieItems[i].posterImage,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
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
                                    child: Icon(
                                      Icons.sentiment_very_dissatisfied,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.5),
                      Text(
                        manga.movieItems[i].title,
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                },
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

  Widget buildAnimeSeries() {
    return FutureBuilder(
      future: Provider.of<AnimeItemsProvider>(context, listen: false)
          .fetchAndSetMovieItems('anime', 10),
      builder: (context, dataSnapShot) {
        if (dataSnapShot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (dataSnapShot.error == null) {
          print('successfull');
          return Consumer<AnimeItemsProvider>(
            builder: (context, anime, _) {
              return GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.8 / 2.3,
                ),
                itemBuilder: (BuildContext context, int i) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (_) => HeroDetails(
                          //       hero: superhero,
                          //     ),
                          //   ),
                          // );
                        },
                        child: Hero(
                          tag: anime.movieItems[i].coverImage,
                          child: Container(
                            height: 200,
                            width: 150,
                            child: Card(
                              color: Theme.of(context).accentColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 5,
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: anime.movieItems[i].posterImage,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
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
                                    child: Icon(
                                      Icons.sentiment_very_dissatisfied,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.5),
                      Text(
                        anime.movieItems[i].title,
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                },
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

  Widget buildTrendingManga() {
    return FutureBuilder(
      future: Provider.of<TrendingAnimesProvider>(context, listen: false)
          .fetchAndSetMovieItems('manga', 9),
      builder: (context, dataSnapShot) {
        if (dataSnapShot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (dataSnapShot.error == null) {
          print('successfull');
          return Consumer<TrendingAnimesProvider>(
            builder: (context, manga, _) {
              return GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.8 / 2.3,
                ),
                itemBuilder: (BuildContext context, int i) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (_) => HeroDetails(
                          //       hero: superhero,
                          //     ),
                          //   ),
                          // );
                        },
                        child: Hero(
                          tag: manga.movieItems[i].coverImage,
                          child: Container(
                            height: 200,
                            width: 150,
                            child: Card(
                              color: Theme.of(context).accentColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 5,
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: manga.movieItems[i].posterImage,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
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
                                    child: Icon(
                                      Icons.sentiment_very_dissatisfied,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.5),
                      Text(
                        manga.movieItems[i].title,
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                },
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

  Widget buildTrendingAnime() {
    return FutureBuilder(
      future: Provider.of<TrendingAnimesProvider>(context, listen: false)
          .fetchAndSetMovieItems('anime', 9),
      builder: (context, dataSnapShot) {
        if (dataSnapShot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (dataSnapShot.error == null) {
          print('successfull');
          return Consumer<TrendingAnimesProvider>(
            builder: (context, anime, _) {
              return GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.8 / 2.3,
                ),
                itemBuilder: (BuildContext context, int i) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (_) => HeroDetails(
                          //       hero: superhero,
                          //     ),
                          //   ),
                          // );
                        },
                        child: Hero(
                          tag: anime.movieItems[i].coverImage,
                          child: Container(
                            height: 200,
                            width: 150,
                            child: Card(
                              color: Theme.of(context).accentColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 5,
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: anime.movieItems[i].posterImage,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
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
                                    child: Icon(
                                      Icons.sentiment_very_dissatisfied,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.5),
                      Text(
                        anime.movieItems[i].title,
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                },
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

  Widget buildPopularManga() {
    return FutureBuilder(
      future: Provider.of<PopularAnimeProvider>(context, listen: false)
          .fetchAndSetPopularMovieItems('manga', 9),
      builder: (context, dataSnapShot) {
        if (dataSnapShot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (dataSnapShot.error == null) {
          print('successfull');
          return Consumer<PopularAnimeProvider>(
            builder: (context, manga, _) {
              return GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.8 / 2.3,
                ),
                itemBuilder: (BuildContext context, int i) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (_) => HeroDetails(
                          //       hero: superhero,
                          //     ),
                          //   ),
                          // );
                        },
                        child: Hero(
                          tag: manga.movieItems[i].coverImage,
                          child: Container(
                            height: 200,
                            width: 150,
                            child: Card(
                              color: Theme.of(context).accentColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 5,
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: manga.movieItems[i].posterImage,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
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
                                    child: Icon(
                                      Icons.sentiment_very_dissatisfied,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.5),
                      Text(
                        manga.movieItems[i].title,
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                },
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

  Widget buildPopularAnime() {
    return FutureBuilder(
      future: Provider.of<PopularAnimeProvider>(context, listen: false)
          .fetchAndSetPopularMovieItems('anime', 9),
      builder: (context, dataSnapShot) {
        if (dataSnapShot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (dataSnapShot.error == null) {
          print('successfull');
          return Consumer<PopularAnimeProvider>(
            builder: (context, anime, _) {
              return GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.8 / 2.3,
                ),
                itemBuilder: (BuildContext context, int i) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (_) => HeroDetails(
                          //       hero: superhero,
                          //     ),
                          //   ),
                          // );
                        },
                        child: Hero(
                          tag: anime.movieItems[i].coverImage,
                          child: Container(
                            height: 200,
                            width: 150,
                            child: Card(
                              color: Theme.of(context).accentColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 5,
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: anime.movieItems[i].posterImage,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
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
                                    child: Icon(
                                      Icons.sentiment_very_dissatisfied,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.5),
                      Text(
                        anime.movieItems[i].title,
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                },
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

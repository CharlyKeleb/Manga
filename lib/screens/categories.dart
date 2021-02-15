import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:manga_ui/providers/action/action_manga_provider.dart';
import 'package:manga_ui/providers/action/category_item_provider.dart';
import 'package:manga_ui/providers/adventure/adventure_anime_provider.dart';
import 'package:manga_ui/providers/adventure/adventure_manga_provider.dart';
import 'package:manga_ui/providers/romance/romance_anime_provider.dart';
import 'package:manga_ui/providers/romance/romance_manga_provider.dart';
import 'package:manga_ui/widgets/details.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  PageController _pageController;
  int _page = 0;
  int selectedItem = 0;
  var initOffset = Random().nextInt(5);

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
                  child: Container(
                    height: 30.0,
                    width:MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            width: 110,
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
                  //      SizedBox(width: 5.0),
                        InkWell(
                          onTap: () {
                            setState(() {
                              navigationTapped(1);
                            });
                            selectItem(1);
                            print(_page);
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
                     //   SizedBox(width: 5.0),
                        InkWell(
                          onTap: () {
                            setState(() {
                              navigationTapped(2);
                            });
                            selectItem(2);
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



  Widget buildActionAnime() {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        FutureBuilder(
          future: Provider.of<CategoryAnimeProvider>(context, listen: false)
              .fetchAndSetByCategories('anime', 'action', initOffset),
          builder: (context, dataSnapShot) {
            if (dataSnapShot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Container(
                  height: 300.0,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
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
                        trailing: InkWell(
                          onTap: () {
                            setState(() {
                              initOffset += 10;
                            });
                          },
                          child: Icon(Icons.arrow_forward_ios),
                        ),
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
                                            child: CachedNetworkImage(
                                              imageUrl: anime
                                                  .movieItems[i].coverImage,
                                              imageBuilder:
                                                  (context, imageProvider) =>
                                                      Container(
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
                                                  (context, url, error) =>
                                                      Center(
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
                                  SizedBox(height: 3.0),
                                  Center(
                                    child: Container(
                                      width: 110.0,
                                      child: Center(
                                        child: Text(
                                          anime.movieItems[i].title,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Theme.of(context).accentColor,
                                          ),
                                        ),
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
                        trailing: InkWell(
                          onTap: () {
                            setState(() {
                              initOffset += 10;
                            });
                          },
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  );
                },
              );
            } else {
              return Container(
                height: 100.0,
                child: Center(
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
                ),
              );
            }
          },
        ),
        FutureBuilder(
          future: Provider.of<ActionMangaProvider>(context, listen: false)
              .fetchAndActionManga(initOffset),
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
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              manga.movieItems[i].posterImage,
                                          imageBuilder:
                                              (context, imageProvider) =>
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
                                              color:
                                                  Theme.of(context).accentColor,
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Center(
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
                              SizedBox(height: 3.0),
                              Center(
                                child: Container(
                                  width: 110.0,
                                  child: Center(
                                    child: Text(
                                      manga.movieItems[i].title,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).accentColor,
                                      ),
                                    ),
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
              return Container(
                height: 500.0,
                child: Center(
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
                ),
              );
            }
          },
        )
      ],
    );
  }

  Widget buildRomanceAnime() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        FutureBuilder(
          future: Provider.of<RomanceAnimeProvider>(context, listen: false)
              .fetchAndRomanceAnime(initOffset),
          builder: (context, dataSnapShot) {
            if (dataSnapShot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Container(
                  height: 300.0,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            } else if (dataSnapShot.error == null) {
              print('successful');
              return Consumer<RomanceAnimeProvider>(
                builder: (context, anime, _) {
                  return Column(
                    children: [
                      ListTile(
                        leading: Text(
                          'Anime\'s 💥',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 20.0),
                        ),
                        trailing: InkWell(
                          onTap: () {
                            setState(() {
                              initOffset += 10;
                            });
                          },
                          child: Icon(Icons.arrow_forward_ios),
                        ),
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
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                anime.movieItems[i].coverImage,
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
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
                                SizedBox(height: 3.0),
                                Center(
                                  child: Container(
                                    width: 135.0,
                                    child: Center(
                                      child: Text(
                                        anime.movieItems[i].title,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).accentColor,
                                        ),
                                      ),
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
                        trailing: InkWell(
                          onTap: () {
                            setState(() {
                              initOffset += 10;
                            });
                          },
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  );
                },
              );
            } else {
              return Container(
                height: 100.0,
                child: Center(
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
                ),
              );
            }
          },
        ),
        FutureBuilder(
          future: Provider.of<RomanceMangaProvider>(context, listen: false)
              .fetchAndRomanceManga(initOffset),
          builder: (context, dataSnapShot) {
            if (dataSnapShot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (dataSnapShot.error == null) {
              print('successful');
              return Consumer<RomanceMangaProvider>(
                  builder: (context, manga, _) {
                return Container(
                  height: 230.0,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: manga.movieItems.length,
                    itemBuilder: (BuildContext context, int i) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
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
                                      errorWidget: (context, url, error) =>
                                          Center(
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
                          SizedBox(height: 3.0),
                          Center(
                            child: Container(
                              width: 135.0,
                              child: Center(
                                child: Text(
                                  manga.movieItems[i].title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                );
              });
            } else {
              return Container(
                height: 500,
                child: Center(
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
                ),
              );
            }
          },
        )
      ],
    );
  }

  Widget buildAdventureAnime() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        FutureBuilder(
          future: Provider.of<AdventureAnimeProvider>(context, listen: false)
              .fetchAndRomanceManga(initOffset),
          builder: (context, dataSnapShot) {
            if (dataSnapShot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Container(
                  height: 300.0,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            } else if (dataSnapShot.error == null) {
              print('successful');
              return Consumer<AdventureAnimeProvider>(
                builder: (context, anime, _) {
                  return Column(
                    children: [
                      ListTile(
                        leading: Text(
                          'Anime\'s 💥',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 20.0),
                        ),
                        trailing: InkWell(
                          onTap: () {
                            setState(() {
                              initOffset += 10;
                            });
                          },
                          child: Icon(Icons.arrow_forward_ios),
                        ),
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
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                anime.movieItems[i].coverImage,
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
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
                                SizedBox(height: 3.0),
                                Center(
                                  child: Container(
                                    width: 135.0,
                                    child: Center(
                                      child: Text(
                                        anime.movieItems[i].title,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).accentColor,
                                        ),
                                      ),
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
                        trailing: InkWell(
                          onTap: () {
                            setState(() {
                              initOffset += 10;
                            });
                          },
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  );
                },
              );
            } else {
              return Container(
                height: 100,
                child: Center(
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
                ),
              );
            }
          },
        ),
        FutureBuilder(
          future: Provider.of<AdventureMangaProvider>(context, listen: false)
              .fetchAndRomanceManga(initOffset),
          builder: (context, dataSnapShot) {
            if (dataSnapShot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (dataSnapShot.error == null) {
              print('successful');
              return Consumer<AdventureMangaProvider>(
                builder: (context, manga, _) {
                  return Container(
                    height: 230.0,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: manga.movieItems.length,
                      itemBuilder: (BuildContext context, int i) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
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
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            manga.movieItems[i].posterImage,
                                        imageBuilder:
                                            (context, imageProvider) =>
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
                                            color:
                                                Theme.of(context).accentColor,
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Center(
                                          child: Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 3.0),
                            Center(
                              child: Container(
                                width: 135.0,
                                child: Center(
                                  child: Text(
                                    manga.movieItems[i].title,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).accentColor,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  );
                },
              );
            } else {
              return Container(
                height: 500,
                child: Center(
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
                ),
              );
            }
          },
        )
      ],
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

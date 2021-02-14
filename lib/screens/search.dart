import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:manga_ui/providers/items/anime_items_provider.dart';
import 'package:manga_ui/widgets/details.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController mangaTEC = TextEditingController();
  var _search = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.keyboard_backspace)),
        title: Flexible(
          child: TextField(
            controller: mangaTEC,
            decoration:
                InputDecoration.collapsed(hintText: 'Search an Anime or Manga'),
            onSubmitted: (value) {
              setState(() {
                _search = true;
              });
            },
          ),
        ),
      ),
      body: _search
          ? FutureBuilder(
              future: Provider.of<AnimeItemsProvider>(context, listen: false)
                  .searchAndSetSeries(mangaTEC.text),
              builder: (ctx, dataSnapshot) {
                if (dataSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (dataSnapshot.error == null) {
                  print("ui rendered");
                  return Consumer<AnimeItemsProvider>(
                    builder: (ctx, anime, _) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.8 / 2.3,
                          ),
                          itemCount: anime.movieItems.length,
                          itemBuilder: (BuildContext context, int i) {
                            return Column(
                              children: [
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
                                      height: 200,
                                      width: 150,
                                      child: Card(
                                        color: Theme.of(context).accentColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        elevation: 5,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                anime.movieItems[i].posterImage,
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
                                                Icons
                                                    .sentiment_very_dissatisfied,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.5),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      anime.movieItems[i].title,
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        color: Theme.of(context).accentColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    },
                  );
                } else {
                  return Center(child: Text(dataSnapshot.error.toString()));
                }
              },
            )
          : Container(),
    );
  }
}

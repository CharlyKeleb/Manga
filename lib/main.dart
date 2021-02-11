import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manga_ui/providers/action_manga_provider.dart';
import 'package:manga_ui/providers/anime_item_provider.dart';
import 'package:manga_ui/providers/anime_items_provider.dart';
import 'package:manga_ui/providers/category_item_provider.dart';
import 'package:manga_ui/providers/popular_anime_item.dart';
import 'package:manga_ui/providers/trending_anime_provider.dart';
import 'package:manga_ui/screens/main_screen.dart';
import 'package:manga_ui/util/constants.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // will be need later
        ChangeNotifierProvider(
          create: (ctx) => AnimeItemProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => AnimeItemsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => TrendingAnimesProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => PopularAnimeProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CategoryAnimeProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ActionMangaProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constants.appName,
        theme: Constants.lightTheme,
        home: MainScreen(),
      ),
    );
  }
}

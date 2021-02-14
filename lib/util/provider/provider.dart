import 'package:manga_ui/providers/action/action_manga_provider.dart';
import 'package:manga_ui/providers/action/category_item_provider.dart';
import 'package:manga_ui/providers/adventure/adventure_anime_provider.dart';
import 'package:manga_ui/providers/adventure/adventure_manga_provider.dart';
import 'package:manga_ui/providers/items/anime_items_provider.dart';
import 'package:manga_ui/providers/items/manga_items.dart';
import 'package:manga_ui/providers/popular/popular_anime_item.dart';
import 'package:manga_ui/providers/popular/popular_manga_item.dart';
import 'package:manga_ui/providers/romance/romance_anime_provider.dart';
import 'package:manga_ui/providers/romance/romance_manga_provider.dart';
import 'package:manga_ui/providers/trending/trending_anime_provider.dart';
import 'package:manga_ui/providers/trending/trending_manga_provider.dart';
import 'package:manga_ui/util/constants.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => AnimeItemsProvider()),
  ChangeNotifierProvider(create: (_) => TrendingAnimesProvider()),
  ChangeNotifierProvider(create: (_) => PopularAnimeProvider()),
  ChangeNotifierProvider(create: (_) => CategoryAnimeProvider()),
  ChangeNotifierProvider(create: (_) => ActionMangaProvider()),
  ChangeNotifierProvider(create: (_) => RomanceMangaProvider()),
  ChangeNotifierProvider(create: (_) => RomanceAnimeProvider()),
  ChangeNotifierProvider(create: (_) => AdventureAnimeProvider()),
  ChangeNotifierProvider(create: (_) => AdventureMangaProvider()),
  ChangeNotifierProvider(create: (_) => MangaItemsProvider()),
  ChangeNotifierProvider(create: (_) => PopularMangaProvider()),
  ChangeNotifierProvider(create: (_) => TrendingMangaProvider()),
  ChangeNotifierProvider(create: (_) => ThemeNotifier()),

];

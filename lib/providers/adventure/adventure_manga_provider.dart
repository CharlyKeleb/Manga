import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:manga_ui/models/manga_items.dart';

class AdventureMangaProvider with ChangeNotifier {
  List<AnimeItem> _animeItems = List<AnimeItem>();

  List<AnimeItem> get movieItems {
    return [..._animeItems];
  }

  Future<void> fetchAndRomanceManga(
      int offset,
      [int limit = 10]) async {
    final url =
        "https://kitsu.io/api/edge/manga?filter[categories]=adventure&page[limit]=$limit&page[offset]=$offset&sort=popularityRank";
    final response = await http.get(url);
    final responseData = jsonDecode(response.body)["data"] as List<dynamic>;
    print(responseData);

    _animeItems.clear();
    responseData.forEach((animeItem) {
      _animeItems.add(AnimeItem.fromJson(animeItem));
    });
    _animeItems.forEach((animeItem) {
      print(animeItem.coverImage);
    });
    notifyListeners();
  }

  void changeSignal() {
    notifyListeners();
  }
}

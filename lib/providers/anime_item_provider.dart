import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:manga_ui/models/manga_items.dart';

class AnimeItemProvider with ChangeNotifier {
  AnimeItem _animeItem = AnimeItem();

  AnimeItem get movieItem {
    return _animeItem;
  }

  Future<void> fetchAndSetMovieItem(int id) async {
    try {
      final response = await http.get("https://kitsu.io/api/edge/anime/$id");

      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
        final responseData = jsonDecode(response.body);
        _animeItem = AnimeItem.fromJson(responseData['data']);
        notifyListeners();
      } else {
        throw Exception("Failed!");
      }
    } catch (e) {
      throw (e);
    }
  }
}

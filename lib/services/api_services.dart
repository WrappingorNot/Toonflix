import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon.dart';
import 'package:toonflix/models/webtoon_detail.dart';
import 'package:toonflix/models/webtoon_episode.dart';

class ApiServices {
  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtooninstances = [];

    final url =
        Uri.parse('https://webtoon-crawler.nomadcoders.workers.dev/today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtooninstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtooninstances;
    }
    throw Error();
  }

  static Future<WebToonDetailModel> getToonById(String id) async {
    final url =
        Uri.parse('https://webtoon-crawler.nomadcoders.workers.dev/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebToonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebToonEpisodeModel>> getLatestEpisodeById(
      String id) async {
    List<WebToonEpisodeModel> episodesInstances = [];
    final url = Uri.parse(
        'https://webtoon-crawler.nomadcoders.workers.dev/$id/episodes');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodesInstances.add(WebToonEpisodeModel.fromJson(episode));
      }
      return episodesInstances;
    }
    throw Error();
  }
}

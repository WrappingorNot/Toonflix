import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon.dart';

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
}

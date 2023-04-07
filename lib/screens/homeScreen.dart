import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon.dart';
import 'package:toonflix/services/api_services.dart';
import 'package:toonflix/widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<WebtoonModel>> webtoons = ApiServices.getTodaysToons();

  @override
  Widget build(Object context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, future) {
          if (future.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(child: makeList(future))
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(), //로딩 서클 도는것
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> future) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: future.data!.length,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        itemBuilder: (context, index) {
          var webtoon = future.data![index];
          return Webtoon(
              title: webtoon.title, thumb: webtoon.thumb, id: webtoon.id);
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
              width: 40,
            ));
  }
}

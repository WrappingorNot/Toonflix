import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //dart class
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 106, 106, 106),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30), //padding 넣는곳
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Hey, Selena',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      'Wellcome back',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.8), fontSize: 18),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 120,
            ),
            Text(
              'Total Balance',
              style:
                  TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 22),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '\$5 194 482',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                  fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Button(
                  text: 'Transfer',
                  bgColor: Color(0xFFF1B33B),
                  textColor: Colors.black,
                ),
                Button(
                  text: 'Transfer',
                  bgColor: Color(0xFF1f2123),
                  textColor: Colors.white,
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Wellets",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w600),
                ),
                Text("View All",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.8), fontSize: 18)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    color: const Color(0xFF1f2123),
                    borderRadius: BorderRadius.circular(25)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Euro',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Text('6 428',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18)),
                              const SizedBox(width: 10),
                              Text('ERU',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.8),
                                      fontSize: 20)),
                            ],
                          )
                        ],
                      ),
                      Transform.scale(
                        scale: 2.0,
                        child: Transform.translate(
                          offset: const Offset(-5, 10),
                          child: const Icon(
                            Icons.euro_rounded,
                            color: Colors.white,
                            size: 88,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ]),
        ),
      ),
    );
  }
}

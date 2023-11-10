import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:media_player/model/carousol_list.dart';
import 'package:media_player/model/video_list.dart';
import 'package:provider/provider.dart';

import '../model/music_list.dart';
import '../provider/music_provider.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ChangePlayProvider>(
        builder: (context, changePlayProvider, child) {
      return Column(
        children: [
          Container(
              width: double.infinity,
              child: CarouselSlider(
                items: CaroLinks.map((e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 400,
                        child: Stack(fit: StackFit.expand, children: [
                          Image.network(e),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(50)),
                                color: Colors.black45,
                              ),
                              height: 60,
                              width: 190,
                              child: Center(
                                child: Text("COMING SOON..",
                                    style: TextStyle(
                                      fontSize: 22,
                                    )),
                              ),
                            ),
                          )
                        ]),
                      ),
                    )).toList(),
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    autoPlayCurve: Curves.bounceIn,
                    autoPlayAnimationDuration: Duration(seconds: 3),
                    enlargeStrategy: CenterPageEnlargeStrategy.zoom),
              )),
          Expanded(
            flex: 1,
            child: Container(

              margin: EdgeInsets.all(5),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1),
                itemCount: listMusic.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        child: Center(
                          child: Image.network(
                            videoList[index].thumb,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 60,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                ),
                                color: Colors.white70),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${videoList[index].title}',
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        Text(
                                          'Sample videos',
                                          style: const TextStyle(
                                              fontSize: 8.5,
                                              color: Colors.black87),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: ActionChip.elevated(
                                        color: MaterialStatePropertyAll(
                                          Colors.primaries[Random().nextInt(
                                              Colors.primaries.length)],
                                        ),
                                        label: Row(
                                          children: [
                                            Text("Click here to Watch",
                                                style: TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  letterSpacing: 0.5,
                                                  color: Colors.white,
                                                )),
                                            Icon(Icons.play_arrow_outlined),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ))
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      );
    });
  }
}

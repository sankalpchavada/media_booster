import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:media_player/model/music_list.dart';
import 'package:media_player/views/playing_music_page.dart';
import 'package:provider/provider.dart';

import '../provider/music_provider.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  bool isTap = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<ChangePlayProvider>(
        builder: (context, changePlayProvider, child) {
      return Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.all(5),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: listMusic.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 10,
                    shadowColor: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                    child: Stack(
                      children: [
                        Container(
                          child: Center(
                            child: Image.network(
                              listMusic[index].artwork,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 35,
                              width: double.maxFinite,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                  ),
                                  color: Colors.white70),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 3),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${listMusic[index].title}',
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        Text(
                                          '${listMusic[index].artist}',
                                          style: const TextStyle(
                                              fontSize: 8,
                                              color: Colors.black87),
                                        )
                                      ],
                                    ),
                                    Center(
                                      child: IconButton(
                                        icon: Icon(
                                          size: 25,
                                          changePlayProvider.isPlaying
                                              ? CupertinoIcons.play_arrow_solid
                                              : Icons.pause,
                                          color: Colors.black87,
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    PlayMusicPage(
                                                        argIndex: index),
                                              ));
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                      ],
                    ),
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

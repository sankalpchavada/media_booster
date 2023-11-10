import 'package:flutter/material.dart';
import 'package:media_player/model/models.dart';
import 'package:media_player/model/music_list.dart';

class PlayMusicPage extends StatefulWidget {
  PlayMusicPage({super.key, required argIndex});

  @override
  State<PlayMusicPage> createState() => _PlayMusicPageState();
}

class _PlayMusicPageState extends State<PlayMusicPage> {
  @override
  Widget build(BuildContext context) {
    MusicModel args = listMusic[argIndex];
    print(argIndex);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Now playing"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network("${args.artwork}"),
          ],
        ),
      ),
    );
  }
}

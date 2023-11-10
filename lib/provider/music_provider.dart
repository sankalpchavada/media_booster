import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:media_player/model/music_list.dart';

class ChangePlayProvider with ChangeNotifier {
  bool _isPlaying = false;
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  bool get isPlaying => _isPlaying;

  Future<void> loadSong() async {
    await assetsAudioPlayer.open(Audio.network("$listMusic[0]['url']"));
    notifyListeners();
  }

  void ChangeIconFunc() {
    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  Future<void> PlayMusic() async {
    await assetsAudioPlayer.play();
    notifyListeners();
  }
}

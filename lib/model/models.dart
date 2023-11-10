class Model {
  String title;
  String sources;
  String thumb;

  Model({
    required this.title,
    required this.sources,
    required this.thumb,
  });
}

late int argIndex;

class MusicModel {
  String title;
  String artist;
  String artwork;
  String url;
  String? id;

  MusicModel({
    required this.title,
    required this.artist,
    required this.artwork,
    required this.url,
    this.id,
  });
}

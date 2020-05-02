import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:favoritosdoyoutubs/app/models/video.dart';

class Videos_bloc implements BlocBase {
  List<Video> videos;

  final StreamController _videosController = StreamController();
  Stream get outVideos => _videosController.stream;

  @override
  void dispose() {
    _videosController.close();
  }
}

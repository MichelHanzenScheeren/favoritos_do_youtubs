import 'dart:convert';

import 'package:favoritosdoyoutubs/app/models/suggestion.dart';
import 'package:favoritosdoyoutubs/app/models/video.dart';
import 'package:http/http.dart' as http;
import 'package:favoritosdoyoutubs/app/api.dart';

class YoutubeApi {

  Future<List<Video>> search(String search) async {
    http.Response response = await http.get(
        "https://www.googleapis.com/youtube/v3/search?part=snippet&" +
            "q=$search&type=video&key=$API_KEY&maxResults=10");

    var decoded = decode(response);
    return getVideos(decoded);
  }

  dynamic decode(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed Operation");
    }
  }

  List<Video> getVideos(dynamic decoded) {
    return decoded["items"].map<Video>((item) {
      return Video.fromJson(item);
    }).toList();
  }

  Future<List<Suggestion>> suggestions(String partialSearch) async {
    http.Response response = await http.get(
        "http://suggestqueries.google.com/complete/search?hl=en" +
            "&ds=yt&client=youtube&hjson=t&cp=1&q=$partialSearch&format=5&alt=json");

    var decoded = decode(response);
    return getSuggestions(decoded);
  }

  List<Suggestion> getSuggestions(dynamic decoded) {
    return decoded[1].map<Suggestion>((item) {
      return Suggestion.fromJson(item);
    }).toList();
  }
}

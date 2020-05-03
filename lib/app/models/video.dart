class Video {
  String id;
  String title;
  String thumb;
  String channel;

  Video.fromJson(Map<String, dynamic> json) {
    try{
      id = json["id"]["videoId"];
    } catch (_) {
      id = json["id"];
    }

    title = json["snippet"]["title"];
    thumb = json["snippet"]["thumbnails"]["high"]["url"];
    channel = json["snippet"]["channelTitle"];
  }
}

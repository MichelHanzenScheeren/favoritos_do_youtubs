class Video {
  String id;
  String title;
  String thumb;
  String channel;

  Video.fromJson(Map<String, dynamic> json) {
    id = json["id"]["videoId"];
    title = json["snippet"]["title"];
    thumb = json["snippet"]["thumbnails"]["high"]["url"];
    channel = json["snippet"]["channelTitle"];
  }
}

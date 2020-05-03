import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:favoritosdoyoutubs/app/blocs/videosBloc.dart';
import 'package:favoritosdoyoutubs/app/delegates/dataSearch.dart';
import 'package:favoritosdoyoutubs/app/models/video.dart';
import 'package:favoritosdoyoutubs/app/pages/homePage/videoTile.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        elevation: 0,
        title: Container(
          height: 25,
          child: GestureDetector(
            child: Image.asset("images/youtube_logo.png", fit: BoxFit.cover),
            onTap: () {
              BlocProvider.of<VideosBloc>(context).inSearch.add(null);
            },
          ),
        ),
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              "0",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          IconButton(icon: Icon(Icons.star), onPressed: () {}),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => openDataSearch(context),
          ),
        ],
      ),
      backgroundColor: Colors.black54,
      body: StreamBuilder<List<Video>>(
        stream: BlocProvider.of<VideosBloc>(context).outVideos,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount:
                    snapshot.data.length > 1 ? snapshot.data.length + 1 : 0,
                itemBuilder: (context, index) {
                  if (index < snapshot.data.length) {
                    return VideoTile(snapshot.data[index]);
                  } else {
                    BlocProvider.of<VideosBloc>(context).inSearch.add("");
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                });
          }
        },
      ),
    );
  }

  void openDataSearch(BuildContext context) async {
    String result = await showSearch(context: context, delegate: DataSearch());
    BlocProvider.of<VideosBloc>(context).inSearch.add(result);
  }
}

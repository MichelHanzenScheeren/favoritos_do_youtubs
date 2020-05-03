import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:favoritosdoyoutubs/app/blocs/favoritesBloc.dart';
import 'package:favoritosdoyoutubs/app/models/video.dart';
import 'package:flutter/material.dart';

class FavoritesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favBloc = BlocProvider.of<FavoritesBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          "Favoritos",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black54,
      body: StreamBuilder<List<Video>>(
        stream: favBloc.outFavorites,
        builder: (context, snapshot) {
          if(!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
              children: snapshot.data.map((item) {
                return InkWell(
                  child: Container(),
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}

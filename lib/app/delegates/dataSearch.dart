import 'package:favoritosdoyoutubs/app/controllers/youtubeController.dart';
import 'package:favoritosdoyoutubs/app/models/suggestion.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {},
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) return Container();
    return FutureBuilder<List<Suggestion>>(
      future: YoutubeController.instance.suggestions(query),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: ListView(
            children: snapshot.data.map((suggestion) {
              return ListTile(
                title: Text(suggestion.text),
                onTap: () {
                  query = suggestion.text;
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

import 'package:favoritosdoyoutubs/app/pages/homePage/home.dart';
import 'package:flutter/material.dart';

class CreateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Favoritoss do Youtube',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

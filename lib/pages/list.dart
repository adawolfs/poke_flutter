import 'package:flutter/material.dart';
import '../components/poke_item.dart';

class PokeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'PokeList',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new PokeList(),
    );
  }
}

class PokeList extends StatelessWidget {
  final List<int> pokes = new List<int>.generate(150, (int index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20.0),
        crossAxisCount: 2,
        children: pokes.map((pokedata) {
          return PokeItem(pokedata);
        }).toList());
  }
}

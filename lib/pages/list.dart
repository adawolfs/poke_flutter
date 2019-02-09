import 'package:flutter/material.dart';
import 'package:poke_flutter/pages/entry.dart';
import 'package:poke_flutter/components/app_bar.dart';
import 'package:poke_flutter/components/poke_item.dart';
import 'package:poke_flutter/theme.dart';

class PokeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'PokeList',
      theme: pokedexTheme,
      home: Scaffold(
        appBar: PokedexAppBar(),
        body: PokeList(),
        //body: PokeEntry(1),
      ),
    );
  }
}

class PokeList extends StatelessWidget {
  final List<int> pokes = new List<int>.generate(150, (int index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        primary: false,
        //padding: const EdgeInsets.all(20.0),
        //crossAxisSpacing: 50.0,
        crossAxisCount: 2,
        children: pokes.map((pokedata) {
          return PokeItem(pokedata);
        }).toList());
  }
}

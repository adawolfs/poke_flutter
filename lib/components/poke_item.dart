import 'package:flutter/material.dart';
import 'dart:convert';
import '../api/main.dart';

class PokeItem extends StatefulWidget {
  int number = 0;

  PokeItem(int number) {
    this.number = number;
    print(number);
  }

  @override
  State<StatefulWidget> createState() {
    return _PokeItem(number);
  }
}

class _PokeItem extends State<PokeItem> {
  Map<String, dynamic> pokemon = Map<String, dynamic>();

  _PokeItem(int number) {
    getPokeData(number);
  }

  getPokeData(number) {
    api.getPokemon(number).then((response) {
      var body = jsonDecode(response.body);
      if (this.mounted) {
        setState(() {
          pokemon = body;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (pokemon.length > 0) {
      return Text(pokemon['name']);
    } else {
      return Text('loading');
    }
  }
}

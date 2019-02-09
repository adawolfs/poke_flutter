import 'package:flutter/material.dart';
import 'package:poke_flutter/api/main.dart';
import 'package:poke_flutter/components/entry/description.dart';
import 'package:poke_flutter/components/entry/poke_image.dart';
import 'package:poke_flutter/podos/pokemon.dart';

class PokeEntry extends StatefulWidget {
  final int number;

  PokeEntry(this.number);

  @override
  State<StatefulWidget> createState() {
    return _PokeEntry(number);
  }
}

class _PokeEntry extends State<PokeEntry> {
  final int number;
  Pokemon pokemon;

  _PokeEntry(this.number) {
    Api.getPokemon(number).then((pokemon) {
      if (this.mounted) {
        print(pokemon.name);
        setState(() {
          this.pokemon = pokemon;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        children: <Widget>[
          Container(
            height: 30.0,
          ),
          PokeImage(pokemon),
          PokeDescription(pokemon),
        ],
      ),
    );
  }
}

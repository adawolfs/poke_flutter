import 'package:flutter/material.dart';
import 'package:poke_flutter/podos/pokemon.dart';
import 'package:poke_flutter/helpers/pokedata.dart';

class PokeDescription extends StatelessWidget {
  final Pokemon pokemon;
  PokeDescription(this.pokemon);

  @override
  Widget build(BuildContext context) {
    if (pokemon == null) return Container();
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 30.0),
          width: 300.0,
          height: 60.0,
          decoration: new BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Center(
            child: Text(
              pokemon.name,
              style: Theme.of(context).textTheme.button,
            ),
          ),
        ),
        PokeTypes(pokemon),
      ],
    );
  }
}

class PokeTypes extends StatelessWidget {
  final Pokemon pokemon;
  PokeTypes(this.pokemon);

  Widget _types(BuildContext context, String type) {
    return Container(
      margin: EdgeInsets.only(
        top: 20.0,
        left: 5.0,
        right: 5.0,
      ),
      width: 100.0,
      height: 50.0,
      decoration: new BoxDecoration(
        color: pokeType[type],
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Center(
        child: Text(
          type,
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: pokemon.types.map((t) => _types(context, t)).toList(),
        ),
      ),
    );
  }
}

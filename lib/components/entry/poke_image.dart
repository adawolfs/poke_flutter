import 'package:flutter/material.dart';
import 'package:poke_flutter/podos/pokemon.dart';

class PokeImage extends StatelessWidget {
  Pokemon pokemon;
  PokeImage(this.pokemon);

  Widget _getImage() {
    if (pokemon == null) return Container();
    return Container(
      constraints: BoxConstraints(maxHeight: 130.0, maxWidth: 130.0),
      child: Image.network(
        'http://www.pokestadium.com/sprites/xy/${pokemon.name.toLowerCase()}.gif',
        Text(pokemon.name),
        width: 100.0,
        fit: BoxFit.fill,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.only(
        right: 20.0,
        left: 20.0,
      ),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Container(
        // constraints: BoxConstraints.expand(),
        height: 160.0,
        decoration: new BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Center(
          child: _getImage(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:poke_flutter/api/main.dart';
import 'package:poke_flutter/helpers/text.dart';
import 'package:poke_flutter/podos/pokemon.dart';

class PokeItem extends StatefulWidget {
  final int number;

  PokeItem(this.number);

  @override
  State<StatefulWidget> createState() {
    return _PokeItem(number);
  }
}

class _PokeItem extends State<PokeItem> {
  Pokemon pokemon;
  Color backgroundColor;
  bool pressAttention = false;

  _PokeItem(int number) {
    getPokeData(number);
  }

  getPokeData(number) {
    Api.getPokemon_(number).then((pokemon) {
      if (this.mounted) {
        print(pokemon.name);
        setState(() {
          this.pokemon = pokemon;
        });
      }
    });
  }

  Image loading() {
    return Image.asset(
      'assets/images/pokeball.png',
      width: 100.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      elevation: 0,
      color: Theme.of(context).primaryColor,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(5.0),
            child: pokemon != null
                ? Image.network(
                    'http://www.pokestadium.com/sprites/xy/${pokemon.name.toLowerCase()}.gif',
                    //pokemon.image,
                    Text(pokemon.name),
                    height: 120.0,
                    fit: BoxFit.fill,
                  )
                : loading(),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            padding: EdgeInsets.only(
              bottom: 5.0,
              top: 5.0,
              left: 10.0,
              right: 10.0,
            ),
            decoration: new BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(100.0)),
            ),
            child: Text(
              capitalize(pokemon != null ? pokemon.name : 'loading'),
              style: Theme.of(context).textTheme.button,
            ),
          )
        ],
      ),
      onPressed: () {},
    );
  }
}

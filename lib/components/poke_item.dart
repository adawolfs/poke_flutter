import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:poke_flutter/api/main.dart';
import 'package:poke_flutter/helpers/text.dart';

class PokeItem extends StatefulWidget {
  final int number;

  PokeItem(this.number);

  @override
  State<StatefulWidget> createState() {
    return _PokeItem(number);
  }
}

class _PokeItem extends State<PokeItem> {
  Map<String, dynamic> pokemon = Map<String, dynamic>();
  Color backgroundColor;
  bool pressAttention = false;

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
            child: pokemon.length > 0
                ? Image.network(
                    pokemon['sprites']['front_default'],
                    Text(pokemon['name']),
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
              capitalize(pokemon.length > 0 ? pokemon['name'] : 'loading'),
              style: Theme.of(context).textTheme.button,
            ),
          )
        ],
      ),
      onPressed: () {},
    );
  }
}

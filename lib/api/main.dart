import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'package:poke_flutter/podos/pokemon.dart';

var url = 'https://pokeapi.glitch.me/pokemon/';
var url_ = 'https://pokeapi.co/api/v2/pokemon/';
//var url 'https://pokeapi.co/api/v2/pokemon?limit=151'

class Api {
  static Future<Pokemon> getPokemon(int number) {
    return http.get(url + number.toString()).then((response) {
      var data = jsonDecode(response.body)[0];
      return new Future.value(
          Pokemon(data['name'], data['sprite'], data['types']));
    });
  }

  static Future<Pokemon> getPokemon_(int number) {
    return http.get(url_ + number.toString()).then((response) {
      var data = jsonDecode(response.body);
      return new Future.value(
          Pokemon.simple(data['name'], data['sprites']['front_default']));
    });
  }
}

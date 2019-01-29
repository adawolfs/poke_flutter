import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

var url = 'https://pokeapi.co/api/v2/pokemon/';

class api {
  static Future<Response> getPokemon(int number) {
    return http.get(url + number.toString());
  }
}

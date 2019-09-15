import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> getGameList() async {
  final endPoint = 'http://45.32.135.38:8080/dfs/game/list';
  final response = await http.get(
    endPoint,
  );
  print(response.body);
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Login failed');
  }
}
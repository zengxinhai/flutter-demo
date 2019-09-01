import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<dynamic> login(email, password) async {
  final endPoint = 'https://f1.yorecard.com/api/auth/token/get';
  final headers = {
    HttpHeaders.contentTypeHeader: ContentType.json.toString(),
  };
  final body = json.encode({
    'email': email,
    'password': password
  });
  final response = await http.post(
    endPoint,
    headers: headers,
    body: body
  );
  print(response.body);
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Login failed');
  }
}
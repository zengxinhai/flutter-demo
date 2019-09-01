import 'package:flutter/material.dart';
import './lena_anderson.dart';

void main() {
  runApp(MaterialApp(
    title: 'Named Routes Demo',
    initialRoute: '/',
    routes: {
      '/': (context) => ContactScreen(),
    },
  ));
}

import 'package:flutter/material.dart';
import './tab_view.dart';

void main() {
  runApp(MaterialApp(
    title: 'Named Routes Demo',
    initialRoute: '/',
    routes: {
      '/': (context) => TabView(),
    },
  ));
}

import 'package:flutter/material.dart';
import './game_list.dart';
import './my.dart';

class TabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: 'DFS',),
                Tab(text: 'My'),
              ],
            ),
            title: Text('Fantoshi'),
          ),
          body: TabBarView(
            children: [
              GameList(),
              MyScreen()
            ],
          ),
        ),
      ),
    );
  }
}

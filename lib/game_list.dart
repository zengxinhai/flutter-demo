import 'package:flutter/material.dart';
import './game_service.dart';

class GameListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fantoshi'),
      ),
      body: Center(
        child: GameList()
      )
    );
  }
}

class GameList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getGameList(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        switch (snapshot.connectionState) {
        case ConnectionState.none:
          return Text('Press button to start.');
        case ConnectionState.active:
        case ConnectionState.waiting:
          return Text('Awaiting result...');
        case ConnectionState.done: {
          if (snapshot.hasError)
            return Text('Error: ${snapshot.error}');
          final gameList = snapshot.data['data']['list'];
          return ListView.builder(
            itemCount: gameList.length,
            itemBuilder: (context, index) {
              return createGameListItem(
                gameList[index]['home_name'],
                gameList[index]['home_icon'],
                gameList[index]['guest_name'],
                gameList[index]['guest_icon'],
                gameList[index]['start_at'],
              );
            },
          );
        }
        }
      }
    );
  }
}

Widget createGameListItem(String player1, String icon1, String player2, String icon2, String time) {
  return Container(
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: <BoxShadow>[
        BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 1, offset: Offset(0, 3))
      ]
    ),
    child: Column(
      children: <Widget>[
        createTimeBar(time),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: createGameVsContent(player1, icon1, player2, icon2)
        ),
        Padding(
          padding: EdgeInsets.only(top: 6),
          child: createGameStatusBar(100, 'Satoshi')
        )
      ]
    )
  );
}

Widget createTimeBar(String time) {
  return Container(
    decoration: BoxDecoration(
      color: Color.fromARGB(50, 150, 137, 140),
    ),
    padding: EdgeInsets.symmetric(vertical: 10),
    alignment: Alignment.center,
    height: 40,
    child: Text(time),
  );
}

Widget createGameVsContent(String player1, String icon1, String player2, String icon2) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      createGamePlayerDisplay(player1, icon1),
      Text('VS'),
      createGamePlayerDisplay(player2, icon2),
    ],
  );
}

Widget createGamePlayerDisplay(String playerName, String playerImgUrl) {
  return SizedBox(
    width: 180,
    child: Column(
      children: <Widget>[
        Text(playerName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Image.network(playerImgUrl, width: 60, height: 60),
      ]
    ),
  );
}

Widget createGameStatusBar(int totalAmount, String winner) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Text('Total Prize:' + totalAmount.toString() + ' ETH'),
      FlatButton(
        child: Text('Join'),
        textColor: Colors.blueAccent,
        onPressed: () => {},
      ),
      Text('Winner: ' + winner)
    ]
  );
}

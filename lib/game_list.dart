import 'package:flutter/material.dart';

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
    final playerALogo = 'https://images.cdn2.stockunlimited.net/preview1300/football-club-logo_1527032.jpg';
    final playerBLogo = 'https://kassiesa.net/uefa/clubs/images/Alki-Larnaca.png';
    final playerCLogo = 'https://upload.wikimedia.org/wikipedia/commons/f/f5/Yebo_Yes_United_Football_Club_Logo.jpg';
    final playerDLogo = 'https://www.pngfind.com/pngs/m/105-1051844_wembley-football-club-wembley-fc-logo-hd-png.png';
    final playerELogo = 'https://www.pinclipart.com/picdir/middle/357-3577659_rangers-logo-png-rangers-football-club-logo-clipart.png';
    final playerFLogo = 'http://whitleybayfc.com/wp-content/uploads/2017/03/logo1.png';
    final playerGLogo = 'https://www.pngkey.com/png/detail/161-1617054_carnegie-kings-american-football-club-kings-football-logo.png';

    return ListView(
      children: <Widget>[
        createGameListItem('Arsenal', playerALogo, 'Chelsea', playerBLogo, 'Yesterday, 2019.09.06'),
        createGameListItem('Chelsea', playerBLogo, 'Liverpool', playerCLogo, 'Today, 2019.09.07'),
        createGameListItem('Manchester United', playerDLogo, 'Newcastle United', playerELogo, 'Tomorrow, 2019.09.08'),
        createGameListItem('Leicester City', playerFLogo, 'Watford', playerGLogo, 'Tomorrow, 2019.09.08')
      ]
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
    width: 160,
    child: Column(
      children: <Widget>[
        Text(playerName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Image.network(playerImgUrl, width: 80, height: 80),
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

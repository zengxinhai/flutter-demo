import 'package:flutter/material.dart';

class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        createWalletInfo(),
        WalletButtons(),
        Divider(),
        SizedBox(height: 10),
        BetHistory(),
        SizedBox(height: 10),
        createHistoryItem('Real Madrid vs Barcelona', '0.1 ETH', 'Not Played'),
        Divider(),
        createHistoryItem('AAA vc BBB', '0.2ETH', 'You win!'),
        Divider(),
        createHistoryItem('CCC vs DDD', '1.0ETH', 'Finshed'),
        Divider(),
      ]
    );
  }
}

class BetHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(child: Text('History', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
        SizedBox(height: 20),
        Container(
          color: Color.fromARGB(50, 150, 137, 140),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Flexible(
                flex: 3,
                child: Text('Game'),
                fit: FlexFit.tight,
              ),
              Flexible(
                flex: 1,
                child: Text('Wager'),
                fit: FlexFit.tight,
              ),
              Flexible(
                flex: 1,
                child: Text('Status'),
                fit: FlexFit.tight,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget createHistoryItem(String game, String wager, String status) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Flexible(
          flex: 3,
          child: Text(game, style: TextStyle(fontWeight: FontWeight.bold)),
          fit: FlexFit.tight,
        ),
        Flexible(
          flex: 1,
          child: Text(wager, style: TextStyle(fontWeight: FontWeight.bold)),
          fit: FlexFit.tight,
        ),
        Flexible(
          flex: 1,
          child: Text(status),
          fit: FlexFit.tight,
        ),
      ],
    )
  );
}

Widget createWalletInfo() {
  return Padding(
    padding: EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Balance', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        Text('1.2333ETH', style: TextStyle(fontSize: 20)),
        SizedBox(height: 20),
        Text('Address', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        Text('0x0314ffeba13b5c415a84aaadc524d88250bab643', style: TextStyle(fontSize: 14)),
      ]
    )
  );
}

class WalletButtons extends StatelessWidget {
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          color: Color(0xff03a9fc),
          textColor: Colors.white,
          child: Text('Top up'),
          onPressed: () {},
        ),
        SizedBox(width: 20),
        OutlineButton(
          child: Text('Cash out'),
          onPressed: () {},
        )
      ],
    );
  }
}


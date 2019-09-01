import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Splash Screen'),
      ),
      body: Center(
        child: 
        Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(30)),
            Image.asset('assets/card-img-shadow.png', width: 360),
            RaisedButton(
              color: Colors.blueAccent,
              child: Text('Launch', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.pushNamed(context, '/user-card');
              },
            ),
            Spacer(
              flex: 1,
            ),
            Text(
              'Karbon App',
              style: TextStyle(
                color: Colors.grey
              ),
            )
          ],
        ),
      ),
    );
  }
}
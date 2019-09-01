import 'package:flutter/material.dart';

final _contactName = 'Lena Anderson (Blaire Ivory)';
final _group = 'Porn Star';

class ContactScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contact'),
        ),
        body: ListView(
          children: <Widget>[
            _heroAvatar,
            _titleSection,
            _buttonSection,
            Divider(),
            _textSection,
          ],
        )
      )
    );
  }
}

Widget _heroAvatar =  Image.asset(
  'assets/0.jpeg',
);

class FavoriteWiget extends StatefulWidget {
  @override
  FavoriteWidgetState createState() {
    return FavoriteWidgetState();
  }
}

class FavoriteWidgetState extends State<FavoriteWiget> {
  var _likes = 41;
  var _isLiked = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(_isLiked ? Icons.star : Icons.star_border, color: Colors.red[500],),
          onPressed: _toggleFavorite,
        ),
        SizedBox(width: 8),
        Text(_likes.toString()),
      ]
    );
  }
  void _toggleFavorite() {
    setState(() {
      _isLiked = !_isLiked;
      if (_isLiked) { _likes++; } else { _likes--; }
    });
  }
}

Widget _titleSection = Container(
  padding: EdgeInsets.all(32),
  child: Row(
    children: <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(_contactName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            SizedBox(height: 8),
            Text(_group, style: TextStyle(color: Colors.grey[500])),
          ]
        ),
      ),
      FavoriteWiget(),
    ],
  )
);

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    children: <Widget>[
      Icon(icon, color: color),
      SizedBox(height: 8),
      Text(label, style: TextStyle(color: color)),
    ],
  );
}

Widget _buttonSection = Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: <Widget>[
    _buildButtonColumn(Colors.blueAccent, Icons.call, 'CALL'),
    _buildButtonColumn(Colors.blueAccent, Icons.message, 'MESSAGE'),
    _buildButtonColumn(Colors.blueAccent, Icons.email, 'EMAIL')
  ],
);

final _introText = 
  'Blaire Ivory aka Lena Anderson was born on January 28, 1998 in Dallas, Texas.'
  'She is perhaps one of the youngest porn stars among the newcomers. '
  'Extremely tall Blaire (she is 183cm) joined the adult entertainment '
  'industry in 2016 when she was only eighteen years old. '
  'The baby faced porn star with blonde hair, immediately gained attention from porn...';


Widget _textSection = Container(
  padding: EdgeInsets.all(32),
  child: Center(
    child: Text(_introText, style: TextStyle(height: 1.5)),
  ),
);
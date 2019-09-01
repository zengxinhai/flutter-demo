import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './login_service.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Karbon',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: LoginForm(title: 'Karbon Login'),
    );
  }
}

class LoginForm extends StatefulWidget {
  LoginForm({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String inputEmail = '';
  String inputPassword = '';

  void _setEmail(email) {
    setState(() {
      inputEmail = email;
    });
  }

  void _setPassword(password) {
    setState(() {
      inputPassword = password;
    });
  }

  void _login() async {
    final response = await login(inputEmail, inputPassword);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('accessToken', response['access']);
    preferences.setString('refreshToken', response['refreshToken']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(top: 20, left: 10, right: 10),
          children: <Widget>[
            ListTile(
              subtitle: TextField(
                onChanged: (text) {
                  _setEmail(text);
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.mail),
                  hintText: 'Email',
                ),
                
              ),
            ),
            ListTile (
              subtitle: TextField(
                onChanged: (text) {
                  _setPassword(text);
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.security),
                  hintText: 'Password',
                ),
                obscureText: true,
              ),
            ),
            FlatButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Login App',
      home: Scaffold(
        appBar: AppBar(title: Text('My App Bar'),),
        body: LoginScreen(),
      ),
    );
  }
}
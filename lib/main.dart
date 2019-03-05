import 'package:flutter/material.dart';
import 'package:manhang/screens/login.dart';

void main() => runApp(MainPage());
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LoginPage()
      ),
    );
  }
}

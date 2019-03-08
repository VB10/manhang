import 'package:flutter/material.dart';
import 'package:manhang/model/BaseEnum.dart';
import 'package:manhang/screens/game.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key key,
  }) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: TAG.game.toString(),
                child: Image.asset(
                  "assets/images/stckmn.png",
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Welcome ManHang",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    color: Colors.black),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: FloatingActionButton(
            onPressed: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return GameScreen();
                  }))
                },
            child: Icon(Icons.arrow_forward_ios),
          ),
        ));
  }
}

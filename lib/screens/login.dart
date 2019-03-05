import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Widget child;

  LoginPage({Key key, this.child}) : super(key: key);

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
              Image.asset(
                "assets/images/stckmn.png",
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
            onPressed: () => {},
            child: Icon(Icons.arrow_forward_ios),
          ),
        ));
  }
}

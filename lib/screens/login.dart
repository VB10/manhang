import 'package:flutter/material.dart';
import 'package:manhang/model/BaseEnum.dart';
import 'package:manhang/screens/game.dart';

class LoginPage extends StatelessWidget {
  //Fab Button press and route hero animaton game page.
  onPress(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return GamePage();
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: TAG.game.toString(),
            child: Image.asset(
              "assets/gif/stck.gif",
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: FloatingActionButton(
              onPressed: () => this.onPress(context),
              child: Icon(Icons.arrow_forward_ios),
            ),
          )
        ],
      ),
    );
  }
}

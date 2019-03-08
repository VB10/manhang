import 'package:flutter/material.dart';
import 'package:manhang/model/BaseEnum.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Hero(
          tag: TAG.game.toString(),
          child: FlatButton(
            onPressed: () => {Navigator.pop(context)},
            child: Text("welcome back"),
          ),
        ));
  }
}

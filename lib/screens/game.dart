import 'package:flutter/material.dart';
import 'package:manhang/model/BaseEnum.dart';

class GamePage extends StatefulWidget {
  GamePage({
    Key key,
  }) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final String word = "test";
  List<String> list = ['one', 'two', 'three', 'four'];

  Widget getTextWidgets(String strings) {
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < word.length; i++) {
      var tem = strings[i];
      list.add(new Text('($tem.) _',
          style: TextStyle(fontSize: 20, color: Colors.white)));
    }
    return new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: list);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(color: Colors.red),
          ),
          Expanded(
            flex: 1,
            child: Container(
                alignment: Alignment.bottomCenter,
                color: Colors.blue,
                child: SafeArea(child: getTextWidgets(word))
                // Text(
                //   this.word,
                //   style: Theme.of(context).textTheme.title,
                //   softWrap: true,
                //   overflow: TextOverflow.ellipsis,
                // ),
                ),
          ),
        ],
      ),
    );
  }
}

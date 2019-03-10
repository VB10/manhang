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
  final _tfController = new TextEditingController();

  String questionWord = "";
  final String word = "test";
  List<String> _listWord = new List<String>();

  getQuestionString() {
    word.split("").forEach((f) => {_listWord.add("_")});

    var k = _listWord.map((data) => "$data ");
    var m = k.join("");

    print(m);
    setState(() {
      questionWord = m;
    });
  }

  pigLatin(String words) => words.replaceAllMapped(
      new RegExp(r'([A-Z])', caseSensitive: false), (Match m) => "_ ");
  //"${m[0]}_ ");

  testLatin(String words, String word) => words.replaceAllMapped(
      new RegExp(r'\b' + word, caseSensitive: false), (Match m) => "${m[0]} ");
  @override
  void initState() {
    super.initState();
    getQuestionString();
  }

  void onPressOfButton() {
    var x = word.indexOf(_tfController.text);
    print(x);
    if (x >= 0) {
      //end game.
      if (!questionWord.contains("_")) {
        showDialog(
            context: this.context,
            builder: (BuildContext context) => new AlertDialog(
                    content: new Text(
                  "End Game :)",
                  style: new TextStyle(fontSize: 30.0),
                )));
        return;
      }
      convertList();
      // var y = questionWord.trim().split(" ");

      // if (!y[x].contains("_")) return;

      // y[x] = _tfController.text;
      // var k = y.map((data) => "$data ");
      // var m = k.join("");
      // // print(y.reduce((value, element) => '$value  $element'));
      // // print(y.map((data) => "$data "));
      // setState(() {
      //   questionWord = m;
      // });
      // print(questionWord);
    } else {}

    // List<String> _x = x.split(" ");

    // String y = '${_x[0]} ' + pigLatin(_x[1]);

    // setState(() {
    //   questionWord = y;
    // });
    // print(y);
  }

  void convertList() {
    for (var i = 0; i < _listWord.length; i++) {
      if (word[i] == _tfController.text) {
        _listWord[i] = _tfController.text;
      }
    }
    var k = _listWord.map((data) => "$data ");
    var m = k.join("");

    print(m);
    setState(() {
      questionWord = m;
    });

    _tfController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                  color: Colors.black,
                  child: SafeArea(
                      child: Column(
                    children: <Widget>[
                      new Text(
                        questionWord,
                        style: Theme.of(context).textTheme.title,
                        softWrap: true,
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                        alignment: Alignment.center,
                        child: TextField(
                          controller: _tfController,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                        ),
                      ),
                      RaisedButton(
                        child: new Text("Update"),
                        onPressed: onPressOfButton,
                      ),
                    ],
                  ))),
            ),
          ],
        ),
      ),
    );
  }
}

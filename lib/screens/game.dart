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
  int wrongAnswer = 1;
  List<String> _listWord = new List<String>();
  List<String> _errorList = ["1", "2", "3", "4", "5"];
  HumanModel model = new HumanModel();

  pigLatin(String words) => words.replaceAllMapped(
      new RegExp(r'([A-Z])', caseSensitive: false), (Match m) => "_ ");

  @override
  void initState() {
    super.initState();
    setState(() {
      questionWord = pigLatin(word);
      _listWord = questionWord.trim().split(" ");
    });
  }

  void onPressOfButton() {
    int searchIndex = word.indexOf(_tfController.text);

    if (searchIndex >= 0) {
      //end game.
      if (!questionWord.contains("_")) {
        endGame(true);
      } else {
        if (questionWord.contains(_tfController.text)) {
          return;
        } else {
          convertList();
        }
      }
    } else {
      _tfController.text = "";
      setState(() {
        wrongAnswer++;
      });
      if (wrongAnswer == _errorList.length) {
        endGame(false);
      }
      return;
    }
  }

  void endGame(bool result) {
    showDialog(
        context: this.context,
        builder: (BuildContext context) => new AlertDialog(
              content: Image.asset(
                "assets/gif/${result ? "tenor" : "fail"}.gif",
              ),
              backgroundColor: Colors.transparent,
            )).whenComplete(() => {Navigator.pop(context, true)});
    return;
  }

  void convertList() {
    for (var i = 0; i < _listWord.length; i++) {
      if (word[i] == _tfController.text) {
        _listWord[i] = _tfController.text;
      }
    }
    var _newList = _listWord.map((data) => "$data ");
    String _questionWord = _newList.join("");

    setState(() {
      questionWord = _questionWord;
    });
    _tfController.text = "";
    if (!questionWord.contains("_")) {
      endGame(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.red,
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/images/$wrongAnswer.png'),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  alignment: Alignment.bottomCenter,
                  color: Colors.black,
                  child: SafeArea(
                      child: Column(
                    children: <Widget>[
                      Text(
                        questionWord,
                        style: Theme.of(context).textTheme.title,
                        softWrap: false,
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

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:manhang/model/Question.dart';
import '../model/BaseEnum.dart';

class GamePage extends StatefulWidget {
  GamePage({
    Key key,
  }) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final _textEC = new TextEditingController();
  final String word = "";

  String questionWord = "";
  String questionDescription = "";

  int wrongAnswer = 1;
  final int totalRights = 5;

  bool _isValid = true;

  List<String> _listWord = new List<String>();

  pigLatin(String words) => words.replaceAllMapped(
      new RegExp(r'([A-Z])', caseSensitive: false), (Match m) => "_ ");

  @override
  void initState() {
    super.initState();
    final int _randomNumber = new Random().nextInt(LANGUAGE.values.length - 1);
    Question _question = new Question();
    final LANGUAGE randomLanguage = LANGUAGE.values[_randomNumber];
    setState(() {
      questionWord = pigLatin(randomLanguage.toString().split(".").last);

      questionDescription = _question.languageWords[randomLanguage];
      _listWord = questionWord.trim().split(" ");
    });
  }

  void onPressOfButton() {
    setState(() {
      _isValid = _textEC.text.isEmpty ? true : false;
    });
    if (!_isValid) {
      return;
    }

    int searchIndex = word.indexOf(_textEC.text);

    if (searchIndex >= 0) {
      //end game.
      if (!questionWord.contains("_")) {
        endGame(true);
      } else {
        if (questionWord.contains(_textEC.text)) {
          return;
        } else {
          convertList();
        }
      }
    } else {
      _textEC.text = "";
      setState(() {
        wrongAnswer++;
      });
      if (wrongAnswer == totalRights) {
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
      if (word[i] == _textEC.text) {
        _listWord[i] = _textEC.text;
      }
    }
    var _newList = _listWord.map((data) => "$data ");
    String _questionWord = _newList.join("");

    setState(() {
      questionWord = _questionWord;
    });
    _textEC.text = "";
    if (!questionWord.contains("_")) {
      endGame(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Color.fromRGBO(255, 46, 99, 1),
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/images/$wrongAnswer.png'),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
                alignment: Alignment.bottomCenter,
                color: Color.fromRGBO(34, 40, 49, 1),
                child: SafeArea(
                    child: Column(
                  children: <Widget>[
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.help,
                          color: Color.fromRGBO(234, 234, 234, 1),
                          size: 45,
                        ),
                        Text(
                          questionDescription.toUpperCase(),
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(255, 46, 99, 1)),
                        )
                      ],
                    ),
                    Text(
                      questionWord,
                      style: Theme.of(context).textTheme.title,
                      softWrap: false,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: TextField(
                        controller: _textEC,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        
                        decoration: InputDecoration(
                            icon: Icon(Icons.keyboard),
                            hintText: "Try your idea"),
                            
                      ),
                    ),
                    RaisedButton(
                      child: Text("TRY"),
                      onPressed: onPressOfButton,
                    ),
                  ],
                ))),
          ),
        ],
      ),
    );
  }
}

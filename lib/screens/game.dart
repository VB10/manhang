import 'package:flutter/material.dart';
import 'package:manhang/controller/QuestionVC.dart';
import 'package:manhang/model/BaseEnum.dart';
import 'package:manhang/model/Question.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final _textEC = new TextEditingController();
  /*
  Generate screen text inputText & questionWord
  */
  String inputText = "";

  String questionWord = "default";

  int wrongAnswer = 1;

  QuestionVC questionVC;
  Question questionModel;
  @override
  void initState() {
    super.initState();
    questionVC = new QuestionVC(this.context);
    questionModel = questionVC.questionModel;
    setState(() {
      questionWord = questionModel.questionWord;
    });
  }

  tryOnPress() {
    //The textedititng control components data
    if (inputText.isEmpty) return;
    //if user input have in language param  will return string so return null
    var isOkey = questionVC.userOnPress(inputText) == null ? true : false;
    setState(() {
      wrongAnswer += isOkey ? 1 : 0;
      questionWord = !isOkey ? questionVC.convertList(inputText) : questionWord;
    });
    if (wrongAnswer == questionModel.totalRights) {
      questionVC.endGame(false);
      return;
    }
    if (!questionWord.contains("_")) {
      questionVC.endGame(true);
      return;
    }
    _textEC.clear();
  }

  onChange(String val) {
    setState(() {
      inputText = val;
    });
  }

  @override
  Widget build(BuildContext acontext) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          color: Colors.black12,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Hero(
                    tag: TAG.game.toString(),
                    child: Image.asset(
                      'assets/images/$wrongAnswer.png',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Icon(
                  Icons.help,
                  color: Colors.white,
                  size: 45,
                ),
                Text(
                  questionModel.questionDescription,
                  softWrap: true,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  questionWord,
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _textEC,
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  onChanged: (val) => onChange(val),
                  onEditingComplete: tryOnPress,
                  decoration: InputDecoration(
                      icon: Icon(Icons.keyboard), hintText: "Try your idea"),
                ),
                RaisedButton(
                  child: Text("TRY"),
                  onPressed: tryOnPress,
                ),
              ],
            ),
          )),
    );
  }
}

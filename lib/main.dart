import 'package:flutter/material.dart';
import 'package:manhang/controller/QuestionVC.dart';
import 'package:manhang/model/BaseEnum.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: GamePage(),
    );
  }
}

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final _textEC = new TextEditingController();
  String inputText = "";
  int wrongAnswer = 1;
  QuestionVC questionVC = QuestionVC.instance;
  String questionWord = QuestionVC.instance.questionModel.questionWord;

  tryOnPress() {
    if (inputText.isEmpty) return;
    var isOkey =
        questionVC.userOnPress(inputText, this.context) == null ? true : false;
    setState(() {
      wrongAnswer += isOkey ? 1 : 0;
      questionWord = !isOkey ? questionVC.convertList(inputText) : questionWord;
    });
    if (wrongAnswer == questionVC.questionModel.totalRights) {
      questionVC.endGame(false, this.context);
      return;
    }
    if (!questionWord.contains("_")) {
      questionVC.endGame(true, this.context);
      return;
    }
    _textEC.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: TAG.game.toString(),
            child: Image.asset(
              'assets/images/$wrongAnswer.png',
              height: MediaQuery.of(context).size.height * 0.5,
            ),
          ),
          Icon(
            Icons.help,
          ),
          Text(
            questionVC.questionModel.questionDescription,
          ),
          Text(
            questionWord,
            style: TextStyle(fontSize: 40),
          ),
          TextField(
            controller: _textEC,
            maxLength: 1,
            onChanged: (val) => setState(() {
                  inputText = val;
                }),
            onEditingComplete: tryOnPress,
            decoration: InputDecoration(
                icon: Icon(Icons.keyboard), hintText: "Try word your thing"),
          ),
          RaisedButton(
            child: Text("TRY"),
            onPressed: tryOnPress,
          ),
        ],
      )),
    );
  }
}

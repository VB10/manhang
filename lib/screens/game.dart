import 'package:flutter/material.dart';
import 'package:manhang/controller/Question.dart';

class GamePage extends StatefulWidget {
  GamePage({
    Key key,
  }) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final _textEC = new TextEditingController();
  String inputText = "";

  /// The questionWord  in this screen text.
  String questionWord = "default";

  /// The {wrongAnswer} have user mistakes count
  int wrongAnswer = 1;

  /// The {_isValid} TextEditingController control empty text

  QuestionVC questionVC;

  @override
  void initState() {
    super.initState();
    questionVC = new QuestionVC(this.context);
    setState(() {
      questionWord = questionVC.questionWord;
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
    if (wrongAnswer == questionVC.totalRights) {
      questionVC.endGame(false);
    }
    if (!questionWord.contains("_")) {
      questionVC.endGame(true);
    }
    _textEC.clear();
  }

  @override
  Widget build(BuildContext acontext) {
    return Scaffold(
        body: Container(
      color: Color.fromRGBO(34, 40, 49, 1),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.red,
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/images/$wrongAnswer.png'),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
                color: Colors.black12,
                alignment: Alignment.center,
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.help,
                      color: Color.fromRGBO(234, 234, 234, 1),
                      size: 45,
                    ),
                    Text(
                      questionVC.questionDescription,
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
                      onChanged: (val) {
                        setState(() {
                          inputText = val;
                        });
                      },
                      decoration: InputDecoration(
                          icon: Icon(Icons.keyboard),
                          hintText: "Try your idea"),
                    ),
                    RaisedButton(
                      child: Text("TRY"),
                      onPressed: tryOnPress,
                    ),
                  ],
                )),
          )
        ],
      ),
    ));
  }
}

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:manhang/main.dart';
import 'package:manhang/model/BaseEnum.dart';
import 'package:manhang/model/Question.dart';

class QuestionVC {
  Question questionModel = new Question();
  static final QuestionVC _questionVC = new QuestionVC();
  static QuestionVC get instance => _questionVC;

  QuestionVC() {
    questionModel.languageWords[LANGUAGE.dart] =
        "helps you craft beautiful, high-quality experiences across all screens";
    questionModel.language = getRandomLanguage();
    questionModel.questionWord = pigUnderline(questionModel.language);
    questionModel.listWord = questionModel.questionWord.trim().split(" ");
  }
  String getRandomLanguage() {
    final LANGUAGE randomLanguage =
        LANGUAGE.values[new Random().nextInt(LANGUAGE.values.length - 1)];
    questionModel.questionDescription =
        questionModel.languageWords[randomLanguage];
    return randomLanguage.toString().split(".").last;
  }

  String convertList(String inputValue) {
    for (var i = 0; i < questionModel.listWord.length; i++) {
      if (questionModel.language[i] == inputValue) {
        questionModel.listWord[i] = inputValue;
      }
    }
    return questionModel.listWord.map((data) => "$data ").join("");
  }

  void endGame(bool type, BuildContext context) {
    Route route = MaterialPageRoute(builder: (context) => GamePage());
    showDialog(
        context: context,
        builder: (BuildContext context) => new AlertDialog(
              content: Image.asset(
                "assets/gif/${type ? "tenor" : "fail"}.gif",
              ),
              backgroundColor: Colors.transparent,
            )).whenComplete(() => {Navigator.pushReplacement(context, route)});
    return;
  }

  pigUnderline(String words) => words.replaceAllMapped(
      new RegExp(r'([A-Z])', caseSensitive: false), (Match m) => "_ ");

  String userOnPress(String input, BuildContext context) {
    if (questionModel.language.indexOf(input) >= 0) {
      if (!questionModel.questionWord.contains("_"))
        endGame(true, context);
      else {
        if (!questionModel.questionWord.contains(input)) {
          return convertList(input);
        }
      }
    }
  }
}

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:manhang/model/BaseEnum.dart';
import 'package:manhang/model/Question.dart';

class QuestionVC {
  Question questionModel = new Question();
  BuildContext context;

  QuestionVC(this.context) {
    setLanguageWord();
    questionModel.language = getRandomLanguage();
    questionModel.questionWord = pigUnderline(questionModel.language);
    questionModel.listWord = questionModel.questionWord.trim().split(" ");
  }

  String getRandomLanguage() {
    final int _randomNumber = new Random().nextInt(LANGUAGE.values.length - 1);
    final LANGUAGE randomLanguage = LANGUAGE.values[_randomNumber];
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
    var _newList = questionModel.listWord.map((data) => "$data ");
    return _newList.join("");
  }

  void endGame(bool type) {
    showDialog(
        context: context,
        builder: (BuildContext context) => new AlertDialog(
              content: Image.asset(
                "assets/gif/${type ? "tenor" : "fail"}.gif",
              ),
              backgroundColor: Colors.transparent,
            )).whenComplete(() => {Navigator.pop(context, true)});
    return;
  }

  pigUnderline(String words) => words.replaceAllMapped(
      new RegExp(r'([A-Z])', caseSensitive: false), (Match m) => "_ ");

  setLanguageWord() {
    questionModel.languageWords[LANGUAGE.dart] =
        "helps you craft beautiful, high-quality experiences across all screens";
    questionModel.languageWords[LANGUAGE.go] =
        "that makes it easy to build simple, reliable, and efficient software.";
    questionModel.languageWords[LANGUAGE.java] =
        "is at the heart of our digital lifestyle.";
    questionModel.languageWords[LANGUAGE.swift] =
        "Our goals for Swift are ambitious: we want to make programming simple things easy, and difficult things possible";
    questionModel.languageWords[LANGUAGE.python] =
        " is a programming language that lets you work quickly and integrate systems more effectively";
  }

  String userOnPress(String input) {
    int searchIndex = questionModel.language.indexOf(input);
    if (searchIndex >= 0) {
      if (!questionModel.questionWord.contains("_")) {
        endGame(true);
      } else {
        if (!questionModel.questionWord.contains(input)) {
          return convertList(input);
        }
      }
    } else {
      return null;
    }
  }
}

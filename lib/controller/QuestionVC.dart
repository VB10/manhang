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
    /// create [_randomNumber] & create [randomLanguage]
    /// show question any language question .
    final int _randomNumber = new Random().nextInt(LANGUAGE.values.length - 1);
    final LANGUAGE randomLanguage = LANGUAGE.values[_randomNumber];
    //Enum.tostring return "Enum.dart" splint and get last word
    //[LANGUAGE.dart] split and return last word
    questionModel.questionDescription =
        questionModel.languageWords[randomLanguage];
    return randomLanguage.toString().split(".").last;
  }

  String convertList(String inputValue) {
    //Control all word character and search have questionword character
    //equals userword
    for (var i = 0; i < questionModel.listWord.length; i++) {
      if (questionModel.language[i] == inputValue) {
        questionModel.listWord[i] = inputValue;
      }
    }
    //Create new list and have refresh data
    var _newList = questionModel.listWord.map((data) => "$data ");
    //Last underline question word update.
    return _newList.join("");
  }

/*
    The user will see final alert dialog.
    [true] param gif type.
  */
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

  // {questionWord} Convert underline text.
  pigUnderline(String words) => words.replaceAllMapped(
      new RegExp(r'([A-Z])', caseSensitive: false), (Match m) => "_ ");

//set language arrays item.
  setLanguageWord() {
    questionModel.languageWords[LANGUAGE.dart] =
        "helps you craft beautiful, high-quality experiences across all screens";
    questionModel.languageWords[LANGUAGE.go] =
        "that makes it easy to build simple, reliable, and efficient software.";
    questionModel.languageWords[LANGUAGE.java] =
        "is at the heart of our digital lifestyle.";
    questionModel.languageWords[LANGUAGE.swift] =
        "Our goals for Swift are ambitious: we want to make programming simple things easy, and difficult things possible";
    questionModel.languageWords[LANGUAGE.kotlin] = "Dont't block keep moving";
    questionModel.languageWords[LANGUAGE.python] =
        " is a programming language that lets you work quickly and integrate systems more effectively";
  }

  //control user input value for have any character in question word.
  String userOnPress(String input) {
//The user write word and control questionString ?
    int searchIndex = questionModel.language.indexOf(input);
    if (searchIndex >= 0) {
      if (!questionModel.questionWord.contains("_")) {
        //if questionWord doesn't have underline , will game finish.
        endGame(true);
      } else {
        //if userword new will going convert list.
        if (!questionModel.questionWord.contains(input)) {
          return convertList(input);
        }
      }
    } else {
      //if input doesn't used will be return null
      return null;
    }

    //default return null
    return null;
  }
}

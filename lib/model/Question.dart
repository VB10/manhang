import 'BaseEnum.dart';

class Question {
  Map<LANGUAGE, String> languageWords = new Map<LANGUAGE, String>();
  Question() {
    setLanguageWord();
  }

//set language arrays item.
  setLanguageWord() {
    languageWords[LANGUAGE.dart] =
        "helps you craft beautiful, high-quality experiences across all screens";
    languageWords[LANGUAGE.go] =
        "that makes it easy to build simple, reliable, and efficient software.";
    languageWords[LANGUAGE.java] = "is at the heart of our digital lifestyle.";
    languageWords[LANGUAGE.swift] =
        "Our goals for Swift are ambitious: we want to make programming simple things easy, and difficult things possible";
    languageWords[LANGUAGE.kotlin] = "Dont't block keep moving";
    languageWords[LANGUAGE.python] =
        " is a programming language that lets you work quickly and integrate systems more effectively";
  }
}

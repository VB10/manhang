import 'package:manhang/model/BaseEnum.dart';

class Question {
  /*
    Generate question helper veriables.
  */
  List<String> listWord;

  String language = "";

  String questionDescription = "default";

  int totalRights = 5;

  String questionWord = "";

  Map<LANGUAGE, String> languageWords;

  Question() {
    listWord = new List<String>();
    languageWords = new Map<LANGUAGE, String>();
  }
}

import 'package:manhang/model/BaseEnum.dart';

class Question {
  /// The [listWord] selected language syllable
  List<String> listWord;

  /// The [language] for selected language
  String language = "";

  /// The [questionDescription] detail for language
  String questionDescription = "default";

  /// The [totalRights] have user health
  int totalRights = 5;

  /// The [totalRights] random language encryption
  String questionWord = "";

  Map<LANGUAGE, String> languageWords;

  Question() {
    listWord = new List<String>();
    languageWords = new Map<LANGUAGE, String>();
  }
}

import 'package:manhang/model/BaseEnum.dart';
class Question {
 
  List<String> listWord = new List<String>();

  String language = "";

  String questionDescription = "default";

  int totalRights = 5;

  String questionWord = "";

  Map<LANGUAGE, String> languageWords = new Map<LANGUAGE, String>();
}

import 'package:chameleonapp/instagram/model/person.dart';
import 'package:chameleonapp/instagram/model/person_history.dart';

class HistoryController {
  static HistoryController _instance = HistoryController._internal();

  HistoryController._internal();

  factory HistoryController() {
    return _instance;
  }

  List<PersonHistory> _getHistories() {
    Person p = Person(name: "Marcus", id: "aGprRddvBDde41fd9feQsfT");
    return List.generate(
        20,
        (index) => PersonHistory(
            person: p,
            historyId: "FssirRRpCsf58RPlKd",
            historyUrl: 'https://placeimg.com/756/756/$index'));
  }
}

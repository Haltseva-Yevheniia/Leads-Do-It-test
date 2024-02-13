import 'package:shared_preferences/shared_preferences.dart';

class LocalSearchHistory {

  List<String> searchHistory = [];

  void addHistory(String? searchName) {
    if (searchName != null) {
      searchHistory.add(searchName);
    } else {}
  }

Future<void> saveHistory() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setStringList('history', searchHistory);
}

Future<void> getHistory() async {
  final prefs = await SharedPreferences.getInstance();

    searchHistory = prefs.getStringList('history') ??
        [
        ];
  }

}


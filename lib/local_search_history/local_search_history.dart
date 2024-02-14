import 'package:shared_preferences/shared_preferences.dart';

class LocalSearchHistory {
  List<String> searchHistory = [];

  //add to List

  void addHistory(String? searchName) {
    if (searchName != null && searchName != "") {
      searchHistory.add(searchName);
    } else {}
  }

  // save to SharedPreferences

  Future<void> saveHistory() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('history', searchHistory);
  }

// get from SharedPreferences

  Future<void> getHistory() async {
    final prefs = await SharedPreferences.getInstance();

    searchHistory = prefs.getStringList('history') ?? [];
  }
}

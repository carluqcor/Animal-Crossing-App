import 'package:shared_preferences/shared_preferences.dart';

savePreferences(String value, String key) async {
  final prefs = await SharedPreferences.getInstance();
  List<String> listPreferences = prefs.getStringList(key);
  if (listPreferences == null){
    List<String> listPreferences = [];
    listPreferences.add(value);
    prefs.setStringList(key,listPreferences);
  }
  listPreferences.add(value);
  prefs.setStringList(key, listPreferences);
}

removePreferences(String value, String key) async {
  final prefs = await SharedPreferences.getInstance();
  List<String> listPreferences = prefs.getStringList(key);
  listPreferences.removeAt(listPreferences.indexOf(value));
  prefs.setStringList(key, listPreferences);
}

readPreferences(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getStringList(key);
}
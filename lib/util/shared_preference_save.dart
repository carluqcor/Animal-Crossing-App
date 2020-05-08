import 'package:shared_preferences/shared_preferences.dart';

Future<List<String>> readPreferences(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getStringList(key);
}
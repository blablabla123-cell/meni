import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedInterface {
  SharedPreferences? prefs;

  Future<SharedPreferences?> getPrefs();

  Future<bool> write(String key, String value);

  String? read(String key);

  Future<bool> clear();

  Future<bool> remove(String key);

  Future<bool> init();
}

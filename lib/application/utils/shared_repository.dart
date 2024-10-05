import 'package:meni/application/utils/shared_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedRepository implements SharedInterface {
  @override
  Future<bool> init() async {
    prefs = await getPrefs();
    return true;
  }

  @override
  Future<bool> clear() async => await prefs?.clear() ?? false;

  @override
  String? read(String key) => prefs?.getString(key);

  @override
  Future<bool> write(String key, String value) async => await prefs?.setString(key, value) ?? false;

  @override
  Future<SharedPreferences?> getPrefs() async => await SharedPreferences.getInstance();

  @override
  Future<bool> remove(String key) async => await prefs?.remove(key) ?? false;

  @override
  SharedPreferences? prefs;
}

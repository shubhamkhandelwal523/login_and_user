import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  Future<void> saveCredentials(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('password', password);
  }

  Future<bool> checkCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('username') && prefs.containsKey('password');
  }

  Future<void> clearCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    await prefs.remove('password');
  }
}

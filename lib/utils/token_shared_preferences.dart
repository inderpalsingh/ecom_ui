import 'package:shared_preferences/shared_preferences.dart';

class TokenPrefs {
  SharedPreferences? prefs;
  String myToken = "token";

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  /// get token
  Future<String> getToken() async {
    await initPrefs();
    return prefs!.getString(myToken) ?? "";
  }

  /// set token
  void setToken({required String token}) async {
    initPrefs();
    prefs!.setString(myToken, token);

  }
}

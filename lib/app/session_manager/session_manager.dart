import 'package:nb_utils/nb_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'prefs_keys.dart';

/// SessionManager class is used to manage the user session.
/// It uses SharedPreferences to store and retrieve session data.
class SessionManager {
  late SharedPreferences prefs;

  /// Singleton instance of SessionManager.
  static SessionManager? _instance;

  factory SessionManager() => _instance ??= SessionManager._internal();

  SessionManager._internal();

  /// Factory method to get the instance of SessionManager.
  factory SessionManager.getInstance() {
    return SessionManager();
  }

  /// Initialize the SharedPreferences instance.
  Future<void> init() async {
    try {
      prefs = await SharedPreferences.getInstance();
    } catch (e) {
      // Handle initialization error, log the error, or throw it further.
      print('Error initializing SharedPreferences: $e');
    }
  }

  /// Set the login status of the user.
  Future<void> setIsLogin({
    required bool isLogin,
  }) async {
    await prefs.setBool(
      prefsIsLogin,
      isLogin,
    );
  }

  /// Get the login status of the user.
  Future<bool> getIsLogin() async {
    return prefs.getBool(prefsIsLogin) ?? false;
  }

  /// Set the username of the logged-in user.
  Future<void> setLoggedUserName(
    String userName,
  ) async {
    await prefs.setString(
      prefsLoggedUserName,
      userName,
    );
  }

  /// Get the username of the logged-in user.
  Future<String?> getLoggedUserName() async {
    return prefs.getString(prefsLoggedUserName);
  }

  /// Set the password of the logged-in user.
  Future<void> setLoggedUserPassword(
    String password,
  ) async {
    await prefs.setString(
      prefsLoggedUserPassword,
      password,
    );
  }

  /// Get the password of the logged-in user.
  Future<String?> getLoggedUserPassword() async {
    return prefs.getString(prefsLoggedUserPassword);
  }

  /// Set the token of the logged-in user.
/// Get the token of the logged-in user.
  Future<void> setToken(String token) async {
    await prefs.setString(prefsToken, token);
  }

  /// Get the token of the logged-in user.
  Future<String?> getToken() async {
    return prefs.getString(prefsToken);
  }

  /// Clear all the session data.
  Future<void> clearSession() async {
    await prefs.clear();
  }
}

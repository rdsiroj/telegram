import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static const String _isLoggedInKey = 'isLoggedIn';
  static const String _tokenKey = 'token';

  // Menyimpan status login
  static Future<void> saveLoginStatus(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, status);
    print("Login status saved: $status"); // Debugging
  }

  // Mengambil status login
  static Future<bool> getLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  // Menghapus status login
  static Future<void> clearLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_isLoggedInKey);
    await clearToken(); // Hapus token saat logout
  }

  // Mengecek apakah pengguna sudah login
  static Future<bool> isLoggedIn() async {
    return await getLoginStatus();
  }

  // Menyimpan token
  static Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
    print("Token saved: $token"); // Debugging
  }

  // Mengambil token
  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  // Menghapus token
  static Future<void> clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  // Optional: Set login status without saving
  static void setLoginStatus(bool bool) {}
}

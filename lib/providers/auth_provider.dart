import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService authService = AuthService();
  bool isLoggedIn = false;

  var user;

  Future<void> login(String email, String password) async {
    await authService.login(email, password);
    isLoggedIn = true;
    notifyListeners();
  }

  Future<void> logout() async {
    await authService.logout();
    isLoggedIn = false;
    notifyListeners();
  }
}

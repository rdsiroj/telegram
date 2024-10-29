import 'package:flutter/material.dart';
import 'package:telegram/services/auth_service.dart';
import 'screens/auth_screen.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final authService = AuthService();
  bool isLoggedIn = await authService.isLoggedIn();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: isLoggedIn
          ? '/home'
          : '/auth', // Set initial route based on login status
      routes: {
        '/auth': (context) => AuthScreen(),
        '/home': (context) => HomeScreen(),
      },
    ),
  );
}

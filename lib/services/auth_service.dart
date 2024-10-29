import 'package:appwrite/appwrite.dart';
import '../utils/session_manager.dart';

class AuthService {
  final Client client = Client();
  late Account account;

  AuthService() {
    client
        .setEndpoint('https://cloud.appwrite.io/v1') // Endpoint Appwrite
        .setProject('671fb32000392c194510'); // Project ID Appwrite
    account = Account(client);
  }

  Future<bool> register(String name, String email, String password) async {
    try {
      await account.create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: name,
      );
      await SessionManager.saveLoginStatus(true);
      return true;
    } catch (e) {
      print("Register error: $e");
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      await account.createEmailSession(email: email, password: password);
      await SessionManager.saveLoginStatus(true);
      return true;
    } catch (e) {
      if (e is AppwriteException) {
        print("Login error: ${e.message}");
      } else {
        print("Login error: $e");
      }
      return false;
    }
  }

  Future<void> logout() async {
    try {
      await account.deleteSession(sessionId: 'current');
      await SessionManager.clearLoginStatus();
    } catch (e) {
      print("Logout error: $e");
    }
  }

  Future<bool> isLoggedIn() async {
    return await SessionManager.isLoggedIn();
  }
}

extension on Account {
  createEmailSession({required String email, required String password}) {}
}

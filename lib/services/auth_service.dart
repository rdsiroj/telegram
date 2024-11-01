import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
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

  Future<bool> register(String email, String password) async {
    try {
      await account.create(
        userId: ID.unique(),
        email: email,
        password: password,
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
      print("Login error: $e");
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

  Future<User?> getCurrentUser() async {
    try {
      if (await isLoggedIn()) {
        final user = await account.get();
        return user;
      } else {
        print('User is not logged in');
        return null;
      }
    } catch (e) {
      print('Error fetching user: $e');
      return null;
    }
  }

  Future<String> getUserName() async {
    try {
      final user = await getCurrentUser();
      return user?.name ?? "Selamat Datang"; // Mengambil nama pengguna
    } catch (e) {
      print('Error fetching user name: $e');
      return "Selamat Datang"; // Default jika terjadi kesalahan
    }
  }
}

extension on Account {
  createEmailSession({required String email, required String password}) {}
}

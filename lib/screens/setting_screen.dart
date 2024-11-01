import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences
import 'package:telegram/screens/auth_screen.dart'; // Import AuthScreen

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pengaturan",
          style: TextStyle(
            fontFamily: 'HelveticaNeue',
            fontWeight: FontWeight.bold,
            fontSize: 24, // Ukuran font yang lebih besar
          ),
        ),
        backgroundColor: Color(0xFF0088CC), // Warna biru khas Telegram
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFEFF7FF),
              Color(0xFFB3E5FC)
            ], // Gradien latar belakang
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding:
              EdgeInsets.symmetric(vertical: 20, horizontal: 10), // Padding
          children: [
            _buildSettingItem(Icons.person, 'Akun', () {
              // Aksi ketika item ini ditekan
            }),
            _buildSettingItem(Icons.notifications, 'Notifikasi', () {
              // Aksi ketika item ini ditekan
            }),
            _buildSettingItem(Icons.privacy_tip, 'Privasi', () {
              // Aksi ketika item ini ditekan
            }),
            _buildSettingItem(Icons.language, 'Bahasa', () {
              // Aksi ketika item ini ditekan
            }),
            _buildSettingItem(Icons.help, 'Bantuan', () {
              // Aksi ketika item ini ditekan
            }),
            Divider(thickness: 2), // Pembatas yang lebih tebal
            _buildSettingItem(Icons.logout, 'Keluar', () {
              _showLogoutConfirmationDialog(
                  context); // Tampilkan dialog konfirmasi logout
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem(IconData icon, String title, Function onTap) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5), // Margin antara kartu
      elevation: 2, // Efek bayangan
      child: ListTile(
        leading: Icon(icon, color: Color(0xFF0088CC)), // Warna ikon
        title: Text(
          title,
          style: TextStyle(fontSize: 18),
        ),
        onTap: () => onTap(), // Panggil fungsi onTap saat ditekan
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Logout',
              style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text('Apakah Anda yakin ingin keluar?'),
          actions: [
            TextButton(
              child: Text('Batal', style: TextStyle(color: Color(0xFF0088CC))),
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
            ),
            TextButton(
              child: Text('Logout', style: TextStyle(color: Colors.red)),
              onPressed: () async {
                // Hapus status login
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.remove('isLoggedIn'); // Hapus status login
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) =>
                          AuthScreen()), // Arahkan ke AuthScreen
                );
              },
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:telegram/services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  final AuthService authService = AuthService();

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Logout', style: TextStyle(color: Colors.blueAccent)),
          content: Text('Apakah Anda yakin ingin keluar?'),
          actions: [
            TextButton(
              onPressed: () async {
                await authService.logout(); // Panggil fungsi logout
                Navigator.of(context)
                    .pushReplacementNamed('/auth'); // Navigasi ke AuthScreen
              },
              child: Text('Ya', style: TextStyle(color: Colors.blueAccent)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: Text('Tidak', style: TextStyle(color: Colors.grey)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Telegram',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.logout, color: Colors.black),
            onPressed: () {
              _showLogoutDialog(context); // Tampilkan dialog konfirmasi logout
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 8.0, vertical: 8.0), // Tambahkan padding
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(12), // Buat sudut lebih melengkung
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Text('U$index', style: TextStyle(color: Colors.white)),
                ),
                title: Text(
                  'Pengguna $index',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  'Pesan terakhir dari Pengguna $index',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                trailing: Text(
                  '10:00 AM',
                  style: TextStyle(color: Colors.grey),
                ),
                onTap: () {
                  // Tindakan saat mengetuk pengguna
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.message),
        onPressed: () {
          // Tindakan untuk membuat pesan baru
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0), // Tambahkan padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home, color: Colors.black),
                onPressed: () {
                  // Tindakan untuk beranda
                },
              ),
              IconButton(
                icon: Icon(Icons.chat, color: Colors.black),
                onPressed: () {
                  // Tindakan untuk chat
                },
              ),
              IconButton(
                icon: Icon(Icons.person, color: Colors.black),
                onPressed: () {
                  // Tindakan untuk profil
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

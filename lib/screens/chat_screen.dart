import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"), // Judul halaman chat
        backgroundColor: Color(0xFF0088CC), // Warna biru khas Telegram
      ),
      body: Center(
        child: Text(
          "Halaman Chat", // Teks yang ditampilkan di tengah halaman
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

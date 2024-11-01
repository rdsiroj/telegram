import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kontak"),
        backgroundColor: Color(0xFF0088CC), // Warna biru khas Telegram
      ),
      body: Center(
        child: Text(
          "Halaman Kontak",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

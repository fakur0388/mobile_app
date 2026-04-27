import 'package:flutter/material.dart';

/// Widget sederhana untuk menampilkan Hello World
/// Ini adalah StatelessWidget paling dasar di Flutter - tidak memiliki state yang berubah
class HelloWorld extends StatelessWidget {
  const HelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur dasar Material Design untuk sebuah halaman
    return Scaffold(
      // AppBar adalah bilah judul di bagian atas layar
      appBar: AppBar(
        title: const Text("Hello World"),
      ),
      // Body adalah area konten utama di bawah AppBar
      body: Center(
        // Center widget menempatkan child-nya di tengah layar
        child: Column(
          // Column menyusun widget anak-anaknya secara vertikal (atas ke bawah)
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            // Text adalah widget untuk menampilkan teks
            Text(
              "Hello, World! 🌍",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            SizedBox(height: 16), // Jarak vertikal antara text
            // Menampilkan ikon Flutter
            Icon(
              Icons.flutter_dash,
              size: 48,
              color: Colors.indigo,
            ),
          ],
        ),
      ),
    );
  }
}

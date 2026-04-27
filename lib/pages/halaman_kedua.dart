import 'package:flutter/material.dart';

/// Halaman kedua yang ditampilkan sebagai navigasi dari Halaman Pertama
/// Halaman sederhana dengan AppBar dan body kosong
class HalamanKedua extends StatelessWidget {
  const HalamanKedua({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur Material Design untuk halaman
    return Scaffold(
      // AppBar menampilkan judul halaman di bagian atas
      appBar: AppBar(
        title: const Text("Halaman Kedua"),
      ),
      // Body berisi konten utama halaman (saat ini kosong)
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon untuk visual menarik
            const Icon(
              Icons.check_circle,
              size: 64,
              color: Colors.green,
            ),
            const SizedBox(height: 16),
            // Text untuk feedback ke user
            const Text(
              "Selamat di Halaman Kedua!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

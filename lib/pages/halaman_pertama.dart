import 'package:flutter/material.dart';
import '../shared_widgets/card_widget.dart';
import 'halaman_kedua.dart';

/// Halaman pertama yang menampilkan navigasi ke halaman kedua
/// Menggunakan GestureDetector untuk menangkap tap event pada CardWidget
class HalamanPertama extends StatelessWidget {
  const HalamanPertama({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur Material Design untuk halaman
    return Scaffold(
      // AppBar menampilkan judul halaman di bagian atas
      appBar: AppBar(title: const Text("Halaman Pertama")),
      // Body berisi konten utama halaman
      body: Center(
        // GestureDetector menangkap interaksi user (seperti tap/tekan)
        child: GestureDetector(
          // onTap dipanggil ketika user mengetuk CardWidget
          onTap: () {
            // Navigator.push menampilkan halaman baru di atas halaman saat ini
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HalamanKedua()),
            );
          },
          // CardWidget adalah widget custom untuk menampilkan kartu dengan icon dan judul
          child: const Cardwidget(
            judul: "Buka Halaman Kedua",
            icon: Icons.arrow_forward,
          ),
        ),
      ),
    );
  }
}

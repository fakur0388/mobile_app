import 'package:flutter/material.dart';
import '../shared_widgets/card_widget.dart';

/// Halaman parsing yang menampilkan daftar informasi akademik
/// Menggunakan Column untuk menyusun CardWidget secara vertikal
class Parsing extends StatelessWidget {
  const Parsing({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur Material Design untuk halaman
    return Scaffold(
      // AppBar menampilkan judul halaman di bagian atas
      appBar: AppBar(title: const Text("Parsing Page")),
      // Body berisi konten utama halaman
      body: Column(
        // Column menyusun widget anak-anaknya secara vertikal (atas ke bawah)
        children: const [
          // CardWidget adalah widget custom untuk menampilkan kartu dengan icon dan judul
          Cardwidget(
            judul: "Universitas Bina Sarana Informatika",
            icon: Icons.account_balance,
          ),
          Cardwidget(judul: "Pengenalan Flutter", icon: Icons.add_home_work),
          Cardwidget(judul: "Parsing Data", icon: Icons.add_location),
          Cardwidget(judul: "Mobile Programming", icon: Icons.android),
        ],
      ),
    );
  }
}

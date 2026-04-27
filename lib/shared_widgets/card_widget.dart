import 'package:flutter/material.dart';

/// Widget custom untuk menampilkan kartu dengan icon dan judul
/// Menggunakan Card dan ListTile untuk UI yang rapi dan konsisten
class Cardwidget extends StatelessWidget {
  final IconData icon;
  final String judul;

  /// Constructor untuk Cardwidget
  /// [icon] - IconData untuk ditampilkan di sebelah kiri
  /// [judul] - String untuk ditampilkan sebagai judul kartu
  const Cardwidget({super.key, required this.icon, required this.judul});

  @override
  Widget build(BuildContext context) {
    // Card adalah widget Material Design untuk menampilkan konten dalam kotak dengan shadow
    return Card(
      // ListTile adalah widget yang menyusun icon, title, dan subtitle secara horizontal
      child: ListTile(
        // Leading adalah widget yang ditampilkan di sebelah kiri (ikon)
        leading: Icon(icon),
        // Title adalah widget utama yang ditampilkan di tengah (judul)
        title: Text(judul),
      ),
    );
  }
}

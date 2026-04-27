import 'package:flutter/material.dart';

/// Widget yang menampilkan kombinasi Row dan Column membentuk grid 3x3
/// Mendemonstrasikan nested Row dan Column untuk layout kompleks
class RowColumnWidget extends StatelessWidget {
  const RowColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Grid Modern 3x3")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // Mengatur konten utama agar berada di tengah layar secara vertikal
            mainAxisAlignment: MainAxisAlignment.center,
            // Memastikan baris-baris di dalamnya melebar mengikuti lebar layar
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Memanggil method buildRow untuk setiap baris
              buildRow(context, 1),
              const SizedBox(height: 15), // Jarak antar baris
              buildRow(context, 2),
              const SizedBox(height: 15),
              buildRow(context, 3),
            ],
          ),
        ),
      ),
    );
  }

  // Method untuk membuat baris yang berisi 3 kolom secara dinamis
  Widget buildRow(BuildContext context, int rowNumber) {
    final children = <Widget>[];

    for (var columnIndex = 0; columnIndex < 3; columnIndex++) {
      // Kalkulasi indeks unik (1-9) untuk menentukan ikon yang muncul
      final cellIndex = (rowNumber - 1) * 3 + columnIndex + 1;

      children.add(
        Expanded(
          // Menggunakan Expanded agar setiap item dalam satu baris punya lebar yang sama
          child: _buildModernGridItem(
            context,
            "Row $rowNumber Column ${columnIndex + 1}",
            cellIndex,
          ),
        ),
      );

      // Tambahkan jarak horizontal antar kolom, kecuali setelah kolom terakhir
      if (columnIndex != 2) {
        children.add(const SizedBox(width: 16));
      }
    }

    return Row(children: children);
  }

  // Helper untuk membangun tampilan setiap kotak dalam grid
  Widget _buildModernGridItem(
    BuildContext context,
    String label,
    int iconIndex,
  ) {
    return AspectRatio(
      // Memastikan setiap item tetap berbentuk kotak sempurna (1:1)
      aspectRatio: 1,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _iconForIndex(
                iconIndex,
              ), // Mengambil ikon berdasarkan angka indeks
              color: Theme.of(context).colorScheme.secondary,
              size: 32,
            ),
            const SizedBox(height: 10),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                fontSize:
                    12, // Sedikit diperkecil agar teks panjang tidak overflow
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Logika sederhana untuk menentukan ikon berdasarkan nomor urut kotak
  IconData _iconForIndex(int index) {
    switch (index) {
      case 1:
        return Icons.filter_1;
      case 2:
        return Icons.filter_2;
      case 3:
        return Icons.filter_3;
      case 4:
        return Icons.filter_4;
      case 5:
        return Icons.filter_5;
      case 6:
        return Icons.filter_6;
      case 7:
        return Icons.filter_7;
      case 8:
        return Icons.filter_8;
      case 9:
        return Icons.filter_9;
      default:
        return Icons.apps;
    }
  }
}

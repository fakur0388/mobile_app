import 'package:flutter/material.dart';

/// Widget yang menampilkan list item secara horizontal menggunakan Row
/// Mendemonstrasikan penggunaan Expanded untuk layout responsif
class RowWidget extends StatelessWidget {
  const RowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // List ikon untuk baris
    final rowIcons = [
      Icons.filter_1,
      Icons.filter_2,
      Icons.filter_3,
      Icons.filter_4,
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Widget Row Modern")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            // Mengatur perataan anak widget di awal sumbu silang (atas)
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Looping untuk membuat item secara dinamis
              for (var i = 0; i < rowIcons.length; i++) ...[
                // Expanded memastikan setiap kotak berbagi ruang yang sama rata
                // sehingga tidak terjadi overflow jika layar sempit
                Expanded(
                  child: _buildSquareTile(context, "Row ${i + 1}", rowIcons[i]),
                ),
                // Memberikan jarak horizontal antar kotak, kecuali setelah kotak terakhir
                if (i != rowIcons.length - 1) const SizedBox(width: 16),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // Method helper untuk membuat UI kotak yang konsisten
  Widget _buildSquareTile(BuildContext context, String text, IconData icon) {
    return AspectRatio(
      // AspectRatio 1 memastikan tinggi kotak akan selalu sama dengan lebarnya (persegi)
      aspectRatio: 1,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          // Mengambil warna dari skema tema yang aktif
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
          // Menempatkan ikon dan teks di tengah kotak secara vertikal
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Theme.of(context).colorScheme.secondary,
              size: 32,
            ),
            const SizedBox(height: 10),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize:
                    14, // Ukuran sedikit disesuaikan agar pas di layar kecil
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

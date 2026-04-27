import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Widget yang menampilkan list item secara vertikal menggunakan Column
/// Mendemonstrasikan penggunaan LayoutBuilder untuk responsivitas
class ColumnWidget extends StatelessWidget {
  const ColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // List ikon yang akan ditampilkan secara berurutan di dalam Column
    final columnIcons = [
      Icons.filter_1,
      Icons.filter_2,
      Icons.filter_3,
      Icons.filter_4,
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Widget Column Modern")),
      // LayoutBuilder digunakan untuk mendapatkan ukuran layar (constraints) secara real-time
      body: LayoutBuilder(
        builder: (context, constraints) {
          const spacing = 16.0;
          final availableWidth = constraints.maxWidth;

          // Logika responsif: Menghitung ukuran kotak berdasarkan lebar layar yang tersedia
          final computedSize = (availableWidth - (spacing * 3)) / 4;
          // Memastikan ukuran kotak minimal adalah 80.0 agar tidak terlalu kecil
          final tileSize = math.max(computedSize, 80.0);

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: ConstrainedBox(
              // Memastikan konten setidaknya setinggi layar agar Center widget berfungsi maksimal
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Center(
                child: Column(
                  // Menempatkan item di tengah secara vertikal
                  mainAxisAlignment: MainAxisAlignment.center,
                  // Membuat lebar item mengikuti lebar Column (stretch)
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Melakukan looping untuk membuat widget secara dinamis dari list columnIcons
                    for (var i = 0; i < columnIcons.length; i++) ...[
                      _buildSquareTile(
                        context,
                        "Column ${i + 1}",
                        columnIcons[i],
                        tileSize,
                      ),
                      // Memberikan jarak antar item, kecuali untuk item terakhir
                      if (i != columnIcons.length - 1)
                        const SizedBox(height: spacing),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Method helper untuk membangun UI kotak/tile yang konsisten
  Widget _buildSquareTile(
    BuildContext context,
    String text,
    IconData icon,
    double size,
  ) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: size,
        height: size,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(15),
            // Memberikan efek shadow halus untuk kedalaman visual
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
                icon,
                color: Theme.of(context).colorScheme.secondary,
                size: 32,
              ),
              const SizedBox(height: 10),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

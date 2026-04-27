import 'package:flutter/material.dart';

/// Halaman untuk menampilkan detail data mata kuliah dari form input.
class MataKuliahDetail extends StatelessWidget {
  final String mataKuliah;
  final int sks;
  final String semester;

  const MataKuliahDetail({
    super.key,
    required this.mataKuliah,
    required this.sks,
    required this.semester,
  });

  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur halaman dengan AppBar dan body.
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Mata Kuliah')),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Menampilkan nama mata kuliah.
                Text(
                  'Mata Kuliah : $mataKuliah',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                // Menampilkan jumlah SKS.
                Text('SKS : $sks', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                // Menampilkan semester mata kuliah.
                Text(
                  'Semester : $semester',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

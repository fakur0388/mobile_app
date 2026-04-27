// File: contoh_stateless.dart
// Deskripsi: Contoh StatelessWidget sederhana dengan tampilan counter statis
// StatelessWidget TIDAK BISA mengubah state/data secara dinamis
// Counter dibuat constant karena tidak bisa diubah

import 'package:flutter/material.dart';

/// Contoh widget stateless yang menunjukkan keterbatasan StatelessWidget
/// StatelessWidget bersifat immutable dan tidak bisa mengubah state secara dinamis
class ContohStateless extends StatelessWidget {
  // Counter dibuat const karena StatelessWidget bersifat immutable (tidak bisa diubah)
  final int counter = 0;

  const ContohStateless({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold adalah struktur dasar halaman Flutter
    return Scaffold(
      appBar: AppBar(
        // Judul AppBar
        title: const Text("Contoh Stateless"),
      ),
      body: Column(
        // Widget utama untuk mengatur layout vertikal
        children: [
          // Menampilkan nilai counter (selalu 0 karena const)
          Text(
            "Nomor : ${counter}",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20), // Jarak vertikal
          // Row untuk mengatur tombol secara horizontal
          Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceEvenly, // Rata tengah dengan jarak merata
            children: [
              // Tombol Tambah - Tampilkan pesan karena tidak bisa ubah counter
              ElevatedButton(
                onPressed: () {
                  // Gunakan SnackBar untuk feedback karena stateless tidak bisa ubah state
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Stateless tidak bisa menambah counter!'),
                    ),
                  );
                },
                child: const Text("Tambah"),
              ),
              // Tombol Reset - Tampilkan pesan
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Counter sudah 0 dan tidak bisa diubah!'),
                    ),
                  );
                },
                child: const Text("Reset"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

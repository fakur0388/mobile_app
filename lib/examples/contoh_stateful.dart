// File: contoh_stateful.dart
// Deskripsi: Contoh StatefulWidget dengan counter yang bisa diubah secara dinamis
// StatefulWidget BISA mengubah state/data menggunakan setState()

import 'package:flutter/material.dart';

/// Contoh widget stateful yang menunjukkan kemampuan mengubah state secara dinamis
/// StatefulWidget memungkinkan perubahan state dengan menggunakan setState()
class ContohStateful extends StatefulWidget {
  const ContohStateful({super.key});

  // Method wajib untuk StatefulWidget - membuat State object
  @override
  State<ContohStateful> createState() => _ContohStatefulState();
}

// Private State class untuk mengelola state counter
class _ContohStatefulState extends State<ContohStateful> {
  // Variabel counter yang bisa diubah (mutable)
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    // Scaffold sebagai struktur dasar halaman
    return Scaffold(
      appBar: AppBar(
        // Judul AppBar
        title: const Text("Contoh Stateful"),
      ),
      body: Column(
        // Layout utama vertikal
        children: [
          // Tampilkan nilai counter yang akan berubah secara real-time
          Text(
            "Nomor : ${counter}",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20), // Jarak antar elemen
          // Row untuk tombol-tombol horizontal
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceEvenly, // Distribusi merata
            children: [
              // Tombol Tambah - Menggunakan setState untuk update counter
              ElevatedButton(
                onPressed: () {
                  // setState memicu rebuild widget dengan nilai baru
                  setState(() {
                    counter++;
                  });
                },
                child: const Text("Tambah"),
              ),
              // Tombol Reset - Menggunakan setState untuk reset counter ke 0
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter = 0;
                  });
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

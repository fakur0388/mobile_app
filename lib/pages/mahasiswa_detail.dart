import 'package:flutter/material.dart';

/// Halaman untuk menampilkan detail data mahasiswa yang sudah diinput dari form.
class MahasiswaDetail extends StatelessWidget {
  final String nim;
  final String nama;
  final String alamat;

  const MahasiswaDetail({
    super.key,
    required this.nim,
    required this.nama,
    required this.alamat,
  });

  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur halaman dengan AppBar dan body.
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Mahasiswa')),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Menampilkan NIM mahasiswa.
                Text('NIM : $nim', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                // Menampilkan nama mahasiswa.
                Text('Nama : $nama', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                // Menampilkan alamat mahasiswa.
                Text('Alamat : $alamat', style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

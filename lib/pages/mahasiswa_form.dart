import 'package:flutter/material.dart';

import 'mahasiswa_detail.dart';

/// Halaman form untuk menambahkan data mahasiswa.
class MahasiswaForm extends StatefulWidget {
  const MahasiswaForm({super.key});

  @override
  State<MahasiswaForm> createState() => MahasiswaFormState();
}

class MahasiswaFormState extends State<MahasiswaForm> {
  // GlobalKey untuk mengontrol dan memvalidasi form.
  final _formKey = GlobalKey<FormState>();

  // Controller untuk mengambil nilai input dari masing-masing field.
  final _nimCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();

  @override
  void dispose() {
    // Melepas resource controller saat widget dihancurkan.
    _nimCtrl.dispose();
    _namaCtrl.dispose();
    _alamatCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold sebagai struktur utama halaman form.
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Mahasiswa')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Memanggil field NIM dari fungsi terpisah.
            nimField(),
            const SizedBox(height: 10),
            // Memanggil field Nama dari fungsi terpisah.
            namaField(),
            const SizedBox(height: 10),
            // Memanggil field Alamat dari fungsi terpisah.
            alamatField(),
            const SizedBox(height: 16),
            // Memanggil tombol simpan dari fungsi terpisah.
            tombolSimpan(),
          ],
        ),
      ),
    );
  }

  // Widget field input NIM.
  Widget nimField() {
    return TextFormField(
      controller: _nimCtrl,
      decoration: const InputDecoration(
        labelText: 'NIM',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        // Validasi agar NIM tidak kosong.
        if (value == null || value.trim().isEmpty) {
          return 'NIM wajib diisi';
        }
        return null;
      },
    );
  }

  // Widget field input Nama.
  Widget namaField() {
    return TextFormField(
      controller: _namaCtrl,
      decoration: const InputDecoration(
        labelText: 'Nama',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        // Validasi agar Nama tidak kosong.
        if (value == null || value.trim().isEmpty) {
          return 'Nama wajib diisi';
        }
        return null;
      },
    );
  }

  // Widget field input Alamat.
  Widget alamatField() {
    return TextFormField(
      controller: _alamatCtrl,
      maxLines: 2,
      decoration: const InputDecoration(
        labelText: 'Alamat',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        // Validasi agar Alamat tidak kosong.
        if (value == null || value.trim().isEmpty) {
          return 'Alamat wajib diisi';
        }
        return null;
      },
    );
  }

  // Widget tombol simpan untuk validasi dan pindah ke halaman detail.
  Widget tombolSimpan() {
    return ElevatedButton.icon(
      onPressed: () {
        // Jalankan validasi form sebelum navigasi.
        if (_formKey.currentState!.validate()) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MahasiswaDetail(
                nim: _nimCtrl.text.trim(),
                nama: _namaCtrl.text.trim(),
                alamat: _alamatCtrl.text.trim(),
              ),
            ),
          );
        }
      },
      icon: const Icon(Icons.save),
      label: const Text('Simpan'),
    );
  }
}

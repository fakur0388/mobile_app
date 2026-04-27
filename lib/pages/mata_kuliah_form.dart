import 'package:flutter/material.dart';

import 'mata_kuliah_detail.dart';

/// Halaman form untuk menambahkan data mata kuliah.
class MataKuliahForm extends StatefulWidget {
  const MataKuliahForm({super.key});

  @override
  State<MataKuliahForm> createState() => MataKuliahFormState();
}

class MataKuliahFormState extends State<MataKuliahForm> {
  // GlobalKey untuk mengontrol validasi form.
  final _formKey = GlobalKey<FormState>();

  // Controller untuk mengambil nilai dari tiap input field.
  final _mataKuliahCtrl = TextEditingController();
  final _sksCtrl = TextEditingController();
  final _semesterCtrl = TextEditingController();

  @override
  void dispose() {
    // Dispose controller agar tidak terjadi memory leak.
    _mataKuliahCtrl.dispose();
    _sksCtrl.dispose();
    _semesterCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold sebagai struktur utama halaman form.
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Mata Kuliah')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Field nama mata kuliah dipisah ke fungsi khusus.
            mataKuliahField(),
            const SizedBox(height: 10),
            // Field SKS dipisah ke fungsi khusus.
            sksField(),
            const SizedBox(height: 10),
            // Field semester dipisah ke fungsi khusus.
            semesterField(),
            const SizedBox(height: 16),
            // Tombol simpan dipisah ke fungsi khusus.
            tombolSimpan(),
          ],
        ),
      ),
    );
  }

  // Widget field input untuk nama mata kuliah (tipe String).
  Widget mataKuliahField() {
    return TextFormField(
      controller: _mataKuliahCtrl,
      decoration: const InputDecoration(
        labelText: 'Mata Kuliah',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        // Validasi agar nama mata kuliah wajib diisi.
        if (value == null || value.trim().isEmpty) {
          return 'Mata kuliah wajib diisi';
        }
        return null;
      },
    );
  }

  // Widget field input untuk SKS (tipe Integer).
  Widget sksField() {
    return TextFormField(
      controller: _sksCtrl,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'SKS',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        // Validasi agar SKS wajib diisi.
        if (value == null || value.trim().isEmpty) {
          return 'SKS wajib diisi';
        }

        // Validasi konversi string ke integer.
        final parsed = int.tryParse(value.trim());
        if (parsed == null) {
          return 'SKS harus berupa angka';
        }

        // Validasi sederhana agar SKS bernilai positif.
        if (parsed <= 0) {
          return 'SKS harus lebih dari 0';
        }

        return null;
      },
    );
  }

  // Widget field input untuk semester (tipe String).
  Widget semesterField() {
    return TextFormField(
      controller: _semesterCtrl,
      decoration: const InputDecoration(
        labelText: 'Semester',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        // Validasi agar semester wajib diisi.
        if (value == null || value.trim().isEmpty) {
          return 'Semester wajib diisi';
        }
        return null;
      },
    );
  }

  // Widget tombol simpan untuk validasi lalu kirim data ke halaman detail.
  Widget tombolSimpan() {
    return ElevatedButton.icon(
      onPressed: () {
        // Jalankan validasi form sebelum lanjut ke halaman detail.
        if (_formKey.currentState!.validate()) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MataKuliahDetail(
                mataKuliah: _mataKuliahCtrl.text.trim(),
                sks: int.parse(_sksCtrl.text.trim()),
                semester: _semesterCtrl.text.trim(),
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

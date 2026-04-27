import 'package:flutter/material.dart';

// ===== Mengimport basic widgets =====
// Widgets dasar untuk latihan penggunaan Row, Column, dan layout dasar
import 'basic_widgets/hello_world.dart';
import 'basic_widgets/column_widget.dart';
import 'basic_widgets/row_widget.dart';

// ===== Mengimport intermediate widgets =====
// Widgets yang menggabungkan Row dan Column untuk layout lebih kompleks
import 'intermediate_widgets/row_column_widget.dart';

// ===== Mengimport pages/halaman =====
// Halaman-halaman yang menunjukkan navigasi dan parsing data
import 'pages/halaman_pertama.dart';
import 'pages/parsing.dart';
import 'pages/mahasiswa_form.dart';
import 'pages/mata_kuliah_form.dart';

// ===== Mengimport example widgets =====
// Contoh-contoh widget untuk pembelajaran StatelessWidget dan StatefulWidget
import 'examples/contoh_stateless.dart';
import 'examples/contoh_stateful.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Menghilangkan banner "debug" di pojok kanan atas simulator/device
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Modern',
      theme: ThemeData(
        // Mengaktifkan desain Material 3 yang lebih modern
        useMaterial3: true,
        // Membuat skema warna otomatis berdasarkan warna indigo
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        // Mengatur tampilan AppBar secara global agar seragam di semua halaman
        appBarTheme: const AppBarTheme(centerTitle: true, elevation: 2),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "HOME",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Menggunakan ListView agar menu bisa di-scroll jika jumlahnya bertambah banyak
        child: ListView(
          children: [
            _buildMenuCard(
              context,
              title: "Buka Hello World",
              icon: Icons.text_fields,
              page:
                  const HelloWorld(), // Memanggil class dari basic_widgets/hello_world.dart
            ),
            const SizedBox(height: 12), // Memberi jarak vertikal antar kartu
            _buildMenuCard(
              context,
              title: "Buka Widget Column",
              icon: Icons.view_column,
              page: const ColumnWidget(),
            ),
            const SizedBox(height: 12),
            _buildMenuCard(
              context,
              title: "Buka Widget Row",
              icon: Icons.view_headline,
              page: const RowWidget(),
            ),
            const SizedBox(height: 12),
            _buildMenuCard(
              context,
              title: "Buka Grid 3x3 Row & Column",
              icon: Icons.grid_view,
              page: const RowColumnWidget(),
            ),
            const SizedBox(height: 12),
            _buildMenuCard(
              context,
              title: "Buka Halaman Pertama",
              icon: Icons.arrow_forward,
              page: const HalamanPertama(),
            ),
            const SizedBox(height: 12),
            _buildMenuCard(
              context,
              title: "Buka Parsing Page",
              icon: Icons.data_usage,
              page: const Parsing(),
            ),
            const SizedBox(height: 12),
            // Menu baru: Form tambah mahasiswa untuk input data
            _buildMenuCard(
              context,
              title: "Tambah Mahasiswa",
              icon: Icons.person_add,
              page: const MahasiswaForm(),
            ),
            const SizedBox(height: 12),
            // Menu baru: Form tambah mata kuliah untuk input data
            _buildMenuCard(
              context,
              title: "Tambah Mata Kuliah",
              icon: Icons.menu_book,
              page: const MataKuliahForm(),
            ),
            const SizedBox(height: 12),
            // Menu baru: Contoh Stateless Widget
            _buildMenuCard(
              context,
              title: "Contoh Stateless Widget",
              icon: Icons.code,
              page: const ContohStateless(),
            ),
            const SizedBox(height: 12),
            // Menu baru: Contoh Stateful Widget (bisa ubah counter secara dinamis)
            _buildMenuCard(
              context,
              title: "Contoh Stateful Widget",
              icon: Icons.change_circle,
              page: const ContohStateful(),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method untuk membuat kartu menu agar kode di atas tetap rapi dan reusable
  Widget _buildMenuCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Widget page,
  }) {
    return Card(
      elevation: 4, // Memberikan efek bayangan pada kartu
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        // Bagian kiri: Icon di dalam lingkaran berwarna lembut
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Theme.of(context).colorScheme.primary),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        // Bagian kanan: Icon panah penunjuk
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        // Fungsi navigasi saat kartu di-tap
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        ),
      ),
    );
  }
}

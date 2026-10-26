// belajar material app

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Mahasiswa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors
              .green, //  Ganti seedColor menjadi Colors.green
          useMaterial3: true,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Dashboard Mahasiswa',
          ), // Ngubah judul AppBar
        ),
        body: const Center(
          child: Text('Halo, Nama Saya Given', style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}

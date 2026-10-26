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
          seedColor: Colors.green,
          useMaterial3: true,
        ),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          useMaterial3: true,
        ),
        brightness:
            Brightness.dark, // nambahin darkTheme
      ),
      themeMode: ThemeMode
          .dark, // themeMode menjadi ThemeMode.dark
      home: Scaffold(
        appBar: AppBar(title: const Text('Dashboard Mahasiswa')),
        body: const Center(
          child: Text('Halo, Nama Saya Given', style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}

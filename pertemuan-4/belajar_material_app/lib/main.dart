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
      title: 'Aplikasi Kampus', //[cite: 14]
      debugShowCheckedModeBanner: false, //[cite: 14]
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo, //[cite: 14]
          useMaterial3: true, //[cite: 14]
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Belajar Flutter'), //[cite: 14]
        ),
        body: const Center(
          child: Text(
            'Selamat Belajar Flutter!', //[cite: 14]
            style: TextStyle(fontSize: 20), //[cite: 14]
          ),
        ),
      ),
    );
  }
}

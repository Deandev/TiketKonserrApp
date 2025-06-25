import 'package:flutter/material.dart';
import 'home_page.dart'; // Kita akan buat file ini selanjutnya

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp adalah "kerangka" utama aplikasi kita
    return MaterialApp(
      // Ini untuk menghilangkan banner "DEBUG" di pojok kanan atas
      debugShowCheckedModeBanner: false,

      // Kita atur tema aplikasi menjadi gelap, seperti di gambar
      theme: ThemeData.dark(),

      // Ini memberitahu aplikasi untuk memulai dengan HomePage
      home: const HomePage(),
    );
  }
}

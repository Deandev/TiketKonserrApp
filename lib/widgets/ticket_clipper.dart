import 'package:flutter/material.dart';

// Kelas ini berfungsi sebagai "cetakan" atau "pemotong"
// untuk memberikan bentuk unik pada widget tiket kita.
class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Menggambar dari kiri atas, ke bawah sampai sebelum lekukan
    path.lineTo(0.0, size.height * 0.7);

    // Membuat lekukan setengah lingkaran di sisi kiri
    path.arcToPoint(
      Offset(0, size.height * 0.8),
      radius: const Radius.circular(20.0),
      clockwise: false,
    );

    // Lanjutkan menggambar ke pojok kiri bawah, lalu ke kanan, lalu ke atas
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.8);

    // Membuat lekukan setengah lingkaran di sisi kanan
    path.arcToPoint(
      Offset(size.width, size.height * 0.7),
      radius: const Radius.circular(20.0),
      clockwise: false,
    );

    // Selesaikan path ke pojok kanan atas dan tutup
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'models/ticket_model.dart'; // Impor model tiket
import 'widgets/ticket_clipper.dart';

class ETicketPage extends StatelessWidget {
  final Ticket ticket;
  const ETicketPage({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF1ED760);
    const Color darkBackgroundColor = Color(0xFF121212);

    return Scaffold(
      backgroundColor: darkBackgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'E-Tiket Anda',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Area Hijau dengan Tiket
            Container(
              color: primaryColor,
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 48),
              child: _buildTicket(),
            ),
            // Area Hitam dengan Info Pengguna dan Tombol
            Container(
              transform: Matrix4.translationValues(0.0, -24.0, 0.0),
              padding: const EdgeInsets.all(24.0),
              decoration: const BoxDecoration(
                color: darkBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  _buildUserInfoCard(),
                  const SizedBox(height: 20),
                  _buildBackButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Widget untuk membangun kartu tiket putih
  Widget _buildTicket() {
    return ClipPath(
      clipper: TicketClipper(),
      child: Container(
        padding: const EdgeInsets.all(24.0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ticket.event.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _InfoColumn(title: 'Tanggal', value: ticket.event.date),
                const _InfoColumn(
                  title: 'Waktu',
                  value: '19.30 WIB',
                ), // Asumsi waktu statis
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const _InfoColumn(
                  title: 'Tipe Check-In',
                  value: 'VIP A',
                ), // Asumsi statis
                _InfoColumn(title: 'ID Pesanan', value: ticket.bookingId),
              ],
            ),
            const SizedBox(height: 16),
            _InfoColumn(title: 'Tempat', value: ticket.event.location),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Divider(color: Colors.grey[300], thickness: 1),
            ),
            Center(
              child: BarcodeWidget(
                barcode: Barcode.code128(),
                data: ticket.bookingId, // Data barcode dari ID booking
                width: 300,
                height: 80,
                color: Colors.black,
                drawText: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Widget untuk kartu info pengguna
  Widget _buildUserInfoCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF282828),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=kitani'),
            radius: 24,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ticket.userName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ticket.email,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Widget untuk tombol "Kembali ke Beranda"
  Widget _buildBackButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF282828),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Kembali ke Beranda',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

// Widget helper untuk kolom info
class _InfoColumn extends StatelessWidget {
  final String title;
  final String value;
  const _InfoColumn({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

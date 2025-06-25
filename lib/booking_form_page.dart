import 'dart:math';
import 'package:flutter/material.dart';
import 'models/event_model.dart';
import 'models/ticket_model.dart';

class BookingFormPage extends StatefulWidget {
  final Event event;
  final Function(Ticket) onTicketPurchased;

  const BookingFormPage({
    super.key,
    required this.event,
    required this.onTicketPurchased,
  });

  @override
  State<BookingFormPage> createState() => _BookingFormPageState();
}

class _BookingFormPageState extends State<BookingFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _quantityController = TextEditingController(text: '1');

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  void _submitBooking() {
    // Jalankan validasi, jika form valid, lanjutkan.
    if (_formKey.currentState!.validate()) {
      final newTicket = Ticket(
        event: widget.event,
        userName: _nameController.text,
        email: _emailController.text,
        quantity: int.parse(_quantityController.text),
        purchaseDate: DateTime.now(),
        bookingId: 'BK-${Random().nextInt(999999)}',
      );

      widget.onTicketPurchased(newTicket);

      // Tampilkan dialog konfirmasi sukses
      showDialog(
        context: context,
        barrierDismissible: false, // Pengguna harus menekan tombol
        builder:
            (context) => AlertDialog(
              title: const Text("Pembelian Berhasil!"),
              content: Text(
                "Tiket Anda untuk ${widget.event.title} telah dikonfirmasi.",
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    // Kembali 2 kali untuk menutup dialog dan halaman form
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK"),
                ),
              ],
            ),
      );
    }
  }

  // ** BARU: Fungsi untuk membuat dekorasi input yang konsisten **
  InputDecoration _buildInputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Colors.grey.withOpacity(0.1),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF1ED760)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pesan Tiket',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ** BARU: Tampilkan detail acara yang dipesan **
              Text(
                widget.event.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Harga per tiket: ${widget.event.price}",
                style: TextStyle(fontSize: 16, color: Colors.grey[300]),
              ),
              const SizedBox(height: 32),

              // Input Nama
              TextFormField(
                controller: _nameController,
                decoration: _buildInputDecoration('Nama Lengkap'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Silakan masukkan nama Anda';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Input Email
              TextFormField(
                controller: _emailController,
                decoration: _buildInputDecoration('Alamat Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null ||
                      !value.contains('@') ||
                      !value.contains('.')) {
                    return 'Silakan masukkan email yang valid';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Input Jumlah Tiket
              TextFormField(
                controller: _quantityController,
                decoration: _buildInputDecoration('Jumlah Tiket'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null ||
                      int.tryParse(value) == null ||
                      int.parse(value) < 1) {
                    return 'Silakan masukkan jumlah yang valid (minimal 1)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40),

              // Tombol Konfirmasi
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitBooking,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1ED760),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Konfirmasi Pembelian',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

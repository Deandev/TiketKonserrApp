import 'package:flutter/material.dart';
import 'models/ticket_model.dart';
import 'e_ticket_page.dart'; // Halaman e-ticket lama akan kita gunakan untuk detail

class MyTicketsPage extends StatelessWidget {
  final List<Ticket> tickets;

  const MyTicketsPage({super.key, required this.tickets});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tiket Saya'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body:
          tickets.isEmpty
              // Tampilan jika tidak ada tiket
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.confirmation_number_outlined,
                      size: 80,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Anda belum memiliki tiket.",
                      style: TextStyle(color: Colors.grey[400], fontSize: 16),
                    ),
                    Text(
                      "Pesan acara untuk melihat tiket Anda di sini.",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              )
              // Tampilan jika ada tiket
              : ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: tickets.length,
                itemBuilder: (context, index) {
                  final ticket = tickets[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          ticket.event.imageUrl,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        ticket.event.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Jml: ${ticket.quantity} - Dipesan oleh ${ticket.userName}',
                      ),
                      onTap: () {
                        // Buka halaman e-ticket detail saat di-klik
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ETicketPage(ticket: ticket),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
    );
  }
}

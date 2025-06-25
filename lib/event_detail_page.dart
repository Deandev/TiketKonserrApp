import 'package:flutter/material.dart';
import 'models/event_model.dart';
import 'models/ticket_model.dart';
import 'booking_form_page.dart';

class EventDetailPage extends StatelessWidget {
  final Event event;
  final Set<String> favoriteEventTitles;
  final Function(String) onToggleFavorite;
  final Function(Ticket) onTicketPurchased;

  const EventDetailPage({
    super.key,
    required this.event,
    required this.favoriteEventTitles,
    required this.onToggleFavorite,
    required this.onTicketPurchased,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isFavorite = favoriteEventTitles.contains(event.title);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.network(
              event.imageUrl,
              height: screenSize.height * 0.5,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Positioned(
            top: 40,
            right: 10,
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.white,
                size: 30,
              ),
              onPressed: () => onToggleFavorite(event.title),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF121212),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(24.0),
                  children: [
                    Text(
                      event.category,
                      style: const TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      event.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          event.price,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "/ orang",
                          style: TextStyle(color: Colors.white70),
                        ),
                        const Spacer(),
                        const Text(
                          "Termasuk pajak",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Divider(color: Colors.white24),
                    ),
                    Text(
                      event.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildInfoRow(Icons.calendar_today, event.date),
                    const SizedBox(height: 12),
                    _buildInfoRow(
                      Icons.location_on,
                      event.location,
                      isLocation: true,
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "Detail Acara",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      event.details,
                      style: const TextStyle(
                        color: Colors.white70,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16).copyWith(top: 8),
        color: const Color(0xFF121212),
        child: ElevatedButton(
          onPressed: () {
            // Buka halaman formulir dan kirimkan fungsi serta data pengguna
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => BookingFormPage(
                      event: event,
                      onTicketPurchased: onTicketPurchased,
                    ),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1ED760),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            'Beli Tiket',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text, {bool isLocation = false}) {
    return Row(
      children: [
        Icon(icon, color: Colors.green, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(text, style: const TextStyle(color: Colors.white)),
        ),
        if (isLocation)
          const Text(
            "Petunjuk Arah",
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
      ],
    );
  }
}

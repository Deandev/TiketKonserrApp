import 'package:flutter/material.dart';
import 'models/event_model.dart';
import 'models/ticket_model.dart';
import 'event_detail_page.dart';

class FavoritesPage extends StatelessWidget {
  final List<Event> allEvents;
  final Set<String> favoriteEventTitles;
  final Function(String) onToggleFavorite;
  // ** BARU: Menerima fungsi untuk menangani pembelian tiket **
  final Function(Ticket) onTicketPurchased;

  const FavoritesPage({
    super.key,
    required this.allEvents,
    required this.favoriteEventTitles,
    required this.onToggleFavorite,
    required this.onTicketPurchased, // Tambahkan di constructor
  });

  @override
  Widget build(BuildContext context) {
    // Filter untuk mendapatkan hanya acara yang difavoritkan
    final favoriteEvents =
        allEvents
            .where((event) => favoriteEventTitles.contains(event.title))
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Acara Favorit'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body:
          favoriteEvents.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: 80,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Anda belum memfavoritkan acara apa pun.",
                      style: TextStyle(color: Colors.grey[400], fontSize: 16),
                    ),
                  ],
                ),
              )
              : ListView.separated(
                padding: const EdgeInsets.all(16.0),
                itemCount: favoriteEvents.length,
                separatorBuilder:
                    (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final event = favoriteEvents[index];
                  return _buildFavoriteListItem(context, event);
                },
              ),
    );
  }

  // Widget untuk menampilkan setiap item di daftar favorit
  Widget _buildFavoriteListItem(BuildContext context, Event event) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => EventDetailPage(
                  event: event,
                  favoriteEventTitles: favoriteEventTitles,
                  onToggleFavorite: onToggleFavorite,
                  // ** PERBAIKAN: Teruskan fungsi onTicketPurchased **
                  onTicketPurchased: onTicketPurchased,
                ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.15),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                event.imageUrl,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.grey[400],
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        event.location,
                        style: TextStyle(color: Colors.grey[400], fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

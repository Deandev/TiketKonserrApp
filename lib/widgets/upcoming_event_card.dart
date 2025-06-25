import 'package:flutter/material.dart';
import '../models/event_model.dart'; // Sesuaikan path jika perlu
import 'event_card.dart'; // Sesuaikan path jika perlu

class UpcomingEventCard extends StatelessWidget {
  final Event event;
  final Function(Event) onEventTapped;

  const UpcomingEventCard({
    super.key,
    required this.event,
    required this.onEventTapped,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => onEventTapped(event),
      child: EventCard(
        imageUrl: event.imageUrl,
        price: event.price,
        title: event.title,
        subtitle: event.category,
        width: screenWidth - 32,
        height: 180,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/event_model.dart'; // Sesuaikan path jika perlu
import 'event_card.dart'; // Sesuaikan path jika perlu

class HorizontalEventList extends StatelessWidget {
  final List<Event> events;
  final Function(Event) onEventTapped;

  const HorizontalEventList({
    super.key,
    required this.events,
    required this.onEventTapped,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return GestureDetector(
            onTap: () => onEventTapped(event),
            child: EventCard(
              imageUrl: event.imageUrl,
              price: event.price,
              title: event.title,
              subtitle: event.category,
            ),
          );
        },
      ),
    );
  }
}

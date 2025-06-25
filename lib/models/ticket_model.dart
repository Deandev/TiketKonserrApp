import 'event_model.dart';

// Ini adalah "blueprint" untuk setiap tiket yang dibeli.
class Ticket {
  final Event event;
  final String userName;
  final String email;
  final int quantity;
  final String bookingId;
  final DateTime purchaseDate;

  const Ticket({
    required this.event,
    required this.userName,
    required this.email,
    required this.quantity,
    required this.bookingId,
    required this.purchaseDate,
  });
}

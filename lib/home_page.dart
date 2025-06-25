import 'package:flutter/material.dart';
import 'widgets/categories_section.dart';
import 'widgets/horizontal_event_list.dart';
import 'widgets/upcoming_event_card.dart';
import 'models/event_model.dart';
import 'models/ticket_model.dart';
import 'my_tickets_page.dart';
import 'favorites_page.dart';
import 'event_detail_page.dart';
import 'profile_page.dart';
import 'data/dummy_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final Set<String> _favoriteEventTitles = {};
  final List<Ticket> _myTickets = [];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _toggleFavorite(String eventTitle) {
    setState(() {
      if (_favoriteEventTitles.contains(eventTitle)) {
        _favoriteEventTitles.remove(eventTitle);
      } else {
        _favoriteEventTitles.add(eventTitle);
      }
    });
  }

  void _addTicket(Ticket newTicket) {
    setState(() {
      _myTickets.add(newTicket);
    });
  }

  void _onItemTapped(int index) {
    if (index == 1) {
      // Favorit
      final allEvents = [
        ...trendingEventsData,
        upcomingEventData,
        ...nearbyEventsData,
      ];
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) => FavoritesPage(
                allEvents: allEvents,
                favoriteEventTitles: _favoriteEventTitles,
                onToggleFavorite: _toggleFavorite,
                onTicketPurchased: _addTicket,
              ),
        ),
      );
    } else if (index == 2) {
      // Tiket
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyTicketsPage(tickets: _myTickets),
        ),
      );
    } else if (index == 3) {
      // Profil
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfilePage()),
      );
    } else {
      // Beranda/Temukan
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _onEventCardTapped(Event event) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => EventDetailPage(
              event: event,
              favoriteEventTitles: _favoriteEventTitles,
              onToggleFavorite: _toggleFavorite,
              onTicketPurchased: _addTicket,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Temukan Acara',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body:
          _isLoading
              ? const Center(
                child: CircularProgressIndicator(color: Color(0xFF1ED760)),
              )
              : _buildContentView(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Temukan'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_number_outlined),
            label: 'Tiket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _buildContentView() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CategoriesSection(),
            const SizedBox(height: 24.0),
            _buildSectionTitle('Acara Trending'),
            const SizedBox(height: 16.0),
            HorizontalEventList(
              events: trendingEventsData,
              onEventTapped: _onEventCardTapped,
            ),
            const SizedBox(height: 24.0),
            _buildSectionTitle('Acara Mendatang'),
            const SizedBox(height: 16.0),
            UpcomingEventCard(
              event: upcomingEventData,
              onEventTapped: _onEventCardTapped,
            ),
            const SizedBox(height: 24.0),
            _buildSectionTitle('Acara Terdekat'),
            const SizedBox(height: 16.0),
            HorizontalEventList(
              events: nearbyEventsData,
              onEventTapped: _onEventCardTapped,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) => Text(
    title,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
  );
}

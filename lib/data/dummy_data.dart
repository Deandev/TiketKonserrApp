import '../models/event_model.dart';

// --- DATA DUMMY LOKAL UNTUK APLIKASI ---
// File ini berfungsi sebagai "database" sementara untuk aplikasi kita.

final List<Event> trendingEventsData = [
  const Event(
    imageUrl:
        'https://images.unsplash.com/photo-1524368535928-5b5e00ddc76b?w=500',
    category: 'Festival Musik',
    title: 'Pestapora 2025',
    price: 'Rp 750k',
    date: 'Minggu, 28 September 2025',
    location: 'Gambir Expo, Jakarta',
    details:
        'Pestapora kembali hadir sebagai perayaan musik Indonesia terkini dengan puluhan musisi dari berbagai genre.',
  ),
  const Event(
    imageUrl:
        'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=500',
    category: 'Konser Pop',
    title: 'Konser Raisa',
    price: 'Rp 550k',
    date: 'Sabtu, 15 November 2025',
    location: 'GBK, Jakarta',
    details:
        'Saksikan penampilan memukau dari Raisa dalam konser tunggalnya yang spektakuler di Gelora Bung Karno.',
  ),
  const Event(
    imageUrl:
        'https://images.unsplash.com/photo-1516924962500-2b4b3b99ea02?w=500',
    category: 'Festival Jazz',
    title: 'Java Jazz Festival',
    price: 'Rp 850k',
    date: 'Jumat, 07 Maret 2026',
    location: 'JIExpo, Jakarta',
    details:
        'Nikmati alunan musik jazz dari musisi ternama lokal dan internasional di festival jazz terbesar se-Asia Tenggara.',
  ),
  const Event(
    imageUrl:
        'https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?w=500',
    category: 'Konser Rock',
    title: 'Tur 30 Tahun Dewa 19',
    price: 'Rp 600k',
    date: 'Sabtu, 14 Februari 2026',
    location: 'Stadion Siliwangi, Bandung',
    details:
        'Rayakan 30 tahun perjalanan karir band legendaris Dewa 19 dalam sebuah konser reuni yang megah.',
  ),
];

final Event upcomingEventData = const Event(
  imageUrl:
      'https://images.unsplash.com/photo-1540039155733-5bb30b53aa14?w=800',
  category: 'Konser Pop',
  title: 'Konser Tunggal Tulus',
  price: 'Rp 450k',
  date: 'Jumat, 24 Oktober 2025',
  location: 'Istora Senayan, Jakarta',
  details:
      'Sebuah malam penuh makna bersama Tulus dalam konser tunggalnya membawakan lagu-lagu hits dari album terbarunya.',
);

final List<Event> nearbyEventsData = [
  const Event(
    imageUrl:
        'https://images.unsplash.com/photo-1464375117522-1311d6a5b81f?w=500',
    category: 'Konser Pop',
    title: 'Sheila on 7 - Live in Jogja',
    price: 'Rp 350k',
    date: 'Sabtu, 20 Desember 2025',
    location: 'Stadion Mandala Krida, Yogyakarta',
    details:
        'Bernostalgia bersama band legendaris Sheila on 7 di kota asal mereka, Yogyakarta.',
  ),
  const Event(
    imageUrl:
        'https://images.unsplash.com/photo-1519677100203-a0e668c92439?w=500',
    category: 'Festival Kuliner',
    title: 'Festival Jajanan Bango',
    price: 'Gratis Masuk',
    date: 'Minggu, 01 Februari 2026',
    location: 'Plaza Senayan, Jakarta',
    details:
        'Jelajahi kekayaan kuliner Nusantara dalam satu tempat di Festival Jajanan Bango tahunan.',
  ),
  const Event(
    imageUrl:
        'https://images.unsplash.com/photo-1501472312651-726afe119ff1?w=500',
    category: 'Pameran Seni',
    title: 'ArtJog 2026',
    price: 'Rp 100k',
    date: 'Jumat, 04 Juli 2026',
    location: 'Jogja National Museum, Yogyakarta',
    details:
        'Pameran seni kontemporer tahunan terbesar di Indonesia yang menampilkan karya-karya seniman muda berbakat.',
  ),
  const Event(
    imageUrl:
        'https://images.unsplash.com/photo-1528901166007-3784c7dd3653?w=500',
    category: 'Konferensi Teknologi',
    title: 'Tech in Asia Jakarta',
    price: 'Rp 1.500k',
    date: 'Sabtu, 12 September 2026',
    location: 'Balai Kartini, Jakarta',
    details:
        'Wadah berkumpulnya para startup, investor, dan talenta teknologi terkemuka di Asia.',
  ),
];

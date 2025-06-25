<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dokumentasi Aplikasi Tiket Konser</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #121212;
            color: #E0E0E0;
        }
        .container {
            max-width: 1200px;
            margin: auto;
        }
        h1, h2, h3 {
            font-weight: 700;
            color: #FFFFFF;
        }
        .gradient-text {
            background: linear-gradient(to right, #1ED760, #28B4D1);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .card {
            background-color: #1E1E1E;
            border: 1px solid #2D2D2D;
        }
        .code-block {
            background-color: #0D0D0D;
            border-left: 4px solid #1ED760;
        }
        .screenshot-gallery img {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .screenshot-gallery img:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.5);
        }
    </style>
</head>
<body>

    <header class="py-12 bg-gray-900/50 border-b border-gray-800">
        <div class="container px-6 text-center">
            <h1 class="text-4xl md:text-5xl font-bold">
                Dokumentasi Proyek <span class="gradient-text">TiketKonserApp</span>
            </h1>
            <p class="mt-4 text-lg text-gray-400">Selamat datang di dokumentasi lengkap aplikasi tiket konser berbasis Flutter.</p>
        </div>
    </header>

    <main class="container px-6 py-16 space-y-20">
        
        <!-- Ringkasan -->
        <section id="ringkasan">
            <div class="card p-8 rounded-xl shadow-lg">
                <h2 class="text-3xl mb-4">Ringkasan</h2>
                <p class="text-gray-300 leading-relaxed">
                    Selamat datang di TiketKonserApp! Aplikasi ini adalah sebuah prototipe mobile yang dibangun menggunakan Flutter, dirancang untuk membantu pengguna menemukan dan menjelajahi berbagai acara musik. Aplikasi ini mengusung desain antarmuka yang modern dengan tema gelap (dark mode), terinspirasi dari aplikasi populer seperti Spotify, untuk memberikan pengalaman pengguna yang nyaman dan menarik. Proyek ini berfungsi sebagai demonstrasi implementasi UI/UX di Flutter.
                </p>
            </div>
        </section>

        <!-- Tampilan Aplikasi -->
        <section id="tampilan">
            <h2 class="text-3xl mb-8 text-center">Tampilan Aplikasi</h2>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 screenshot-gallery">
                <div class="card rounded-lg overflow-hidden">
                    <img src="https://i.imgur.com/OFgIq2x.png" alt="Gambar Halaman Utama" class="w-full h-auto">
                    <p class="p-4 text-center font-semibold">Halaman Utama</p>
                </div>
                <div class="card rounded-lg overflow-hidden">
                    <img src="https://i.imgur.com/1Z2uVbo.png" alt="Gambar Halaman Detail Acara" class="w-full h-auto">
                    <p class="p-4 text-center font-semibold">Detail Acara</p>
                </div>
                <div class="card rounded-lg overflow-hidden">
                    <img src="https://i.imgur.com/sC4G3bB.png" alt="Gambar Form Pemesanan" class="w-full h-auto">
                    <p class="p-4 text-center font-semibold">Form Pemesanan</p>
                </div>
                <div class="card rounded-lg overflow-hidden">
                    <img src="https://i.imgur.com/eBf2gY1.png" alt="Gambar Halaman E-Ticket" class="w-full h-auto">
                    <p class="p-4 text-center font-semibold">E-Ticket</p>
                </div>
                 <div class="card rounded-lg overflow-hidden">
                    <img src="https://i.imgur.com/uR3eJ6h.png" alt="Gambar Halaman Tiket Saya" class="w-full h-auto">
                    <p class="p-4 text-center font-semibold">Tiket Saya</p>
                </div>
                <div class="card rounded-lg overflow-hidden">
                    <img src="https://i.imgur.com/8aZ3vQb.png" alt="Gambar Halaman Profil" class="w-full h-auto">
                    <p class="p-4 text-center font-semibold">Halaman Profil</p>
                </div>
            </div>
        </section>

        <!-- Fitur Utama -->
        <section id="fitur">
             <div class="card p-8 rounded-xl shadow-lg">
                <h2 class="text-3xl mb-6">Fitur Utama</h2>
                <ul class="space-y-4 list-disc list-inside text-gray-300">
                    <li><strong class="text-white">Penjelajahan Acara:</strong> Pengguna dapat melihat detail acara, daftar acara trending, dan acara terdekat.</li>
                    <li><strong class="text-white">Pemesanan Tiket:</strong> Menyediakan alur untuk memesan tiket acara.</li>
                    <li><strong class="text-white">Manajemen Tiket:</strong> Pengguna dapat melihat e-ticket dan daftar tiket yang telah dibeli.</li>
                    <li><strong class="text-white">Favorit:</strong> Memungkinkan pengguna untuk menyimpan acara favorit mereka.</li>
                    <li><strong class="text-white">Profil Pengguna:</strong> Halaman khusus untuk mengelola informasi dan pengaturan akun pengguna.</li>
                    <li><strong class="text-white">Model Data yang Jelas:</strong> Menggunakan `class` untuk menstrukturkan data secara konsisten.</li>
                    <li><strong class="text-white">Data Dummy Lokal:</strong> Memanfaatkan data statis untuk pengembangan UI yang cepat.</li>
                </ul>
            </div>
        </section>

        <!-- Struktur Proyek -->
        <section id="struktur">
            <h2 class="text-3xl mb-6">Struktur Proyek</h2>
            <div class="code-block p-6 rounded-lg overflow-x-auto">
<pre><code class="language-bash text-gray-300">
tiket_konser_app/
├── lib/
│   ├── data/
│   │   └── dummy_data.dart
│   ├── models/
│   │   ├── event_model.dart
│   │   └── ticket_model.dart
│   ├── widgets/
│   ├── booking_form_page.dart
│   ├── e_ticket_page.dart
│   ├── event_detail_page.dart
│   ├── favorites_page.dart
│   ├── home_page.dart
│   ├── my_tickets_page.dart
│   ├── profile_page.dart
│   └── main.dart
├── pubspec.yaml
└── README.md
</code></pre>
            </div>
        </section>
        
        <!-- Cara Menjalankan -->
        <section id="menjalankan">
             <div class="card p-8 rounded-xl shadow-lg">
                <h2 class="text-3xl mb-6">Cara Menjalankan Proyek</h2>
                <ol class="space-y-6">
                    <li>
                        <h3 class="font-semibold text-lg text-white">1. Prasyarat</h3>
                        <p class="text-gray-400">Pastikan Anda telah menginstal <a href="https://flutter.dev/docs/get-started/install" target="_blank" class="text-cyan-400 hover:underline">Flutter SDK</a> di komputer Anda.</p>
                    </li>
                     <li>
                        <h3 class="font-semibold text-lg text-white">2. Clone Repositori</h3>
                        <p class="text-gray-400 mb-2">Dapatkan kode sumber proyek ini.</p>
                        <div class="code-block p-3 rounded-md"><pre><code class="language-bash text-gray-300">git clone &lt;URL_REPOSITORI_ANDA&gt;
cd tiket_konser_app</code></pre></div>
                    </li>
                    <li>
                        <h3 class="font-semibold text-lg text-white">3. Instal Dependensi</h3>
                        <p class="text-gray-400 mb-2">Buka terminal di direktori proyek dan jalankan perintah ini.</p>
                        <div class="code-block p-3 rounded-md"><pre><code class="language-bash text-gray-300">flutter pub get</code></pre></div>
                    </li>
                     <li>
                        <h3 class="font-semibold text-lg text-white">4. Jalankan Aplikasi</h3>
                        <p class="text-gray-400 mb-2">Pastikan emulator berjalan atau perangkat terhubung, lalu jalankan.</p>
                        <div class="code-block p-3 rounded-md"><pre><code class="language-bash text-gray-300">flutter run</code></pre></div>
                    </li>
                </ol>
            </div>
        </section>

    </main>

    <footer class="text-center py-8 mt-12 border-t border-gray-800">
        <p class="text-gray-500">&copy; 2024 TiketKonserApp. Dibuat dengan ❤️ menggunakan Flutter.</p>
    </footer>

</body>
</html>

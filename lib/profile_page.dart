import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Warna yang konsisten dengan tema aplikasi
    const Color primaryColor = Color(0xFF1ED760);
    const Color darkBackgroundColor = Color(0xFF121212);

    return Scaffold(
      backgroundColor: darkBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'Profil',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: darkBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Bagian Header Profil
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/150?u=deyan', // Menggunakan foto dummy
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'DEYAN ARYA FATAH',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'ryfthdeyan@gmail.com',
                style: TextStyle(fontSize: 16, color: Colors.grey[400]),
              ),
              const SizedBox(height: 24),

              // Tombol Edit Profile
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Ubah Profil',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Daftar Menu
              _buildProfileMenuItem(
                icon: Icons.account_circle_outlined,
                text: 'Akun Saya',
                onTap: () {},
              ),
              _buildProfileMenuItem(
                icon: Icons.notifications_outlined,
                text: 'Notifikasi',
                onTap: () {},
              ),
              _buildProfileMenuItem(
                icon: Icons.lock_outline,
                text: 'Privasi & Keamanan',
                onTap: () {},
              ),
              _buildProfileMenuItem(
                icon: Icons.help_outline,
                text: 'Pusat Bantuan',
                onTap: () {},
              ),
              const Divider(color: Colors.white24, height: 32),
              _buildProfileMenuItem(
                icon: Icons.logout,
                text: 'Keluar',
                hasArrow: false, // Tidak ada panah untuk log out
                color: Colors.red,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget helper untuk membuat setiap item menu profil
  Widget _buildProfileMenuItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    bool hasArrow = true,
    Color color = Colors.white,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(width: 20),
            Text(
              text,
              style: TextStyle(
                fontSize: 18,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            if (hasArrow)
              Icon(Icons.arrow_forward_ios, color: Colors.grey[600], size: 16),
          ],
        ),
      ),
    );
  }
}

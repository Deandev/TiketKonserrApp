import 'package:flutter/material.dart';
import 'category_chip.dart'; // Pastikan path ini benar

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: [
        CategoryChip(label: 'Music Concert', icon: Icons.music_note),
        CategoryChip(label: 'City Festival', icon: Icons.location_city),
        CategoryChip(label: 'Theatre', icon: Icons.theater_comedy),
        CategoryChip(label: 'Fashion Show', icon: Icons.checkroom),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class UIWidget extends StatelessWidget {
  const UIWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Tambah padding agar tidak terlalu rapat
      child: TextField(
        decoration: const InputDecoration(
          labelText: "Pencarian",
          border: OutlineInputBorder(), // Tambah border untuk lebih rapi
        ),
      ),
    );
  }
}
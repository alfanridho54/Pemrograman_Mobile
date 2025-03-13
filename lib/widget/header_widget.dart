import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120, // Tinggi ditambah untuk tidak menumpuk
      width: double.infinity,
      color: Colors.green,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Selamat Datang',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: () => _showPromoDialog(context),
              child: const Text("Lihat Promo"),
            ),
          ],
        ),
      ),
    );
  }
}

void _showPromoDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Promo'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Dapatkan diskon 50% untuk semua produk!'),
            const SizedBox(height: 10),
            Image.network(
              "https://plus.unsplash.com/premium_photo-1680196764069-2c373356fee9?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 50),
            ),
          ],
        ),
      );
    },
  );
}
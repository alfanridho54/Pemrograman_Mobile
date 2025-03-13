import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final bool isFavorite;
  final VoidCallback toggleFavorite;
  final String imageURL;

  const ProductCard({
    required this.name,
    required this.price,
    required this.isFavorite,
    required this.toggleFavorite,
    required this.imageURL,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                imageURL,
                fit: BoxFit.cover, // Mencegah gambar tidak proporsional
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image, size: 50),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('Rp.${price.isNotEmpty ? price : '0'}',
                    style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          IconButton(
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            color: isFavorite ? Colors.red : Colors.grey,
            onPressed: toggleFavorite,
          ),
        ],
      ),
    );
  }
}
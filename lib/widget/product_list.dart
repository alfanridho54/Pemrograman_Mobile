import 'package:flutter/material.dart';
// import '../data/product_data.dart';
import 'product_cart.dart';

// class ProductList extends StatefulWidget{
//   @override
//   _ProductListState createState() => _ProductListState();

// }


// class _ProductListState extends State<ProductList>{
class ProductList extends StatelessWidget {
  

  // List<Map<String, dynamic>> product = List.from(produkData);
  final List<Map<String, dynamic>> produk;

  ProductList({required this.produk});
  void toggleFavorite(int index) {
    // setState(() {
    // });
      produk[index]['isFavorite'] = !(produk[index]['isFavorite'] ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return 
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75, // Mengatur aspek agar tidak numpuk
              ),
              itemCount: produk.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  name: produk[index]['name'] ?? 'Unknown',
                  price: produk[index]['price']?.toString() ?? '0',
                  isFavorite: produk[index]['isFavorite'] ?? false,
                  toggleFavorite: () => toggleFavorite(index),
                  imageURL: produk[index]['image'] ?? '',
                );
              },
            ),
          );
  }
}

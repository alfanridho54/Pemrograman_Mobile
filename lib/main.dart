import 'package:first_project/about_page.dart';
import 'package:first_project/contact_page.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Stateless Widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> products = [
    {
      'kode': 'L1',
      'name': 'Laptop Lenovo',
      'price': 20000000,
      'isFavorite': false,
      'image':
          'https://images.unsplash.com/photo-1563986768711-b3bde3dc821e?q=80&w=2668&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    },
    {
      'kode': 'M1',
      'name': 'Hp Samsung',
      'price': 5000000,
      'isFavorite': false,
      'image':
          'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=2680&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    },
  ];

  void toggleFavorite(int index) {
    setState(() {
      products[index]['isFavorite'] = !(products[index]['isFavorite'] ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Column(
        children: [
          const HeaderWidget(),
          const UIWidget(),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75, // Mengatur aspek agar tidak numpuk
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  name: products[index]['name'] ?? 'Unknown',
                  price: products[index]['price']?.toString() ?? '0',
                  isFavorite: products[index]['isFavorite'] ?? false,
                  toggleFavorite: () => toggleFavorite(index),
                  imageURL: products[index]['image'] ?? '',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

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


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();


}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    AboutPage(),
    ContactPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page),
            label: 'Contact',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});


  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();


  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
    final newProduct = {
      'name': _nameController.text,
      'price': _priceController.text,
      'image': _imageController.text,
      'deskripsi': _deskripsiController.text,
      'isFavorite': false,
    };
    Navigator.pop(context, newProduct);
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
        
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Tolong masukkan nama';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _priceController,
              decoration: InputDecoration(labelText: 'Price'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Tolong masukkan harga';
                }
                if (double.tryParse(value) == null) {
                  return 'Tolong masukkan harga yang valid';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _imageController,
              decoration: InputDecoration(labelText: 'Image URL'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Tolong masukkan URL gambar';
                }
                if (!value.startsWith('http://') && !value.startsWith('https://')) {
                  return 'Tolong masukkan URL gambar yang valid';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _deskripsiController,
              decoration: InputDecoration(labelText: 'Deskripsi'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Tolong masukkan deskripsi';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: _submit,
              child: Text('Submit'),
            )
          ],
        ),
      ),
      ),
      );
  
  }
@override
void dispose() {
  _nameController.dispose();
  _priceController.dispose();
  _imageController.dispose();
  _deskripsiController.dispose();
  super.dispose();
}
}

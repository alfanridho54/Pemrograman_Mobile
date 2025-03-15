import 'package:first_project/widget/product_list.dart';
import 'package:flutter/material.dart';
import '../widget/custom_drawer.dart';
import '../widget/header_widget.dart';
import '../widget/search_field.dart';
import '../widget/add_button.dart';
import '../data/product_data.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  // List<Map<String, dynamic>> products = [];
  List<Map<String, dynamic>> products = List.from(produkData);

    void _addProduct (Map<String, dynamic> newProduct) {
    setState(() {
      products.add(newProduct);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          HeaderWidget(),
          UIWidget(),
          ProductList(produk: products,),
        ],
      ),
      floatingActionButton: AddButton(onAdd: _addProduct),
    );
  }
}
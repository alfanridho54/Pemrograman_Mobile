import 'package:first_project/widget/product_list.dart';
import 'package:flutter/material.dart';
import '../widget/custom_drawer.dart';
import '../widget/header_widget.dart';
import '../widget/search_field.dart';

class HomePage extends StatelessWidget{
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
          ProductList(),
        ],
      )
    );
  }
}
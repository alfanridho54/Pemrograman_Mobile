import 'package:first_project/widget/custom_drawer.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Text('Aplikasi ini adalah aplikasi ecommerce yang dibuat menggunakan bahasa pemrograman dart dan framework flutter',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),),
      ),
    );
  }
}
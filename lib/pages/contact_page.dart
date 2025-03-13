import 'package:first_project/widget/custom_drawer.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact'),
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kontak Kami',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text('Telepon: 081234567890'),
            Text('Email: contact@flutter.com'),
          ],
        ),
      ),
    );
  }
}

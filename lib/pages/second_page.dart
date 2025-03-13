import 'package:flutter/material.dart';
import '../widget/custom_drawer.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      drawer: CustomDrawer(),
    );
  }
}
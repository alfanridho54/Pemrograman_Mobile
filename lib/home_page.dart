import 'package:flutter/material.dart';
import 'second_page.dart';
import 'counter_page.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text('Drawer Header', style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              }
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text('Second Page'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
              }
            ),
            ListTile(
              leading: Icon(Icons.contact_page),
              title: Text('Contact'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => CounterPage()));
              })
          ],
        ),
      ),
      body: Center(
        child: Text('Halaman Home'),
      ),
    );
  }
}

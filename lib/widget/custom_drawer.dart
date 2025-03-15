import 'package:first_project/pages/props_page.dart';
import 'package:flutter/material.dart';
import '../pages/home.dart';
import '../pages/second_page.dart';
import '../pages/contact_page.dart';
import '../pages/about_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});


  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => ContactPage()));
            }
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()));
            }
          ),
          ListTile(
            leading: Icon(Icons.pages),
            title: Text('Props Page'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => PropsPage()));
            }
          )
          
          
        ],
      ),
    );
  }
}

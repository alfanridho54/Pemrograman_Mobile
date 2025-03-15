import 'package:first_project/widget/custom_drawer.dart';
import 'package:flutter/material.dart';

  class User{

  final String name;
  final int age;
  final bool isActive;
  

  User({required this.name, required this.age, required this.isActive});
  }

class PropsPage extends StatelessWidget {

  final User user = User(name: 'John Doe', age: 30, isActive: true);

  PropsPage({super.key});

  void showMessage(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Name: ${user.name}\nAge: ${user.age}\nStatus: ${user.isActive ? 'Active' : 'Inactive'}'),
      duration: Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('Props Page'),
    ),
    drawer: CustomDrawer(),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UserCard(user: user),
          ElevatedButton(
            onPressed: () => showMessage(context),
            child: Text('Show Message'),
          ),
        ],

      ),
    ),
  );

  }
}

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${user.name}'),
            Text('Age: ${user.age}'),
            Text('Status: ${user.isActive ? 'Active' : 'Inactive'}'),
          ],
        ),
      ),
    );
  }
}
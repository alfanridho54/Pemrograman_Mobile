import 'package:first_project/pages/addProductPage.dart';
import 'package:flutter/material.dart';


class AddButton extends StatelessWidget {
  final Function(Map<String, dynamic>) onAdd;

  AddButton({required this.onAdd});

  void _navigateToAddProductPage(BuildContext context) async {
    final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => AddProductPage()));
    if (result != null) {
      onAdd(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _navigateToAddProductPage(context),
      child: const Icon(Icons.add),
    );
  }
}

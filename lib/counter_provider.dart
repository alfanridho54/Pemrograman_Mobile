import 'package:flutter/material.dart';


class CounterProvider extends ChangeNotifier {
  int counter = 0;

  int get getCounter => counter;
  void increment() {
    counter++;
    notifyListeners();
  }

  void decrement() {
    counter--;
    notifyListeners();
  }
}
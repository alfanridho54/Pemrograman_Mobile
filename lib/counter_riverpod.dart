import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateNotifierProvider<CounternNotifier, int>((ref) {
  return CounternNotifier();
});

class CounternNotifier extends StateNotifier<int> {
  CounternNotifier() : super(0);

  void increment() => state++;
  void decrement() => state--;
}


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider =
    ChangeNotifierProvider<CounterNotifier>((ref) => CounterNotifier());

class CounterNotifier extends ChangeNotifier {
  var value = 0;
  // var myVar = 1;
  void increment() {
    value++;
    notifyListeners();
  }
}

class ChangeNotifierProviderPage extends ConsumerWidget {
  const ChangeNotifierProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod - ChangeNotifierProvider'),
      ),
      body: Center(child: Text(ref.watch(counterProvider).value.toString())),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).increment();
          // counterMutable.value = 10;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
  }
}

final counterProvider = NotifierProvider<CounterNotifier, int>(
  () => CounterNotifier(),
);

class NotifierProviderPage extends ConsumerWidget {
  const NotifierProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(counterProvider, (previous, next) {
      const snackBar = SnackBar(
        content: Text('Você escolheu um número maior que 3!'),
      );
      if (next > 2) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod - NotifierProvider'),
      ),
      body: Center(child: Text(ref.watch(counterProvider).toString())),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

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

class CounterTypeNotifier extends Notifier<String> {
  @override
  String build() {
    return ref.watch(counterProvider).isEven ? 'Even (Par)' : 'Odd (Ímpar)';
  }
}

final counterTypeProvider = NotifierProvider<CounterTypeNotifier, String>(
  () => CounterTypeNotifier(),
);

class CombiningNotifiersProvidersPage extends ConsumerWidget {
  const CombiningNotifiersProvidersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod - Combining NotifierProviders'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(ref.watch(counterProvider).toString()),
          const SizedBox(
            height: 30,
          ),
          Text(ref.watch(counterTypeProvider)),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

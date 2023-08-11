import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider((ref) => 0);

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final counter = ref.watch(counterProvider).toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod - StateProvider'),
      ),
      body: Center(
          child: Consumer(
        builder: (context, ref, child) => Text(
          ref.watch(counterProvider).toString(),
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

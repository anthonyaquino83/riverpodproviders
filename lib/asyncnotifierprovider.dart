import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = AsyncNotifierProvider<CounterNotifier, int>(
  () => CounterNotifier(),
);

class CounterNotifier extends AsyncNotifier<int> {
  @override
  FutureOr<int> build() {
    return 0;
  }

  void increment() async {
    // try {
    //   state = const AsyncValue.loading();
    //   await Future.delayed(const Duration(seconds: 1));
    //   state = AsyncValue.data(state.value! + 1);
    // } catch (e) {
    //   state = AsyncValue.error(e, StackTrace.current);
    // }
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await Future.delayed(const Duration(seconds: 1));
      return state.value! + 1;
    });
  }
}

class AsyncNotifierProviderPage extends ConsumerWidget {
  const AsyncNotifierProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod - AsyncNotifierProvider'),
      ),
      body: Center(
        child: counter.when(
          data: (data) => Text('$data'),
          error: (error, stackTrace) => Text('$error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

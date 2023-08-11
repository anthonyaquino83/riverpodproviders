import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = AsyncNotifierProvider<CounterNotifier, int>(
  () => CounterNotifier(),
);

class CounterNotifier extends AsyncNotifier<int> {
  @override
  FutureOr<int> build() async {
    await Future.delayed(const Duration(seconds: 1));
    return 0;
  }

  increment() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await Future.delayed(const Duration(seconds: 1));
      return state.value! + 1;
    });
  }
}

class CounterTypeNotifier extends AsyncNotifier<String> {
  @override
  FutureOr<String> build() async {
    await Future.delayed(const Duration(seconds: 2));
    return ref.watch(counterProvider).value!.isEven
        ? 'even (Par)'
        : 'odd (Ímpar)';
  }
}

final counterTypeProvider = AsyncNotifierProvider<CounterTypeNotifier, String>(
  () => CounterTypeNotifier(),
);

class CombiningAsyncNotifiersProvidersPage extends ConsumerWidget {
  const CombiningAsyncNotifiersProvidersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod - Combining AsyncNotifierProviders'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ref.watch(counterProvider).when(
                data: (data) => Text(data.toString()),
                error: (error, stackTrace) => Text('$error'),
                loading: () => const CircularProgressIndicator(),
              ),
          const SizedBox(
            height: 30,
          ),
          ref.watch(counterTypeProvider).when(
                data: (data) => Text(data),
                error: (error, stackTrace) => Text('$error'),
                loading: () => const CircularProgressIndicator(),
              ),
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

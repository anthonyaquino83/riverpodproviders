import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider = FutureProvider<int>(
  (ref) => Future.delayed(
    const Duration(seconds: 2),
    () {
      return Random().nextInt(10);
    },
  ),
);

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(futureProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod - FutureProvider'),
      ),
      body: Center(
        child: counter.when(
          data: (data) => Text('$data'),
          error: (error, stackTrace) => Text('$error'),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

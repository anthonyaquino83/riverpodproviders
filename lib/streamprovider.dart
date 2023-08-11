import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider<int>((ref) async* {
  int i = 0;
  while (true) {
    await Future.delayed(const Duration(seconds: 2));
    yield i++;
    if (i == 3) throw Exception('Stream Error!');
    if (i == 10) break;
  }
});

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(streamProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod - StreamProvider'),
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

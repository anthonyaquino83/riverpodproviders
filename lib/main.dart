import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notifierprovider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riverpod Tutorial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const ProviderPage(),
      // home: const StateProviderPage(),
      // home: const FutureProviderPage(),
      // home: const StreamProviderPage(),
      // home: const ChangeNotifierProviderPage(),
      // home: const StateNotifierProviderPage(),
      home: const NotifierProviderPage(),
      // home: const AsyncNotifierProviderPage(),
      // home: const CombiningNotifiersProvidersPage(),
      // home: const CombiningAsyncNotifiersProvidersPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_eg/example1_basics/all_providers.dart';

class TickerStreamEg extends ConsumerWidget {
  const TickerStreamEg({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticker = ref.watch(tickerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('stream provider'),
      ),
      body: Center(
          child: ticker.when(
        data: (data) => Text(
          data.toString(),
          style: const TextStyle(fontSize: 40),
        ),
        error: (error, stackTrace) => const Text('error'),
        loading: () => const CircularProgressIndicator(),
      )),
    );
  }
}

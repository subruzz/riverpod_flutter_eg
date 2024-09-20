import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_eg/example1_basics/helper.dart';

import 'all_providers.dart';

class CityFutureEg extends ConsumerWidget {
  const CityFutureEg({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = ref.watch(weatherProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: City.values.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      ref.read(currentCityProvider.notifier).state =
                          City.values[index];
                    },
                    title: Text(City.values[index].name),
                    trailing:
                        City.values[index] == ref.watch(currentCityProvider)
                            ? const Icon(Icons.check)
                            : null,
                  );
                },
              ),
            ),
            weather.when(
              data: (data) {
                return Text('Weather emoji: $data');
              },
              error: (error, stackTrace) => const Text('Error mate '),
              loading: () => const CircularProgressIndicator(),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Change  city'),
            )
          ],
        ),
      ),
    );
  }
}

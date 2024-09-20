import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod_eg/example2_user_management/provider/data_provider.dart';
import 'package:flutter_riverpod_eg/example2_user_management/views/dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final person = await showInputDialog(context);
          if (person != null) {
            ref.read(peopleProvider).addPerson(person);
          }
          log('the person is $person');
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('HomePage '),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final dataModel = ref.watch(peopleProvider);
          return ListView.builder(
            itemCount: dataModel.count,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () async {
                  final person =
                      await showInputDialog(context, dataModel.people[index]);
                  if (person != null) {
                    ref.read(peopleProvider).update(person);
                  }
                },
                title: Text(dataModel.people[index].displayName),
              );
            },
          );
        },
      ),
    );
  }
}

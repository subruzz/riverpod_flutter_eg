import 'package:flutter/material.dart';
import 'package:flutter_riverpod_eg/example2_user_management/models/person.dart';

Future<Person?> showInputDialog(BuildContext context,
    [Person? existingPerson]) async {
  String name =
      existingPerson?.name ?? ''; // Pre-fill if existingPerson is provided
  String age = existingPerson?.age.toString() ?? ''; // Pre-fill age if provided

  return showDialog<Person?>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Enter Your Details'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(labelText: 'Name'),
                controller:
                    TextEditingController(text: name), // Pre-fill if existing
                onChanged: (value) {
                  name = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                controller:
                    TextEditingController(text: age), // Pre-fill if existing
                onChanged: (value) {
                  age = value;
                },
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(); // Just pop the dialog
            },
          ),
          TextButton(
            child: const Text('Submit'),
            onPressed: () {
              if (name.isNotEmpty && age.isNotEmpty) {
                if (existingPerson != null) {
                  final newP =
                      existingPerson.copyWith(name: name, age: int.parse(age));
                  Navigator.of(context).pop(newP);
                  return;
                }
                final person = Person(
                  name: name,
                  age: int.parse(age),
                );
                Navigator.of(context).pop(person); // Return the person object
              }
            },
          ),
        ],
      );
    },
  );
}

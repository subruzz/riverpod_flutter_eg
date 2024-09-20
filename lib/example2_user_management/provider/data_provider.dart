import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod_eg/example2_user_management/models/person.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DataProvider extends ChangeNotifier {
  final List<Person> _people = [];
  int get count => _people.length;

  UnmodifiableListView<Person> get people => UnmodifiableListView(_people);

  void addPerson(Person person) {
    _people.add(person);
    notifyListeners();
  }

  void update(Person updatePerson) {
    final index = _people.indexWhere((e) => e.uid == updatePerson.uid);
    _people[index] = updatePerson;
    notifyListeners();
  }
}
final peopleProvider=ChangeNotifierProvider((ref)=>DataProvider());
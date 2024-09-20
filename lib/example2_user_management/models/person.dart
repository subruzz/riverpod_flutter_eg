// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Person extends Equatable {
  final String name;
  final int age;
  final String uid;

  Person({
    required this.name,
    required this.age,
    String? uid,
  }) : uid = uid ?? const Uuid().v4();

  Person copyWith({
    String? name,
    int? age,
    String? uid,
  }) {
    return Person(
        name: name ?? this.name, age: age ?? this.age, uid: uid ?? this.uid);
  }

  String get displayName => '$name ($age years old)';

  @override
  List<Object> get props => [name, age, uid];
  @override
  String toString() {
    return 'Person(name:$name, age:$age,uid:$uid)';
  }
}

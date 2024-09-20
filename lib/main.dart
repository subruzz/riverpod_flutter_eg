
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_eg/example3/views/home.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New Project',
      theme: ThemeData(primaryColor: Colors.black),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const Ex3Home(),
    );
  }
}



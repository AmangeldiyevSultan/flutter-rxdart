import 'package:flutter/material.dart';
import 'package:flutter_rxdart/injection_container.dart';
import 'package:flutter_rxdart/presentation/views/user_page.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

//! https://randomuser.me/api/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter RxDart',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 24)),
        useMaterial3: true,
      ),
      home: const UserPage(),
    );
  }
}

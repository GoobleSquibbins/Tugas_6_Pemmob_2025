import 'package:flutter/material.dart';
import 'ui/form_data.dart';
import 'ui/tampil_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Example',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const FormData(),
        '/tampil': (context) => const TampilData(),
      },
    );
  }
}

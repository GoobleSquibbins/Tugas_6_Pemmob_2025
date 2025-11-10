import 'package:flutter/material.dart';

class TampilData extends StatelessWidget {
  const TampilData({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(title: const Text("Tampilan Data")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nama: ${args['name']}",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              Text("NIM: ${args['nim']}", style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 10),
              Text(
                "Umur: ${args['thnLahir']}",
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TampilData extends StatelessWidget {
  const TampilData({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      backgroundColor: const Color(0xFF000000), // main background
      appBar: AppBar(
        backgroundColor: const Color(0xFF1BD14C), // sec
        title: const Text(
          "Tampilan Data",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(0xFFFFFFFF), // text
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${args['name']}",
                style: const TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFFFFF), // text
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "NIM: ${args['nim']}",
                style: const TextStyle(
                  fontSize: 35,
                  color: Color(0xFFFFFFFF), // text
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Umur: ${args['thnLahir']}",
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFFFFFFFF), // text
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

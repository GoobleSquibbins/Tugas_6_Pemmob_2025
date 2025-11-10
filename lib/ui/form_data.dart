import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormData extends StatefulWidget {
  const FormData({super.key});

  @override
  State<FormData> createState() => _FormDataState();
}

class _FormDataState extends State<FormData> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _nimController = TextEditingController();
  final _thnLahirController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _nimController.dispose();
    _thnLahirController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form Input Data")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Nama"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Masukkan nama" : null,
              ),

              const SizedBox(height: 10),
              TextFormField(
                controller: _nimController,
                decoration: const InputDecoration(labelText: "NIM"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Masukkan NIM" : null,
              ),

              const SizedBox(height: 10),
              TextFormField(
                controller: _thnLahirController,
                decoration: const InputDecoration(labelText: "Tahun Lahir"),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Masukkan Tahun Lahir";
                  }
                  if (int.tryParse(value) == null) {
                    return "Masukkan angka saja";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(
                      context,
                      '/tampil',
                      arguments: {
                        'name': _nameController.text,
                        'nim': _nimController.text,
                        'thnLahir':
                            DateTime.now().year -
                            int.parse(_thnLahirController.text),
                      },
                    );
                  }
                },
                child: const Text("Kirim"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
      backgroundColor: const Color(0xFF000000), // main
      appBar: AppBar(
        backgroundColor: const Color(0xFF1BD14C), // sec
        title: const Text(
          "Form Input Data",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(0xFFFFFFFF), // text
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Nama",
                  labelStyle: TextStyle(color: Color(0xFFFFFFFF)), // text
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1BD14C)), // sec
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1BD14C)), // sec
                  ),
                ),
                style: const TextStyle(color: Color(0xFFFFFFFF)), // text
                validator: (value) =>
                    value == null || value.isEmpty ? "Masukkan nama" : null,
              ),

              const SizedBox(height: 10),
              TextFormField(
                controller: _nimController,
                decoration: const InputDecoration(
                  labelText: "NIM",
                  labelStyle: TextStyle(color: Color(0xFFFFFFFF)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1BD14C)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1BD14C)),
                  ),
                ),
                style: const TextStyle(color: Color(0xFFFFFFFF)),
                validator: (value) =>
                    value == null || value.isEmpty ? "Masukkan NIM" : null,
              ),

              const SizedBox(height: 10),
              TextFormField(
                controller: _thnLahirController,
                decoration: const InputDecoration(
                  labelText: "Tahun Lahir",
                  labelStyle: TextStyle(color: Color(0xFFFFFFFF)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1BD14C)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1BD14C)),
                  ),
                ),
                style: const TextStyle(color: Color(0xFFFFFFFF)),
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
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.end, // pushes button to the right
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1BD14C), // sec
                      foregroundColor: const Color(0xFFFFFFFF), // text
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // no rounding
                      ),
                    ),
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
            ],
          ),
        ),
      ),
    );
  }
}

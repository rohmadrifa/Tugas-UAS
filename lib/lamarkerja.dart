// lamarkerja.dart

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class LamarKerjaPage extends StatefulWidget {
  @override
  _LamarKerjaPageState createState() => _LamarKerjaPageState();
}

class _LamarKerjaPageState extends State<LamarKerjaPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _posisiController = TextEditingController();
  String _jenisPekerjaan = 'Karyawan Tetap';
  bool _includeCV = false;
  String? _cvFilePath;

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Perform form submission
      // You can customize this part to handle form submission or API call
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lamaran Anda berhasil terkirim!'),
        ),
      );

      // Example to show the selected CV file path
      if (_includeCV && _cvFilePath != null) {
        print('CV File Path: $_cvFilePath');
        // You can handle sending the CV file here
      }

      // Navigate back to home page
      Navigator.pop(context);
    }
  }

  Future<void> _pickCV() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _cvFilePath = result.files.single.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lamar Kerja'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(labelText: 'Nama'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _posisiController,
                decoration: InputDecoration(labelText: 'Posisi yang Dilamar'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Posisi yang dilamar tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _jenisPekerjaan,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _jenisPekerjaan = value;
                    });
                  }
                },
                items: ['Karyawan Tetap', 'Magang']
                    .map((label) => DropdownMenuItem(
                          child: Text(label),
                          value: label,
                        ))
                    .toList(),
                decoration: InputDecoration(labelText: 'Jenis Pekerjaan'),
              ),
              SizedBox(height: 20),
              CheckboxListTile(
                title: Text('Sertakan CV'),
                value: _includeCV,
                onChanged: (value) {
                  setState(() {
                    _includeCV = value!;
                    if (!_includeCV) {
                      _cvFilePath = null;
                    }
                  });
                },
              ),
              if (_includeCV) SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _pickCV();
                },
                child: Text('Pilih CV'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (!_includeCV) {
                    _submitForm(context);
                  }
                },
                child: Text('Kirim Lamaran'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

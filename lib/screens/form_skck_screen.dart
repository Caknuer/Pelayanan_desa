import 'package:flutter/material.dart';

class FormSKCKScreen extends StatefulWidget {
  @override
  State<FormSKCKScreen> createState() => _FormSKCKScreenState();
}

class _FormSKCKScreenState extends State<FormSKCKScreen> {
  final _formKey = GlobalKey<FormState>();
  final namaController = TextEditingController();
  final nikController = TextEditingController();
  final ttlController = TextEditingController();
  final alamatController = TextEditingController();
  final keperluanController = TextEditingController();
  final catatanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Pengajuan SKCK')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: namaController,
                decoration: InputDecoration(labelText: 'Nama Lengkap'),
                validator: (value) =>
                    value!.isEmpty ? 'Nama tidak boleh kosong' : null,
              ),
              TextFormField(
                controller: nikController,
                decoration: InputDecoration(labelText: 'NIK'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.length != 16 ? 'NIK harus 16 digit' : null,
              ),
              TextFormField(
                controller: ttlController,
                decoration:
                    InputDecoration(labelText: 'Tempat, Tanggal Lahir'),
                validator: (value) =>
                    value!.isEmpty ? 'TTL harus diisi' : null,
              ),
              TextFormField(
                controller: alamatController,
                decoration: InputDecoration(labelText: 'Alamat'),
                validator: (value) =>
                    value!.isEmpty ? 'Alamat tidak boleh kosong' : null,
              ),
              TextFormField(
                controller: keperluanController,
                decoration: InputDecoration(labelText: 'Keperluan'),
                validator: (value) =>
                    value!.isEmpty ? 'Keperluan harus diisi' : null,
              ),
              TextFormField(
                controller: catatanController,
                decoration: InputDecoration(labelText: 'Catatan Tambahan'),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Pengajuan SKCK berhasil dikirim'),
                    ));
                  }
                },
                child: Text('Kirim Permohonan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

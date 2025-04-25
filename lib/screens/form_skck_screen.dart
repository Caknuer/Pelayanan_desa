import 'package:flutter/material.dart';

class FormSKCKScreen extends StatefulWidget {
  const FormSKCKScreen({super.key});

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
      appBar: AppBar(title: const Text('Form Pengajuan SKCK')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(labelText: 'Nama Lengkap'),
                validator: (value) =>
                    value!.isEmpty ? 'Nama tidak boleh kosong' : null,
              ),
              TextFormField(
                controller: nikController,
                decoration: const InputDecoration(labelText: 'NIK'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.length != 16 ? 'NIK harus 16 digit' : null,
              ),
              TextFormField(
                controller: ttlController,
                decoration:
                    const InputDecoration(labelText: 'Tempat, Tanggal Lahir'),
                validator: (value) =>
                    value!.isEmpty ? 'TTL harus diisi' : null,
              ),
              TextFormField(
                controller: alamatController,
                decoration: const InputDecoration(labelText: 'Alamat'),
                validator: (value) =>
                    value!.isEmpty ? 'Alamat tidak boleh kosong' : null,
              ),
              TextFormField(
                controller: keperluanController,
                decoration: const InputDecoration(labelText: 'Keperluan'),
                validator: (value) =>
                    value!.isEmpty ? 'Keperluan harus diisi' : null,
              ),
              TextFormField(
                controller: catatanController,
                decoration: const InputDecoration(labelText: 'Catatan Tambahan'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Pengajuan SKCK berhasil dikirim'),
                    ));
                  }
                },
                child: const Text('Kirim Permohonan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

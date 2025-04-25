import 'package:flutter/material.dart';

class FormSKScreen extends StatefulWidget {
  const FormSKScreen({super.key});

  @override
  State<FormSKScreen> createState() => _FormSKScreenState();
}

class _FormSKScreenState extends State<FormSKScreen> {
  final _formKey = GlobalKey<FormState>();
  final namaController = TextEditingController();
  final nikController = TextEditingController();
  final keperluanController = TextEditingController();
  final alamatController = TextEditingController();
  final catatanController = TextEditingController();

  String jenisSurat = 'Domisili';

  final List<String> listJenisSurat = [
    'Domisili',
    'Belum Menikah',
    'Usaha',
    'Tidak Mampu',
    'Kehilangan',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Surat Keterangan')),
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
              DropdownButtonFormField<String>(
                value: jenisSurat,
                decoration:
                    const InputDecoration(labelText: 'Jenis Surat Keterangan'),
                items: listJenisSurat
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    jenisSurat = value!;
                  });
                },
              ),
              TextFormField(
                controller: keperluanController,
                decoration: const InputDecoration(labelText: 'Keperluan'),
                validator: (value) =>
                    value!.isEmpty ? 'Keperluan harus diisi' : null,
              ),
              TextFormField(
                controller: alamatController,
                decoration: const InputDecoration(labelText: 'Alamat'),
                validator: (value) =>
                    value!.isEmpty ? 'Alamat tidak boleh kosong' : null,
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
                      content: Text('Pengajuan Surat Keterangan berhasil dikirim'),
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

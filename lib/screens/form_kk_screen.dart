import 'package:flutter/material.dart';

class FormKKScreen extends StatefulWidget {
  const FormKKScreen({super.key});

  @override
  _FormKKScreenState createState() => _FormKKScreenState();
}

class _FormKKScreenState extends State<FormKKScreen> {
  final _formKey = GlobalKey<FormState>();

  final namaKepalaController = TextEditingController();
  final nikKepalaController = TextEditingController();
  final alamatController = TextEditingController();
  final jumlahAnggotaController = TextEditingController();

  String alasan = 'Baru';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Pengajuan KK')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: namaKepalaController,
                decoration: const InputDecoration(labelText: 'Nama Kepala Keluarga'),
                validator: (value) =>
                    value!.isEmpty ? 'Nama tidak boleh kosong' : null,
              ),
              TextFormField(
                controller: nikKepalaController,
                decoration: const InputDecoration(labelText: 'NIK Kepala Keluarga'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.length != 16 ? 'NIK harus 16 digit' : null,
              ),
              TextFormField(
                controller: alamatController,
                decoration: const InputDecoration(labelText: 'Alamat'),
                validator: (value) =>
                    value!.isEmpty ? 'Alamat tidak boleh kosong' : null,
              ),
              TextFormField(
                controller: jumlahAnggotaController,
                decoration:
                    const InputDecoration(labelText: 'Jumlah Anggota Keluarga'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? 'Jumlah anggota wajib diisi' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: alasan,
                decoration: const InputDecoration(labelText: 'Alasan Pengajuan'),
                items: ['Baru', 'Perubahan', 'Hilang']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) => setState(() {
                  alasan = value!;
                }),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Pengajuan KK berhasil dikirim'),
                    ));
                  }
                },
                child: const Text('Kirim Permohonan'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

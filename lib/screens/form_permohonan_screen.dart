import 'package:flutter/material.dart';

class FormPermohonanScreen extends StatefulWidget {
  @override
  State<FormPermohonanScreen> createState() => _FormPermohonanScreenState();
}

class _FormPermohonanScreenState extends State<FormPermohonanScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController namaController = TextEditingController();
  final TextEditingController nikController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();

  String alasan = 'Hilang';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Pengajuan KTP')),
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
                controller: alamatController,
                decoration: InputDecoration(labelText: 'Alamat'),
                validator: (value) =>
                    value!.isEmpty ? 'Alamat tidak boleh kosong' : null,
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: alasan,
                decoration: InputDecoration(labelText: 'Alasan Pengajuan'),
                items: ['Hilang', 'Rusak', 'Baru']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) => setState(() {
                  alasan = value!;
                }),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // sementara hanya tampilkan snackbar
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Pengajuan KTP berhasil dikirim'),
                    ));
                  }
                },
                child: Text('Kirim Permohonan'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

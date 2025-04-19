import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();

  String nama = 'Ahmad Subekti';
  String nik = '3504xxxxxxxx';
  String email = 'ahmad@example.com';
  String alamat = 'Desa Wonokerto';

  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _image = File(picked.path);
      });
    }
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // TODO: Kirim data ke backend
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profil berhasil diperbarui')),
      );
    }
  }
  void _logout() async {
    // TODO: Hapus token dari SharedPreferences kalau kamu pakai
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.remove('token');

    // Navigasi ke halaman login
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage:
                    _image != null ? FileImage(_image!) : null,
                child: _image == null ? const Icon(Icons.camera_alt, size: 40) : null,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: nama,
              decoration: const InputDecoration(labelText: 'Nama'),
              onSaved: (value) => nama = value!,
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: nik,
              decoration: const InputDecoration(labelText: 'NIK'),
              readOnly: true,
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: email,
              decoration: const InputDecoration(labelText: 'Email'),
              readOnly: true,
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: alamat,
              decoration: const InputDecoration(labelText: 'Alamat'),
              onSaved: (value) => alamat = value!,
            ),
            const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveProfile,
                child: const Text('Simpan Perubahan'),
              ),
            const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: _logout,
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
            ),
          ],
        ),
      ),
    );
  }
}

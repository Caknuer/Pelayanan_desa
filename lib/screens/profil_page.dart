import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  // Dummy data
  String name = 'Ahmad Sulaiman';
  String email = 'ahmad@mail.com';
  String phone = '08123456789';

  // Untuk form edit
  bool isEditing = false;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: name);
    emailController = TextEditingController(text: email);
    phoneController = TextEditingController(text: phone);
  }

  void _toggleEdit() {
    setState(() {
      if (isEditing) {
        if (_formKey.currentState!.validate()) {
          name = nameController.text;
          email = emailController.text;
          phone = phoneController.text;
          isEditing = false;
        }
      } else {
        isEditing = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
  padding: const EdgeInsets.all(20),
  child: Form(
    key: _formKey,
    child: Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: Icon(isEditing ? Icons.save : Icons.edit, color: theme.primaryColor),
            onPressed: _toggleEdit,
          ),
        ),
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/profil.jpeg'),
        ),
        const SizedBox(height: 24),
        _buildTextField("Nama", nameController, enabled: isEditing),
        const SizedBox(height: 16),
        _buildTextField("Email", emailController, enabled: isEditing),
        const SizedBox(height: 16),
        _buildTextField("Nomor HP", phoneController, enabled: isEditing),
      ],
    ),
  ),
);

  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool enabled = false}) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      validator: (value) {
        if (value == null || value.isEmpty) return '$label tidak boleh kosong';
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.poppins(),
        border: const OutlineInputBorder(),
      ),
    );
  }
}

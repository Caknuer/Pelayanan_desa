import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:pelayanan_desa/screens/profil_page.dart';
import 'package:pelayanan_desa/screens/chat_page.dart';
import 'riwayat_screen.dart';
import 'package:pelayanan_desa/routes/app_routes.dart';
import 'package:pelayanan_desa/screens/profil_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeContent(), // halaman utama desa
    RiwayatScreen(),       // dummy riwayat
    const ChatDetailPage(), // dummy chat
    const ProfileScreen(), // halaman profil yang kita buat
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // <- tambahkan baris ini
        backgroundColor: theme.primaryColor,
        elevation: 0,
        title: Text(
          _getTitle(_currentIndex),
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: theme.primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }

  String _getTitle(int index) {
    switch (index) {
      case 0:
        return 'Beranda';
      case 1:
        return 'Riwayat';
      case 2:
        return 'Chat';
      case 3:
        return 'Profil';
      default:
        return '';
    }
  }
}

// Halaman konten utama Beranda
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Halo, Warga Wonokerto!",
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 238, 175, 38),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/ban.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            "Pelayanan Desa",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildServiceCard(
                  context,
                  icon: Icons.credit_card,
                  label: 'Pengajuan KTP',
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.formKTP);
                  },
                ),
                _buildServiceCard(
                  context,
                  icon: Icons.group,
                  label: 'Pengajuan KK',
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.formKK);
                  },
                ),
                _buildServiceCard(
                  context,
                  icon: Icons.description,
                  label: 'Surat Keterangan',
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.formSK);
                  },
                ),
                _buildServiceCard(
                  context,
                  icon: Icons.gavel,
                  label: 'Pengajuan SKCK',
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.formSKCK);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Theme.of(context).primaryColor),
              const SizedBox(height: 12),
              Text(
                label,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

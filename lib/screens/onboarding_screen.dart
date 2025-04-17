import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _pageIndex = 0;

  List<Map<String, String>> onboardingData = [
    {
      'title': 'Pelayanan Cepat & Mudah',
      'description':
          'Ajukan KTP, KK, SKCK, dan surat lainnya langsung dari genggaman tanganmu.',
      'image': 'assets/onbo1.png', // ganti sesuai gambar kamu
      'bg': '0xFFDFF8C3',
    },
    {
      'title': 'Transparansi & Efisiensi',
      'description':
          'Proses pelayanan lebih cepat, transparan, dan tanpa antre.',
      'image': 'assets/onbo2.png',
      'bg': '0xFFFFE8A3',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: onboardingData.length,
        onPageChanged: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        itemBuilder: (context, index) => Container(
          color: Color(int.parse(onboardingData[index]['bg']!)),
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  onboardingData[index]['image']!,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 30),
              Text(
                onboardingData[index]['title']!,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              Text(
                onboardingData[index]['description']!,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  if (_pageIndex == onboardingData.length - 1) {
                    // Ganti ke halaman utama
                    Navigator.pushReplacementNamed(context, '/login');
                  } else {
                    _controller.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  }
                },
                child: Text(_pageIndex == onboardingData.length - 1
                    ? 'Mulai'
                    : 'Berikutnya'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RiwayatScreen extends StatelessWidget {
  final List<Map<String, String>> riwayatDummy = [
    {
      'jenis': 'Pengajuan KTP',
      'tanggal': '2025-04-14',
      'status': 'Diproses',
    },
    {
      'jenis': 'Pengajuan KK',
      'tanggal': '2025-04-10',
      'status': 'Selesai',
    },
    {
      'jenis': 'Pengajuan SKCK',
      'tanggal': '2025-04-08',
      'status': 'Ditolak',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Pengajuan')),
      body: ListView.builder(
        itemCount: riwayatDummy.length,
        itemBuilder: (context, index) {
          final item = riwayatDummy[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Icon(Icons.article, color: Colors.blue),
              title: Text(item['jenis']!),
              subtitle: Text('Tanggal: ${item['tanggal']}'),
              trailing: Text(
                item['status']!,
                style: TextStyle(
                  color: item['status'] == 'Selesai'
                      ? Colors.green
                      : item['status'] == 'Ditolak'
                          ? Colors.red
                          : Colors.orange,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

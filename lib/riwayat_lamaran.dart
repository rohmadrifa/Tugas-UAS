import 'dart:math';
import 'package:flutter/material.dart';
import 'data.dart'; // Impor data.dart di mana ApplicationHistory didefinisikan

class RiwayatLamaranPage extends StatelessWidget {
  final List<ApplicationHistory> applicationHistory;

  RiwayatLamaranPage({required this.applicationHistory});

  // Fungsi untuk mendapatkan warna berdasarkan status lamaran
  Color getStatusColor(String status) {
    return status == 'Diterima' ? Colors.green : Colors.red;
  }

  // Fungsi untuk mendapatkan status secara acak
  String getRandomStatus() {
    // Daftar status yang mungkin
    List<String> statusList = ['Menunggu Keputusan'];

    // Mengambil status secara acak dari daftar
    return statusList[Random().nextInt(statusList.length)];
  }

  @override
  Widget build(BuildContext context) {
    // Mengisi status secara random pada data riwayat lamaran
    applicationHistory.forEach((history) {
      history.status = getRandomStatus();
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Lamaran Kerja'),
      ),
      body: ListView.builder(
        itemCount: applicationHistory.length,
        itemBuilder: (context, index) {
          final history = applicationHistory[index];
          return ListTile(
            title: Text(history.jobTitle),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${history.company}\n${history.dateApplied}'),
                Text(
                  'Status: ${history.status}', // Tampilkan status lamaran
                  style: TextStyle(
                    color: getStatusColor(
                        history.status), // Gunakan warna berdasarkan status
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

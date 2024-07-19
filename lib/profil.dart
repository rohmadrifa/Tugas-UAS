import 'package:flutter/material.dart';
import 'riwayat_lamaran.dart';
import 'data.dart'; // Import file yang berisi data pengguna

class ProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Saya'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage('images/logopt.jpeg'), // Tambahkan gambar profil
            ),
            SizedBox(height: 20),
            Text(
              'Nama:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              currentUser.name, // Gunakan data pengguna
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Email:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              currentUser.email, // Gunakan data pengguna
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Lokasi:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              currentUser.location, // Gunakan data pengguna
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RiwayatLamaranPage(applicationHistory: currentUser.applicationHistory,
                    ),
                  ),
                );
              },
              child: Text('Lihat Riwayat Lamaran Kerja'),
            ),
          ],
        ),
      ),
    );
  }
}

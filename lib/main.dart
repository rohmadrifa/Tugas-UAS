import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lowongan_app/data.dart';
import 'package:lowongan_app/home.dart';
import 'package:lowongan_app/profil.dart';
import 'package:lowongan_app/riwayat_lamaran.dart';
import 'login.dart';
import 'lamarkerja.dart' as lamarKerja;
import 'tipscv.dart';
import 'data.dart'; 

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('userBox');
  await Hive.openBox('jobBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black87,
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        fontFamily: 'Roboto',
      ),
      initialRoute: '/login', // Ganti initialRoute ke '/login'
      routes: {
        '/login': (context) => LoginPage(), // Definisikan rute '/login'
        '/home': (context) => HomePage(), // Definisikan rute '/home'
        '/lamar-kerja': (context) => lamarKerja.LamarKerjaPage(),
        '/tips-cv': (context) => TipsCVPage(), 
        '/profil': (context) => ProfilPage(),
        '/riwayat-lamaran': (context) => RiwayatLamaranPage(applicationHistory: currentUser.applicationHistory), // Menambahkan rute profil
         // Menambahkan rute riwayat
      },
    );
  }
}

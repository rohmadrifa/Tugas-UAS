import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedLocation = '';
  String selectedIndustry = '';
  String selectedRole = '';

  // Definisi list lowongan secara langsung di dalam _HomePageState
  List<Lowongan> lowongan = [
    Lowongan(
      judul: 'Frontend Developer',
      deskripsi: 'Bertanggung jawab dalam mengembangkan aplikasi frontend.',
      detail:
          'Kualifikasi:\n- Pengalaman kerja sebagai frontend developer minimal 2 tahun.\n- Memiliki kemampuan dalam menggunakan Flutter atau React Native.',
      lokasi: 'Jakarta',
      industri: 'Teknologi',
      imagePath: 'images/logopt.jpeg', // Tambahkan path gambar
    ),
    Lowongan(
      judul: 'Data Scientist',
      deskripsi: 'Menganalisis data untuk menghasilkan informasi yang berguna.',
      detail:
          'Kualifikasi:\n- Lulusan S2 jurusan Ilmu Komputer atau Statistik.\n- Memiliki pengalaman dalam pengolahan data menggunakan Python dan SQL.',
      lokasi: 'Bandung',
      industri: 'Keuangan',
      imagePath: 'images/logopt.jpeg', // Tambahkan path gambar
    ),
    Lowongan(
      judul: 'UI/UX Designer',
      deskripsi:
          'Merancang tata letak dan elemen visual untuk memaksimalkan pengalaman pengguna.',
      detail:
          'Kualifikasi:\n- Pengalaman dalam merancang antarmuka pengguna minimal 3 tahun.\n- Memiliki portofolio desain yang kuat.',
      lokasi: 'Surabaya',
      industri: 'Desain',
      imagePath: 'images/logopt.jpeg', // Tambahkan path gambar
    ),
    Lowongan(
      judul: 'Digital Marketing Specialist',
      deskripsi:
          'Mengelola kampanye pemasaran digital untuk meningkatkan visibilitas.',
      detail:
          'Kualifikasi:\n- Pengalaman dalam strategi pemasaran digital minimal 2 tahun.\n- Memiliki pemahaman yang kuat dalam SEO dan analitik web.',
      lokasi: 'Jakarta',
      industri: 'Pemasaran',
      imagePath: 'images/logopt.jpeg', // Tambahkan path gambar
    ),
    Lowongan(
      judul: 'Back-end Developer',
      deskripsi:
          'Bertanggung jawab atas pengembangan server dan logika aplikasi.',
      detail:
          'Kualifikasi:\n- Pengalaman kerja sebagai backend developer minimal 2 tahun.\n- Memiliki pemahaman yang kuat dalam bahasa pemrograman seperti Python atau Java.',
      lokasi: 'Bandung',
      industri: 'Teknologi',
      imagePath: 'images/logopt.jpeg', // Tambahkan path gambar
    ),
    Lowongan(
      judul: 'Human Resources Manager',
      deskripsi: 'Mengelola rekrutmen, pelatihan, dan kesejahteraan karyawan.',
      detail:
          'Kualifikasi:\n- Pengalaman dalam manajemen sumber daya manusia minimal 5 tahun.\n- Memiliki pengetahuan yang baik tentang undang-undang ketenagakerjaan.',
      lokasi: 'Jakarta',
      industri: 'SDM',
      imagePath: 'images/logopt.jpeg', // Tambahkan path gambar
    ),
    Lowongan(
      judul: 'Accountant',
      deskripsi:
          'Bertanggung jawab atas pencatatan keuangan dan laporan keuangan.',
      detail:
          'Kualifikasi:\n- Gelar sarjana di bidang akuntansi atau keuangan.\n- Memiliki pengalaman dalam pengelolaan keuangan perusahaan.',
      lokasi: 'Surabaya',
      industri: 'Keuangan',
      imagePath: 'images/logopt.jpeg', // Tambahkan path gambar
    ),
    Lowongan(
      judul: 'Sales Manager',
      deskripsi: 'Mengelola tim penjualan dan mencapai target penjualan.',
      detail:
          'Kualifikasi:\n- Pengalaman dalam manajemen penjualan minimal 3 tahun.\n- Memiliki kemampuan komunikasi dan negosiasi yang baik.',
      lokasi: 'Bandung',
      industri: 'Penjualan',
      imagePath: 'images/logopt.jpeg', // Tambahkan path gambar
    ),
    Lowongan(
      judul: 'Content Writer',
      deskripsi:
          'Menulis konten yang menarik untuk media sosial dan situs web.',
      detail:
          'Kualifikasi:\n- Kemampuan menulis yang baik dengan gaya yang menarik.\n- Memiliki pemahaman yang baik tentang SEO dan tren konten.',
      lokasi: 'Jakarta',
      industri: 'Konten',
      imagePath: 'images/logopt.jpeg', // Tambahkan path gambar
    ),
    Lowongan(
      judul: 'Customer Service Representative',
      deskripsi:
          'Memberikan layanan pelanggan yang berkualitas dan menangani keluhan.',
      detail:
          'Kualifikasi:\n- Kemampuan komunikasi yang baik dalam bahasa Inggris.\n- Memiliki pengalaman dalam layanan pelanggan atau bidang terkait.',
      lokasi: 'Surabaya',
      industri: 'Layanan Pelanggan',
      imagePath: 'images/logopt.jpeg', // Tambahkan path gambar
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kerja Kita'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(
                  context, '/login'); // Ubah rute ke '/login'
            },
          ),
          IconButton(
            icon: Icon(Icons.lightbulb_outline), // Tombol Tips CV
            onPressed: () {
              Navigator.pushNamed(context, '/tips-cv');
            },
          ),
          IconButton(
            icon: Icon(Icons.person), // Tambahkan ikon profil
            onPressed: () {
              Navigator.pushNamed(
                  context, '/profil'); // Navigasi ke halaman profil
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Text(
                  'Cari pekerjaan yang kamu impikan di KerjaKita!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                _buildFilters(),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: 20),
                  _buildJobList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilters() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Cari Pekerjaan',
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (value) {
            setState(() {
              selectedRole = value; // Update filter based on search query
            });
          },
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            // Apply filters
          },
          child: Text('Terapkan Filter'),
        ),
      ],
    );
  }

  Widget _buildJobList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: _filteredLowongan().map((job) {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Image.asset(
                job.imagePath, // Path gambar
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      job.judul,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(job.deskripsi),
                    SizedBox(height: 10),
                    Text(
                      'Lokasi: ${job.lokasi}',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    Text(
                      'Industri: ${job.industri}',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailLowonganPage(lowongan: job),
                          ),
                        );
                      },
                      child: Text('Lihat Detail'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  List<Lowongan> _filteredLowongan() {
    return lowongan.where((job) {
      final matchLocation =
          job.lokasi.toLowerCase().contains(selectedLocation.toLowerCase());
      final matchIndustry =
          job.industri.toLowerCase().contains(selectedIndustry.toLowerCase());
      final matchRole =
          job.judul.toLowerCase().contains(selectedRole.toLowerCase());
      return matchLocation && matchIndustry && matchRole;
    }).toList();
  }
}

class DetailLowonganPage extends StatelessWidget {
  final Lowongan lowongan;

  DetailLowonganPage({required this.lowongan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lowongan.judul),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              lowongan.imagePath, // Tampilkan gambar
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              lowongan.judul,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(lowongan.deskripsi),
            SizedBox(height: 10),
            Text(
              lowongan.detail,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Tambahkan lamaran ke riwayat
                currentUser.applicationHistory.add(ApplicationHistory(
                  jobTitle: lowongan.judul,
                  company: 'Nama Perusahaan', // Ganti dengan data yang sesuai
                  dateApplied: DateTime.now().toString(), status: '',
                ));
                Navigator.pushNamed(context, '/lamar-kerja');
              },
              child: Text('Lamar Pekerjaan'),
            ),
          ],
        ),
      ),
    );
  }
}

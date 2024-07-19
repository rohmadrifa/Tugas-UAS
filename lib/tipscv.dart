// tipscv.dart

import 'package:flutter/material.dart';

class TipsCVPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tips CV'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Tips untuk Membuat CV yang Menarik',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            _buildTipCard(
              'Gunakan Format yang Jelas',
              'Pilih format CV yang mudah dibaca dan fokuskan pada pengalaman dan keterampilan relevan.',
            ),
            _buildTipCard(
              'Highlight Pencapaian Anda',
              'Jelaskan pencapaian dan proyek yang Anda kerjakan, termasuk dampaknya terhadap perusahaan atau proyek.',
            ),
            _buildTipCard(
              'Perhatikan Tata Bahasa dan Ejaan',
              'Pastikan CV Anda bebas dari kesalahan tata bahasa dan ejaan untuk kesan yang profesional.',
            ),
            _buildTipCard(
              'Sesuaikan dengan Posisi yang Dilamar',
              'Sesuaikan konten CV Anda dengan persyaratan pekerjaan yang dilamar untuk meningkatkan peluang diterima.',
            ),
            _buildTipCard(
              'Sertakan Informasi Kontak yang Jelas',
              'Pastikan informasi kontak Anda mudah ditemukan, seperti nomor telepon dan alamat email yang aktif.',
            ),
            SizedBox(height: 20),
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth >= 600) {
                  // Desktop layout: 2 images per row
                  return GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      _buildImageCard(
                        context,
                        'images/contohcvats.jpg',
                        'Contoh Penulisan CV ATS Friendly',
                      ),
                      _buildImageCard(
                        context,
                        'images/contohsuratlmr.jpg',
                        'Contoh Surat Lamaran',
                      ),
                    ],
                  );
                } else {
                  // Mobile layout: 1 image per row
                  return Column(
                    children: [
                      _buildImageCard(
                        context,
                        'images/contohcvats.jpg',
                        'Contoh Penulisan CV ATS Friendly',
                      ),
                      SizedBox(height: 20),
                      _buildImageCard(
                        context,
                        'images/contohsuratlmr.jpg',
                        'Contoh Surat Lamaran',
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipCard(String title, String description) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageCard(BuildContext context, String imagePath, String title) {
    return GestureDetector(
      onTap: () {
        _showImageDialog(context, imagePath);
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover, // fit the image inside the card
                height: 200,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.blue,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showImageDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.all(20),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.contain, // fit the image inside the dialog
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

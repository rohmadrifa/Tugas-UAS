// data.dart
class User {
  final String name;
  final String email;
  final String location;
  List<ApplicationHistory> applicationHistory;

  User({
    required this.name,
    required this.email,
    required this.location,
    required this.applicationHistory,
  });
}

enum ApplicationStatus {
  diterima,
  tidakDiterima,
}

class ApplicationHistory {
  String jobTitle;
  String company;
  String dateApplied;
  String status; // Hapus final agar bisa diubah

  ApplicationHistory({
    required this.jobTitle,
    required this.company,
    required this.dateApplied,
    required this.status,
  });
}

// Contoh pengguna
User currentUser = User(
  name: 'Nama Pengguna',
  email: 'email@example.com',
  location: 'Jakarta, Indonesia',
  applicationHistory: [],
);

class Lowongan {
  final String judul;
  final String deskripsi;
  final String detail;
  final String lokasi;
  final String industri;
  final String imagePath; // Properti untuk path gambar

  Lowongan({
    required this.judul,
    required this.deskripsi,
    required this.detail,
    required this.lokasi,
    required this.industri,
    required this.imagePath, // Inisialisasi path gambar
  });
}

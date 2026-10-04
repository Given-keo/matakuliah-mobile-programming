
// Bikin status buat nandain bukunya lagi ada atau udah dipinjam orang
enum StatusBuku { tersedia, dipinjam }

class Buku {
  String idBuku;
  String judul;
  StatusBuku status;

  Buku(this.idBuku, this.judul, this.status);
}

class Anggota {
  String idAnggota;
  String nama;
  List<Buku> daftarPinjaman;

  Anggota(this.idAnggota, this.nama, this.daftarPinjaman);
}

// Nyimpen data buku awal, semuanya di-set tersedia dulu
final List<Buku> dataBuku = [
  Buku('B1', 'Belajar Dart dari Nol', StatusBuku.tersedia),
  Buku('B2', 'Cara Bikin Kopi', StatusBuku.tersedia),
  Buku('B3', 'Komik Detective Conan', StatusBuku.tersedia),
  Buku('B4', 'Buku Tulis Kosong', StatusBuku.tersedia),
];

// Nyimpen data anggotanya. Daftar pinjaman awalnya kosong []
final List<Anggota> dataAnggota = [
  Anggota('A1', 'Andi', []),
  Anggota('A2', 'Budi', []),
];

// satu function = satu tugas, beri komentar BR yang diimplementasikan

// 1. Fungsi cari anggota (buat nyocokin ID yang diketik sama data di List)
Anggota? cariAnggota(String id) {
  for (int i = 0; i < dataAnggota.length; i++) {
    if (dataAnggota[i].idAnggota == id) {
      return dataAnggota[i];
    }
  }
  return null; // kalo ngga ketemu balikin null
}

// 2. Fungsi cari buku (sama kayak cari anggota pake for loop biasa)
Buku? cariBuku(String id) {
  for (int i = 0; i < dataBuku.length; i++) {
    if (dataBuku[i].idBuku == id) {
      return dataBuku[i];
    }
  }
  return null;
}

// 3. Fungsi ngecek BR-01: Maksimal pinjam 3 buku
bool bisaPinjamLagi(Anggota orang) {
  // Kalau jumlah bukunya udah 3 atau lebih, ngga boleh pinjam lagi
  if (orang.daftarPinjaman.length >= 3) {
    return false;
  } else {
    return true;
  }
}

// 4. Fungsi ngecek BR-02: Buku yang sedang dipinjam tidak bisa dipinjam
bool bukuBisaDipinjam(Buku bukuYangDipilih) {
  // Ngecek statusnya, kalo lagi dipinjam ya ga bisa
  if (bukuYangDipilih.status == StatusBuku.dipinjam) {
    return false;
  } else {
    return true;
  }
}

// 5. Fungsi hitung denda BR-03: Denda Rp1.000 per hari keterlambatan
int hitungDenda(int telatBerapaHari) {
  int totalDenda = 0; // awalnya 0
  if (telatBerapaHari > 0) {
    totalDenda = telatBerapaHari * 1000;
  }
  return totalDenda;
}

// ---------- ALGORITHM ----------
// proses utama, urutannya sesuai pseudocode

// Proses pas ada orang dateng mau pinjam buku
void prosesPinjamBuku(String idAnggota, String idBuku) {
  print('\n>>> Info: Anggota $idAnggota mau pinjam buku $idBuku');

  Anggota? orangnya = cariAnggota(idAnggota);
  Buku? bukunya = cariBuku(idBuku);

  // Cek dulu, ID nya bener apa ngga
  if (orangnya == null) {
    print('Gagal: Anggotanya ngga ketemu nih.');
  } else if (bukunya == null) {
    print('Gagal: Bukunya ngga ada di data perpustakaan.');
  } else {
    // Kalo ketemu, cek aturan 2 dulu (BR-02)
    bool bolehDipinjam = bukuBisaDipinjam(bukunya);
    if (bolehDipinjam == false) {
      print(
        'Gagal (BR-02): Yah, buku "${bukunya.judul}" lagi dipinjem orang lain.',
      );
    } else {
      // Kalo bukunya ada, cek aturan 1: Udah kebanyakan pinjam belum? (BR-01)
      bool kuotaMasihAda = bisaPinjamLagi(orangnya);
      if (kuotaMasihAda == false) {
        print(
          'Gagal (BR-01): Maaf ${orangnya.nama}, kamu udah pinjam 3 buku. Balikin dulu ya.',
        );
      } else {
        // Kalo lolos semua syarat, baru kita proses pinjam
        bukunya.status = StatusBuku.dipinjam; // ubah status bukunya
        orangnya.daftarPinjaman.add(bukunya); // tambahin ke tas si anggota
        print(
          'Sukses: ${orangnya.nama} berhasil meminjam buku "${bukunya.judul}".',
        );
      }
    }
  }
}

// Proses pas orang dateng mau balikin buku
void prosesBalikBuku(String idAnggota, String idBuku, int hariTelat) {
  print(
    '\n>>> Info: Anggota $idAnggota ngembaliin buku $idBuku. Telat: $hariTelat hari.',
  );

  Anggota? orangnya = cariAnggota(idAnggota);
  Buku? bukunya = cariBuku(idBuku);

  if (orangnya != null && bukunya != null) {
    // Keluarin bukunya dari list pinjaman si anggota
    orangnya.daftarPinjaman.remove(bukunya);
    // Balikin status bukunya jadi tersedia
    bukunya.status = StatusBuku.tersedia;

    // Cek ada denda ngga? (BR-03)
    int denda = hitungDenda(hariTelat);
    if (denda > 0) {
      print(
        'Sukses (BR-03): Buku "${bukunya.judul}" dikembalikan. Tapi kena denda Rp$denda karena telat.',
      );
    } else {
      print(
        'Sukses: Buku "${bukunya.judul}" dikembalikan tepat waktu. Ngga ada denda.',
      );
    }
  }
}

// test kodenya
void main() {
  print('=== TEST SISTEM PERPUSTAKAAN ===');

  prosesPinjamBuku('A1', 'B1');
  prosesPinjamBuku('A2', 'B1');
  prosesPinjamBuku('A1', 'B2');
  prosesPinjamBuku('A1', 'B3');
  prosesPinjamBuku('A1', 'B4');
  prosesBalikBuku('A1', 'B2', 0);
  prosesBalikBuku('A1', 'B1', 4);
}

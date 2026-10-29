// 1. ABSTRACTION
// Pakai enum biar statusnya udah pasti (biar gak typo nulis "redy" atau "sewa")
enum StatusSewa { ready, disewa, rusak }

// Model / cetakan data buat unit PS
class Console {
  final String id;
  final String tipe;
  StatusSewa status;

  Console({
    required this.id,
    required this.tipe,
    this.status = StatusSewa.ready, // kalau gak diisi, otomatis ready
  });
}

// 2. DECOMPOSITION
// Function khusus ngitung harga. Pakai named parameter ({ }) biar gak ketuker pas dipanggil
int hitungTagihan({required int jam, required int hargaPerJam}) {
  int total = jam * hargaPerJam;

  // Diskon 5rb kalau main minimal 3 jam
  if (jam >= 3) {
    return total - 5000;
  }
  return total;
}

void main() {
  // --- Data Awal ---
  List<Console> daftarPs = [
    Console(id: 'P01', tipe: 'PS 4 Slim'),
    Console(id: 'P02', tipe: 'PS 5', status: StatusSewa.disewa),
    Console(id: 'P03', tipe: 'PS 4 Pro'),
  ];

  // 3. PATTERN RECOGNITION
  // Ambil PS yang nganggur aja tanpa bikin looping manual
  var psNganggur = daftarPs
      .where((ps) => ps.status == StatusSewa.ready)
      .toList();

  // Cek sekilas, ada PS 5 yang kosong gak
  bool adaPs5 = psNganggur.any((ps) => ps.tipe == 'PS 5');
  print('PS 5 ready? $adaPs5'); // Output: false

  // 4. ALGORITHM & BUSINESS RULES
  int duitBawaan = 20000;
  int mauMainBerapaJam = 3;

  // Cek dulu, ada PS yang kosong gak? Kalau penuh, stop di sini
  if (psNganggur.isEmpty) {
    print('Gagal: Yah, PS lagi penuh semua bos.');
    return;
  }

  // Hitung total bayar lewat function
  int tagihan = hitungTagihan(jam: mauMainBerapaJam, hargaPerJam: 8000);

  // Cek uangnya cukup gak? Kalau kurang, stop
  if (duitBawaan < tagihan) {
    print('Gagal: Duit kurang. Tagihannya $tagihan');
    return;
  }

  // Kalau semua syarat lolos, transaksi berhasil
  Console psYangDipake = psNganggur.first;
  psYangDipake.status = StatusSewa.disewa; // tandai PS udah dipakai

  print('Berhasil: Gas main di ${psYangDipake.tipe}!');
  print('Kembalian: Rp${duitBawaan - tagihan}');
}

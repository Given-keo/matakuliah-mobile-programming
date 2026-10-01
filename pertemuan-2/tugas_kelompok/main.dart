// enum untuk jenis kendaraan
enum JenisKendaraan { motor, mobil }

int hitungTotalJam(int durasiMenit) {
  int jam = durasiMenit ~/ 60;
  int sisaMenit = durasiMenit % 60;

  // kalau ada sisa menit dibulatkan keatas
  if (sisaMenit > 0) {
    jam = jam + 1;
  }

  // kalau durasi di bawah 1 jam, tetap dihitung 1 jam
  if (jam < 1) {
    return 1;
  }

  return jam;
  
}

// bikin function buat hitung tarif berdasarkan jenis kendaraan dan total jam
int hitungTarif(JenisKendaraan jenis, int totalJam) {
  int tarif = 0;

  switch (jenis) {
    case JenisKendaraan.motor:
      tarif = 2000 + ((totalJam - 1) * 1000);
      break;
    case JenisKendaraan.mobil:
      tarif = 5000 + ((totalJam - 1) * 3000);
      break;
  }

  return tarif;
}

// Hitungan jam dan tarif
int hitungTotalParkir(JenisKendaraan jenis, int durasiMenit) {
  int totalJam = hitungTotalJam(durasiMenit);
  int totalBayar = hitungTarif(jenis, totalJam);

  return totalBayar;
}

void main() {
  print(hitungTotalParkir(JenisKendaraan.motor, 30));
  print(hitungTotalParkir(JenisKendaraan.motor, 150));
  print(hitungTotalParkir(JenisKendaraan.mobil, 60));
  print(hitungTotalParkir(JenisKendaraan.mobil, 181));
}

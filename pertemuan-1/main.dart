void main() {
  // data barang
  String namaBarang = 'Jersey Futsal';
  int jumlahBarang = 2;
  double hargaBarang = 85000.0;
  bool tersedia = true;

  print(namaBarang);
  print(jumlahBarang);
  print(hargaBarang);
  print(tersedia);

  // gabung teks dengan variabel
  print('Saya membeli $namaBarang sebanyak $jumlahBarang');

  // data yang boleh kosong
  String? catatan = 'Ukuran L';
  print(catatan);

  catatan = null;
  print(catatan);

  // memberikan teks jika data null
  String hasilCatatan = catatan ?? 'Tidak ada catatan';
  print(hasilCatatan);

  // late
  late String namaPembeli;
  namaPembeli = 'Given';
  print(namaPembeli);

  // final
  final String nomorPesanan = 'ORD-001';
  print(nomorPesanan);

  // const
  const String namaToko = 'Sport Store';
  print(namaToko.toUpperCase());

  // hitungan sederhana
  int harga = 85000;
  int ongkir = 10000;

  print(harga + ongkir);

  // list
  List<String> daftarBarang = ['Jersey', 'Celana Futsal', 'Sepatu'];

  daftarBarang.add('Kaos Kaki');
  print(daftarBarang);

  // set
  Set<String> kategori = {'Baju', 'Sepatu', 'Baju'};

  print(kategori);

  // map
  Map<String, dynamic> dataPembeli = {
    'Nama': 'Raka',
    'Umur': 20,
    'JumlahBarang': 2,
    'TotalBayar': 180000.0,
    'Member': true,
  };

  print(dataPembeli);
}

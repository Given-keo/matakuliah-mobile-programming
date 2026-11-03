class Mahasiswa {
  Mahasiswa({required this.nama, required this.nim, required this.usia}); // construct
  final String nama;
  final int usia;
  final int nim;
}

// class Mahasiswa {
//   Mahasiswa(this.nama, {required this.nim, required this.usia}); // construct
//   final String nama;
//   final int usia;
//   final int nim;
// }


void main() {
  print("Data Mahasiswa : ");
  final i = Mahasiswa(nama : "Given Ezra Dominic Keo", nim: 1124160003, usia: 20);
  // final i = Mahasiswa(nama: "" ,nim: 1124160003, usia: 20);
  print(i.nama);
  print(i.nim);
  print(i.usia);

}

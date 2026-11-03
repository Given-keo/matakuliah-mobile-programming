class Mahasiswa {
  Mahasiswa(this.nama, this.nim, this.usia); // construct
  final String nama;
  final int usia;
  final int nim;
}

void main() {
  print("Data Mahasiswa : ");
  final i = Mahasiswa("Given Ezra Dominic Keo", 1124160003, 20);
  print(i.nama);
  print(i.nim);
  print(i.usia);
}

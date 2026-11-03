class Kucing {
  Kucing(this.nama, this.umur); // construct
  final String nama;
  final int umur;
}


void main() {
  final i = Kucing("Oyen",2);
  print(i.nama);
  print(i.umur);
}

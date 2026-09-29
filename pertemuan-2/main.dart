String tentukanPengeluaranBelanja(double nilai) {
  if (nilai >= 90000) {
    return "boros lu, hemat sana!!!!";
  } else if (nilai >= 65000) {
    return "Hemat bodoh, jangan boros";
  } else {
    return "bagus, hemat terus";
  }
}

void main() {
  print(tentukanPengeluaranBelanja(100000));
  print(tentukanPengeluaranBelanja(70000));
  print(tentukanPengeluaranBelanja(0000));
}

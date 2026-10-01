# Ringkasan Belajar: Computational Thinking dengan Dart (Pertemuan 2)

Catatan belajar untuk memahami konsep **Computational Thinking (CT)** dan cara menerapkannya langsung ke bahasa pemrograman **Dart**.

---

## 💡 Inti Pembelajaran

Kunci utama pertemuan ini: **Jangan langsung buka editor dan asal ngoding.** 
Pahami dulu aturan main (*business rules*), pecah masalahnya, baru terjemahkan ke kode Dart menggunakan 4 pilar CT.

---

## 🧩 4 Pilar CT & Penerapannya di Dart

| Pilar CT | Penjelasan Sederhana | Wujudnya di Dart |
| :--- | :--- | :--- |
| **Abstraction** | Mengambil data yang penting saja, mengabaikan sisanya. | `Class` untuk struktur data & `Enum` untuk pilihan status yang pasti. |
| **Decomposition** | Memecah masalah besar menjadi bagian-bagian kecil. | `Function` (satu fungsi khusus mengerjakan satu tugas). |
| **Algorithm** | Urutan langkah dan logika penyelesaian masalah. | Flowchart, Pseudocode, percabangan (`if`, `switch`), dan operator. |
| **Pattern Recognition** | Mengenali pola proses yang berulang. | Perulangan (`for`, `while`) & Operasi Collection (`where`, `map`, `fold`, `any`). |

---

## 🛠️ Aturan Main & Praktik Terbaik (Best Practices)

1. **Gunakan Enum dibanding String Biasa**
   * *Kenapa?* Mengurangi risiko *typo* saat mengecek status (misal: penulisan `"ready"` vs `"redy"`).
2. **Terapkan Guard Clause (Early Return)**
   * Cek kondisi gagal/error lebih dulu di awal fungsi, lalu langsung `return`. Ini menjaga kode tetap datar dan tidak menjorok terlalu dalam akibat `if-else` bertingkat.
3. **Optimalkan Operasi Collection**
   * Manfaatkan `.where()` untuk menyaring data, `.map()` untuk merubah bentuk data, `.any()` / `.every()` untuk pengecekan cepat, dan `.fold()` untuk perhitungan total.
4. **Gunakan Named Parameter**
   * Menambahkan `{required ...}` pada parameter fungsi membuat pemanggilan fungsi lebih eksplisit dan tidak tertukar.

---

## 💻 Contoh Implementasi: Sistem Rental PS

Berikut adalah implementasi sederhana yang merangkum keempat pilar CT dalam satu file Dart:

```dart
// 1. ABSTRACTION
// Status pasti pakai enum biar gak rawan typo
enum StatusSewa { ready, disewa, rusak }

// Model / cetakan data buat unit PS
class Console {
  final String id;
  final String tipe;
  StatusSewa status;

  Console({
    required this.id,
    required this.tipe,
    this.status = StatusSewa.ready, // default kalau gak diisi
  });
}

// 2. DECOMPOSITION
// Function khusus ngitung harga (pakai named parameter)
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
  // Ambil PS yang nganggur tanpa looping manual
  var psNganggur = daftarPs
      .where((ps) => ps.status == StatusSewa.ready)
      .toList();

  // Cek sekilas, ada PS 5 yang kosong atau gak
  bool adaPs5 = psNganggur.any((ps) => ps.tipe == 'PS 5');
  print('PS 5 ready? $adaPs5'); // Output: false

  // 4. ALGORITHM & BUSINESS RULES
  int duitBawaan = 20000;
  int mauMainBerapaJam = 3;

  // Guard Clause: Cek PS kosong
  if (psNganggur.isEmpty) {
    print('Gagal: Yah, PS lagi penuh semua bos.');
    return;
  }

  // Hitung total bayar lewat function
  int tagihan = hitungTagihan(jam: mauMainBerapaJam, hargaPerJam: 8000);

  // Guard Clause: Cek uang cukup atau nggak
  if (duitBawaan < tagihan) {
    print('Gagal: Duit kurang. Tagihannya $tagihan');
    return;
  }

  // Jika semua syarat lolos
  Console psYangDipake = psNganggur.first;
  psYangDipake.status = StatusSewa.disewa; // update status

  print('Berhasil: Gas main di ${psYangDipake.tipe}!');
  print('Kembalian: Rp${duitBawaan - tagihan}');
}
# Catatan Belajar Dart: Dasar Variabel, Null Safety & Collection

Dokumentasi ini berisi ringkasan konsep-konsep dasar pemrograman bahasa **Dart** berdasarkan latihan kode pengelolaan data toko/barang olahraga.

---

## Topik yang Dipelajari

### 1. Tipe Data Dasar (Data Types)
Dart menggunakan sistem pemetaan tipe data (*type-system*) yang jelas untuk menyimpan nilai dalam variabel:

* **`String`**: Menyimpan teks/karakter (contoh: `'Jersey Futsal'`).
* **`int`**: Menyimpan bilangan bulat (contoh: `2`, `85000`).
* **`double`**: Menyimpan bilangan desimal (contoh: `85000.0`).
* **`bool`**: Menyimpan nilai kebenaran (`true` atau `false`).

---

### 2. Penggabungan Teks (*String Interpolation*)
Untuk menyisipkan nilai variabel ke dalam teks `String`, gunakan simbol `$`:

```dart
String namaBarang = 'Jersey Futsal';
int jumlahBarang = 2;

// Menggabungkan variabel ke dalam string
print('Saya membeli $namaBarang sebanyak $jumlahBarang');
```

---

### 3. *Null Safety* & *Null-aware Operator*
Dart memiliki fitur *Null Safety* untuk mencegah *error* akibat nilai yang kosong (`null`).

* **Tanda `?`**: Menandakan bahwa variabel boleh bernilai `null`.
* **Operator `??`**: Memberikan nilai bawaan (*default*) jika variabel bernilai `null`.

```dart
String? catatan = 'Ukuran L';
catatan = null; // Boleh diisi null karena menggunakan String?

// Jika catatan null, gunakan string 'Tidak ada catatan'
String hasilCatatan = catatan ?? 'Tidak ada catatan';
```

---

### 4. Kata Kunci Variabel (`late`, `final`, `const`)

| Kata Kunci | Deskripsi |
| :--- | :--- |
| **`late`** | Menunda inisialisasi nilai variabel hingga variabel tersebut pertama kali digunakan. |
| **`final`** | Nilai variabel hanya bisa diisi **satu kali** (ditentukan saat *runtime*). |
| **`const`** | Nilai bersifat konstan dan tidak pernah berubah (ditentukan saat *compile-time*). |

```dart
late String namaPembeli;
namaPembeli = 'Given'; // Diisi nanti

final String nomorPesanan = 'ORD-001'; // Tidak dapat diubah setelah diisi

const String namaToko = 'Sport Store'; // Konstan sejak awal
```

---

### 5. Koleksi Data (*Collections*)

####  `List` (Daftar Terurut)
Menyimpan sekumpulan data terurut dan diperbolehkan memiliki data duplikat.
```dart
List<String> daftarBarang = ['Jersey', 'Celana Futsal', 'Sepatu'];
daftarBarang.add('Kaos Kaki'); // Menambahkan data baru
```

####  `Set` (Kumpulan Nilai Unik)
Menyimpan sekumpulan data **tanpa urutan** dan **tidak menerima duplikat**. Jika ada data yang sama, Dart akan mengabaikannya secara otomatis.
```dart
Set<String> kategori = {'Baju', 'Sepatu', 'Baju'};
print(kategori); // Output: {'Baju', 'Sepatu'}
```

#### `Map` (Pasangan *Key-Value*)
Menyimpan data dengan format pasangan Kunci (*Key*) dan Nilai (*Value*).
```dart
Map<String, dynamic> dataPembeli = {
  'Nama': 'Raka',
  'Umur': 20,
  'JumlahBarang': 2,
  'TotalBayar': 180000.0,
  'Member': true,
};
```

---

##  Kode Lengkap

```dart
void main() {
  // Data barang
  String namaBarang = 'Jersey Futsal';
  int jumlahBarang = 2;
  double hargaBarang = 85000.0;
  bool tersedia = true;

  // String Interpolation
  print('Saya membeli $namaBarang sebanyak $jumlahBarang');

  // Null Safety
  String? catatan = 'Ukuran L';
  catatan = null;
  String hasilCatatan = catatan ?? 'Tidak ada catatan';

  // Keyword: late, final, const
  late String namaPembeli;
  namaPembeli = 'Given';

  final String nomorPesanan = 'ORD-001';
  const String namaToko = 'Sport Store';

  // Operasi Aritmatika
  int harga = 85000;
  int ongkir = 10000;
  print(harga + ongkir);

  // Collections
  List<String> daftarBarang = ['Jersey', 'Celana Futsal', 'Sepatu'];
  daftarBarang.add('Kaos Kaki');

  Set<String> kategori = {'Baju', 'Sepatu', 'Baju'};

  Map<String, dynamic> dataPembeli = {
    'Nama': 'Raka',
    'Umur': 20,
    'JumlahBarang': 2,
    'TotalBayar': 180000.0,
    'Member': true,
  };
}
```
# Computational Thinking dengan Dart (Perpustakaan)

**Nama :** Given Ezra Dominic Keo  
**NIM :** 1124160003  
**Mata Kuliah :** Computational Thinking dengan Dart  

---


## Document Analysis

### 1. Problem Statement
Membuat simulasi sistem peminjaman dan pengembalian buku di Perpustakaan.  
Ketentuan sistem:
- Setiap anggota maksimal meminjam 3 buku secara bersamaan.
- Buku yang sedang dipinjam oleh anggota lain tidak bisa dipinjam.
- Pengembalian buku yang terlambat dikenakan denda Rp1.000 per hari keterlambatan.

### 2. Actor
- **Anggota Perpustakaan**: Peminjam buku.
- **Petugas Perpustakaan**: Pengelola transaksi peminjaman dan pengembalian.

### 3. Input & Output
- **Input:**
  - `idAnggota` : ID identitas dari anggota.
  - `idBuku` : ID buku yang ingin dipinjam/dikembalikan.
  - `hariTelat` : Jumlah hari keterlambatan saat mengembalikan buku.
- **Output:**
  - Status transaksi (berhasil/gagal beserta alasannya).
  - Rincian transaksi (nama anggota, judul buku, status buku, dan denda jika ada).

### 4. Functional Requirements
1. Mencocokkan data anggota dan buku berdasarkan ID.
2. Memvalidasi ketersediaan buku (BR-02).
3. Memvalidasi limit pinjaman anggota (BR-01).
4. Memproses peminjaman (mengubah status buku & menambah ke list pinjaman).
5. Memproses pengembalian (mengubah status buku & menghapus dari list pinjaman).
6. Menghitung denda keterlambatan secara otomatis (BR-03).

### 5. Business Rules

| Kode BR | Deskripsi Business Rule |
| :--- | :--- |
| **BR-01** | Maksimal pinjam 3 buku per anggota secara bersamaan. |
| **BR-02** | Buku yang sedang dipinjam tidak bisa dipinjam oleh anggota lain. |
| **BR-03** | Pengembalian terlambat dikenakan denda sebesar Rp1.000 per hari keterlambatan. |

### 6. Decomposition
- `cariAnggota` : Mencari data anggota berdasarkan ID.
- `cariBuku` : Mencari data buku di katalog berdasarkan ID.
- `bisaPinjamLagi` : Mengecek kuota pinjaman anggota (< 3 buku) [**BR-01**].
- `bukuBisaDipinjam` : Mengecek apakah status buku tersedia [**BR-02**].
- `hitungDenda` : Menghitung denda keterlambatan (hari × 1.000) [**BR-03**].
- `prosesPinjamBuku` : Menggabungkan validasi aturan dan eksekusi peminjaman.
- `prosesBalikBuku` : Mengolah pengembalian buku dan kalkulasi denda.

### 7. Pattern Recognition
1. **Pengecekan Syarat:** Peminjaman selalu mengecek status ketersediaan buku dan limit pinjaman anggota.
2. **Perhitungan Denda:** Jika `hariTelat > 0`, denda selalu dihitung secara linear (hari × Rp1.000).
3. **Perubahan State:** Peminjaman/pengembalian selalu mengubah status buku (`tersedia`/`dipinjam`) dan memperbarui list `daftarPinjaman`.

### 8. Abstraction
- **Enum `StatusBuku`**: `tersedia`, `dipinjam`
- **Class `Buku`**: `idBuku` (String), `judul` (String), `status` (StatusBuku)
- **Class `Anggota`**: `idAnggota` (String), `nama` (String), `daftarPinjaman` (List<Buku>)

### 9. Flowchart (Text Representation)

#### a. Alur Peminjaman Buku
```text
                 [Start]
                    │
                    ▼
       [Input: idAnggota, idBuku]
                    │
                    ▼
     <Cari & Anggota Buku Data? di>
        Tidak ┌─────┴─────┐ Ya
              ▼           ▼
      [Tampilkan Error] <Buku (BR-02) Tersedia?>
              │     Tidak ┌───┴───┐ Ya
              │           ▼       ▼
              │   [Gagal: Dipinjam] <Jumlah (BR-01) 3? < Pinjaman>
              │           │   Tidak ┌─────┴─────┐ Ya
              │           │         ▼           ▼
              │           │  [Gagal: Limit] [Status = Dipinjam,
              │           │         │        Tambah ke List]
               └───────────┼─────────┴───────────┘
                           ▼
                       [Selesai]
```

#### b. Alur Pengembalian Buku
```text
                  [Start]
                     │
                     ▼
   [Input: idAnggota, idBuku, hariTelat]
                     │
                     ▼
         <Anggota & Buku Ditemukan?>
            Tidak ┌─────┴─────┐ Ya
                  ▼           ▼
          [Tampilkan Error] <Hapus Buku dari
                             |>  List Pinjaman
                             ▼
                     <Status Buku>
                     = Dipinjam
                     Tidak ┌───┴───┐ Ya
                           ▼       ▼
                  [Gagal: Buku  [Status Buku =
                              tidak dipinjam]  Tersedia,
                                  │           Hitung Denda
                                  │           (BR-03)
                                  │               │
                                  │        <Hari Telat
                                  │         > 0?>
                                  │      Tidak ┌──┴──┐ Ya
                                  │            ▼      ▼
                                  │     [Tepat   [Denda = Hari
                                  │      Waktu]  × Rp1.000]
                                  │            │      │
                                  │            └──────┼──────┘
                                  ▼                   ▼
                        [Tampilkan Error]   [Tampilkan Info
                                            Denda / Tanpa
                                                Denda]
                                            │        │
                                            └────┬───┘
                                                 ▼
                                             [Selesai]
```

---

## 10. Struktur Implementasi di Kode

### a. Data Awal (Hard-coded)

| ID Buku | Judul | Status Awal |
| :--- | :--- | :--- |
| B1 | Belajar Dart dari Nol | `tersedia` |
| B2 | Cara Bikin Kopi | `tersedia` |
| B3 | Komik Detective Conan | `tersedia` |
| B4 | Buku Tulis Kosong | `tersedia` |

| ID Anggota | Nama | Pinjaman Awal |
| :--- | :--- | :--- |
| A1 | Andi | `[]` (kosong) |
| A2 | Budi | `[]` (kosong) |

### b. Daftar Fungsi

| Fungsi | Return | Peran | Mengimplemented BR |
| :--- | :--- | :--- | :--- |
| `cariAnggota(String id)` | `Anggota?` | Mencari anggota berdasarkan `idAnggota`. | — |
| `cariBuku(String id)` | `Buku?` | Mencari buku di katalog berdasarkan `idBuku`. | — |
| `bisaPinjamLagi(Anggota orang)` | `bool` | Mengembalikan `true` bila jumlah pinjaman `< 3`. | **BR-01** |
| `bukuBisaDipinjam(Buku buku)` | `bool` | Mengembalikan `true` bila status buku `tersedia`. | **BR-02** |
| `hitungDenda(int hari)` | `int` | Menghitung `hari × 1000`, atau `0` bila tidak terlambat. | **BR-03** |
| `prosesPinjamBuku(String idAnggota, String idBuku)` | `void` | Menggabungkan seluruh validasi lalu mengeksekusi peminjaman. | BR-01, BR-02 |
| `prosesBalikBuku(String idAnggota, String idBuku, int hariTelat)` | `void` | Mengembalikan buku, memperbarui state, dan mencetak denda. | BR-03 |

### c. Alur Pengecekan di Kode

`prosesPinjamBuku` menjalankan pemeriksaan berurutan dan langsung berhenti pada kondisi gagal pertama:

1. `cariAnggota` → bila `null`, cetak "Anggotanya ngga ketemu".
2. `cariBuku` → bila `null`, cetak "Bukunya ngga ada di data perpustakaan".
3. `bukuBisaDipinjam` → bila `false`, gagal dengan alasan **BR-02**.
4. `bisaPinjamLagi` → bila `false`, gagal dengan alasan **BR-01**.
5. lolos semua → ubah `status` buku menjadi `dipinjam`, tambahkan buku ke `daftarPinjaman` anggota, lalu cetak pesan sukses.

`prosesBalikBuku` menjalankan: cari anggota + buku → hapus buku dari `daftarPinjaman` → ubah `status` menjadi `tersedia` → hitung denda lewat `hitungDenda` → cetak hasil.

---

## 11. Skenario Pengujian

| Skenario | Percobaan | Aturan yang Diuji | Expected Output |
| :---: | :--- | :--- | :--- |
| 1 | `prosesPinjamBuku('A1', 'B1')` | Alur normal | Sukses, buku B1 status `dipinjam` |
| 2 | `prosesPinjamBuku('A2', 'B1')` | **BR-02** | Gagal, B1 sedang dipinjam A1 |
| 3 | `prosesPinjamBuku('A1', 'B2')` | Alur normal | Sukses, A1 punya 2 buku |
| 4 | `prosesPinjamBuku('A1', 'B3')` | Alur normal | Sukses, A1 punya 3 buku |
| 5 | `prosesPinjamBuku('A1', 'B4')` | **BR-01** | Gagal, kuota 3 buku sudah penuh |
| 6 | `prosesBalikBuku('A1', 'B2', 0)` | **BR-03** | Sukses, tanpa denda |
| 7 | `prosesBalikBuku('A1', 'B1', 4)` | **BR-03** | Sukses, denda Rp4.000 |

### Output Program (`main()`)

```text
=== TEST SISTEM PERPUSTAKAAN ===

>>> Info: Anggota A1 mau pinjam buku B1
Sukses: Andi berhasil meminjam buku "Belajar Dart dari Nol".

>>> Info: Anggota A2 mau pinjam buku B1
Gagal (BR-02): Yah, buku "Belajar Dart dari Nol" lagi dipinjem orang lain.

>>> Info: Anggota A1 mau pinjam buku B2
Sukses: Andi berhasil meminjam buku "Cara Bikin Kopi".

>>> Info: Anggota A1 mau pinjam buku B3
Sukses: Andi berhasil meminjam buku "Komik Detective Conan".

>>> Info: Anggota A1 mau pinjam buku B4
Gagal (BR-01): Maaf Andi, kamu udah pinjam 3 buku. Balikin dulu ya.

>>> Info: Anggota A1 ngembaliin buku B2. Telat: 0 hari.
Sukses: Buku "Cara Bikin Kopi" dikembalikan tepat waktu. Ngga ada denda.

>>> Info: Anggota A1 ngembaliin buku B1. Telat: 4 hari.
Sukses (BR-03): Buku "Belajar Dart dari Nol" dikembalikan. Tapi kena denda Rp4000 karena telat.
```

---

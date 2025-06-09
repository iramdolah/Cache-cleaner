<div align="center">

# 🧹 Pembersih Cache

*Utilitas pembersih cache yang kuat dan efisien untuk sistem Windows*

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/platform-Windows-blue.svg)](https://www.microsoft.com/windows)
[![Language](https://img.shields.io/badge/language-Batch-green.svg)](https://en.wikipedia.org/wiki/Batch_file)
[![GitHub release](https://img.shields.io/github/release/iramdolah/Cache-cleaner.svg)](https://github.com/iramdolah/Cache-cleaner/releases)
[![GitHub stars](https://img.shields.io/github/stars/iramdolah/Cache-cleaner.svg?style=social)](https://github.com/iramdolah/Cache-cleaner/stargazers)

</div>

---

## 📋 Daftar Isi

- [✨ Fitur](#-fitur)
- [🚀 Mulai Cepat](#-mulai-cepat)
- [📥 Instalasi](#-instalasi)
- [💻 Penggunaan](#-penggunaan)
- [🔧 Opsi Lanjutan](#-opsi-lanjutan)
- [📊 Performa](#-performa)
- [🤝 Kontribusi](#-kontribusi)

---

## ✨ Fitur

<div align="center">

| Fitur | Deskripsi |
|-------|-----------|
| 🗑️ **Pembersihan Menyeluruh** | Menghapus file sementara, cache browser, cache sistem |
| ⚡ **Kecepatan Tinggi** | Algoritma yang dioptimalkan untuk operasi pembersihan cepat |
| 🛡️ **Aman & Terjamin** | Hanya menghapus file dan folder yang aman untuk dihapus |
| 🎯 **Pembersihan Terarah** | Mendukung berbagai browser dan aplikasi |
| 📊 **Pelacakan Progres** | Update progres real-time selama pembersihan |
| 🔄 **Backup Otomatis** | Backup opsional sebelum membersihkan file penting |

</div>

### 🎯 Yang Akan Dibersihkan

- **File Temp Windows** (`%temp%`, `%tmp%`)
- **Cache Browser** (Chrome, Firefox, Edge, Opera)
- **Cache Sistem** (DNS, Font cache, Icon cache)
- **File Temp Aplikasi**
- **Recycle Bin** (opsional)
- **File Log** (log sistem dan aplikasi)

---

## 🚀 Mulai Cepat

```batch
# Clone repository
git clone https://github.com/iramdolah/Cache-cleaner.git

# Masuk ke direktori
cd Cache-cleaner

# Jalankan sebagai Administrator
Klik kanan pada cache_cleaner.bat → "Run as administrator"
```

> **⚠️ Penting:** Selalu jalankan sebagai Administrator untuk hasil pembersihan optimal!

---

## 📥 Instalasi

### Metode 1: Download Release
1. Pergi ke [Releases](https://github.com/iramdolah/Cache-cleaner/releases)
2. Download versi terbaru
3. Ekstrak ke lokasi yang diinginkan
4. Jalankan `cache_cleaner.bat` sebagai Administrator

### Metode 2: Clone Repository
```bash
git clone https://github.com/iramdolah/Cache-cleaner.git
cd Cache-cleaner
```

### Metode 3: Download Langsung
```powershell
# Menggunakan PowerShell
Invoke-WebRequest -Uri "https://github.com/iramdolah/Cache-cleaner/archive/main.zip" -OutFile "cache-cleaner.zip"
Expand-Archive -Path "cache-cleaner.zip" -DestinationPath "."
```

---

## 💻 Penggunaan

### Penggunaan Dasar
```batch
# Pembersihan standar
cache_cleaner.bat

# Mode senyap (tanpa prompt)
cache_cleaner.bat /silent

# Output verbose
cache_cleaner.bat /verbose
```

### Mode Interaktif
1. **Jalankan script** sebagai Administrator
2. **Pilih opsi pembersihan** dari menu
3. **Konfirmasi** pilihan Anda
4. **Monitor progres** secara real-time
5. **Tinjau hasil** dan ruang yang dibebaskan

### Opsi Command Line

| Opsi | Deskripsi | Contoh |
|------|-----------|--------|
| `/silent` | Jalankan tanpa interaksi pengguna | `cache_cleaner.bat /silent` |
| `/verbose` | Tampilkan output detail | `cache_cleaner.bat /verbose` |
| `/backup` | Buat backup sebelum pembersihan | `cache_cleaner.bat /backup` |
| `/browsers` | Bersihkan hanya cache browser | `cache_cleaner.bat /browsers` |
| `/system` | Bersihkan hanya cache sistem | `cache_cleaner.bat /system` |

---

## 🔧 Opsi Lanjutan

### Konfigurasi Kustom
Buat file `config.ini` untuk menyesuaikan perilaku pembersihan:

```ini
[Settings]
EnableBackup=true
SkipRecycleBin=false
VerboseOutput=true
AutoRestart=false

[Paths]
CustomTempPath=C:\MyTemp
ExcludeFolders=DataPenting,SimpanIni

[Browsers]
Chrome=true
Firefox=true
Edge=true
Opera=false
```

### Menjadwalkan Pembersihan Otomatis
```batch
# Jadwalkan pembersihan harian pada jam 2 pagi
schtasks /create /tn "Cache Cleaner" /tr "C:\path\to\cache_cleaner.bat /silent" /sc daily /st 02:00
```

---

## 📊 Performa

<div align="center">

### Hasil Tipikal

| Tipe Sistem | File Dibersihkan | Ruang Dibebaskan | Waktu Dibutuhkan |
|-------------|------------------|------------------|------------------|
| 💻 **Penggunaan Ringan** | 1,000-5,000 | 500MB-2GB | 30-60s |
| 🖥️ **Penggunaan Regular** | 5,000-15,000 | 2GB-8GB | 1-3 menit |
| 🏢 **Penggunaan Berat** | 15,000+ | 8GB+ | 3-10 menit |

</div>

### Perbandingan Sebelum & Sesudah
```
📈 Hasil Pembersihan:
┌─────────────────────┬──────────┬──────────┐
│ Kategori            │ Sebelum  │ Sesudah  │
├─────────────────────┼──────────┼──────────┤
│ File Temp           │ 2.3 GB   │ 0 MB     │
│ Cache Browser       │ 1.8 GB   │ 0 MB     │
│ Cache Sistem        │ 892 MB   │ 0 MB     │
│ File Log            │ 234 MB   │ 0 MB     │
└─────────────────────┴──────────┴──────────┘

💾 Total Ruang Dibebaskan: 5.2 GB
⏱️ Waktu Dibutuhkan: 2 menit 34 detik
```

---

## 🤝 Kontribusi

Kami menyambut kontribusi! Berikut cara Anda dapat membantu:

### 🐛 Laporan Bug
- Gunakan [issue tracker](https://github.com/iramdolah/Cache-cleaner/issues)
- Sertakan informasi sistem dan pesan error
- Berikan langkah-langkah untuk mereproduksi masalah

### 💡 Permintaan Fitur
- Periksa issues yang ada terlebih dahulu
- Jelaskan fitur dan manfaatnya dengan jelas
- Sertakan use case dan contoh

### 🔧 Pull Request
1. Fork repository
2. Buat branch fitur (`git checkout -b feature/fitur-luar-biasa`)
3. Commit perubahan Anda (`git commit -m 'Tambah fitur luar biasa'`)
4. Push ke branch (`git push origin feature/fitur-luar-biasa`)
5. Buka Pull Request

### 📝 Setup Development
```batch
# Clone fork Anda
git clone https://github.com/USERNAME_ANDA/Cache-cleaner.git

# Buat branch development
git checkout -b dev-branch

# Buat perubahan dan test secara menyeluruh
# Test pada berbagai versi Windows jika memungkinkan
```

---

<div align="center">

### 📞 Dukungan & Kontak

[![GitHub Issues](https://img.shields.io/badge/GitHub-Issues-red?style=for-the-badge&logo=github)](https://github.com/iramdolah/Cache-cleaner/issues)

---

**⭐ Beri star pada repository ini jika menurut Anda membantu!**

*Dibuat dengan ❤️ oleh [iramdolah](https://github.com/iramdolah)*

---

### 📊 Statistik Repository

![GitHub repo size](https://img.shields.io/github/repo-size/iramdolah/Cache-cleaner)
![GitHub last commit](https://img.shields.io/github/last-commit/iramdolah/Cache-cleaner)
![GitHub issues](https://img.shields.io/github/issues/iramdolah/Cache-cleaner)
![GitHub pull requests](https://img.shields.io/github/issues-pr/iramdolah/Cache-cleaner)

</div>

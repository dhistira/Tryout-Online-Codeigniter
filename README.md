# Tryout Online dengan Codeigniter
Sebelum modifikasi : 
https://github.com/akhwan90/cat

# Deskripsi
Aplikasi ini merupakan hasil fork dari link diatas dengan beberapa modifikasi yang disesuaikan dengan kebutuhan Try Out online. Dimana modifikasinya akan selalu update di changelog baik secara perbaikan bug ataupun penambahan/pengurangan fitur.

# Changelog
### 10 Februari 2018
* Perbaikan bug SQL
* Perbaikan bug undefined offset ketika input jawaban

===================

# Detail dari laman CAT

# Pemrograman :
1. PHP dengan framework : Codeigniter versi  2.x.x (ane lupa versinya, yang jelas versi 2)
2. Javascript jQuery, untuk menghandel perintah-perintah javascript, dan lainya.
3. format data JSON untuk pertukaran data antara server dgn client, pada menu-menu yang ber-AJAX
4. Design UI dengan framework CSS, Twitter Bootstrap

# Level user : 
1. Admin, merupakan level tertinggi dari aplikasi, bisa memanej data : guru/dosen,  siswa, mata pelajaran, soal, lihat hasil ujian
2. Guru, mempunyai akses, bisa memanage data : soal, daftar ujian, dan melihat hasil ujian
3. Siswa, mempunya akses, bisa mengikuti ujian, sesuai dengan mata pelajaran yang ia ikuti, yang diatur oleh  level admin, dan melihat hasil ujian.


# Yang Baru di CAT Versi DUA

Level Admin :
* Data siswa dengan fasilitas paging dan pencarian data siswa langsung.
* Import data siswa dengan format excel, dengan format data yang telah ditentukan.
* Reset password user level siswa.
* Data guru dengan fasilitas paging dan pencarian data guru langsung.
* Import data guru dengan format excel, dengan format data yang telah ditentukan.
* Reset password user level guru.
* Data soal dengan fasilitas paging dan pencarian data soal langsung.
* Import data soal dengan format excel, dengan format data yang telah ditentukan.
* Otomatis hitung statistik soal (jumlah yang menjawab benar, dan salah)
* Otomatis siswa mengikuti semua mata pelajaran (fasilitas setting mapel siswa pada CAT versi sebelumnya dihilangkan)

Level Guru :
* Data soal dengan fasilitas paging dan pencarian data soal langsung.
* Import data soal dengan format excel, dengan format data yang telah ditentukan.
* Otomatis hitung statistik soal (jumlah yang menjawab benar, dan salah)
* Pembuatan ujian dengan batasan waktu mulai, dan toleransi terlambat
* Ujian dengan menggunakan token (seperti UNBK)
* Fitur pembatalan keikutsertaan ujian

Level Siswa :
* Perbaikan tampilan saat mengikuti ujian.
* Pengisian token saat akan mengikuti ujian

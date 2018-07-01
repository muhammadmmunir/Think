--
-- Database: `think`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `jawaban`
--

CREATE TABLE `jawaban` (
  `idjawaban` int(11) NOT NULL,
  `jawaban` enum('a','b','c','d') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jawaban`
--

INSERT INTO `jawaban` (`idjawaban`, `jawaban`) VALUES
(1, 'a'),
(2, 'b'),
(3, 'c'),
(4, 'd');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jeniskelamin`
--

CREATE TABLE `jeniskelamin` (
  `idjeniskelamin` int(11) NOT NULL,
  `jeniskelamin` enum('laki-laki','perempuan') NOT NULL DEFAULT 'laki-laki'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jeniskelamin`
--

INSERT INTO `jeniskelamin` (`idjeniskelamin`, `jeniskelamin`) VALUES
(1, 'laki-laki'),
(2, 'perempuan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `idkategori` int(11) NOT NULL,
  `kategori` enum('pengetahuanumum','ipa','ips','matematika','bahasainggris','bahasaindonesia') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`idkategori`, `kategori`) VALUES
(1, 'pengetahuanumum'),
(2, 'ipa'),
(3, 'ips'),
(4, 'matematika'),
(5, 'bahasainggris'),
(6, 'bahasaindonesia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `idpengguna` int(11) NOT NULL,
  `idperan` int(11) NOT NULL DEFAULT '2',
  `idjeniskelamin` int(11) NOT NULL,
  `namadepan` varchar(32) NOT NULL,
  `namabelakang` varchar(32) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`idpengguna`, `idperan`, `idjeniskelamin`, `namadepan`, `namabelakang`, `username`, `password`) VALUES
(36, 1, 1, 'Muhammad', 'Munir', 'munir', 'ad6ac62accc67a7c67a3e7e67dafd0f1'),
(42, 2, 1, 'Kevin', 'Pahlevi', 'kevinp', 'ba1bf81309ce59ac0c6f94ca057e57df'),
(61, 2, 1, 'satu', 'satu', 'satu', '6d9086af10f2e21b5a61e9ad7a988efd'),
(62, 2, 1, 'dua', 'dua', 'dua', '268c6b9f91fc42d96a307d38cb070d1f'),
(63, 2, 1, 'tiga', 'tiga', 'tiga', '24658cb4fc9c6ec8e2ab66e6cf02dd8c'),
(64, 2, 1, 'ilin', 'fauzi', 'ilinprikitiew', 'cbd23177427fe2e3db6cd8823262c092'),
(65, 2, 1, 'Moh', 'Harits', 'mharits', 'c2a1cf1fed3a88e8958c5f30232d180e'),
(66, 2, 1, 'rizky', 'hr', 'rizky', 'c4c9cbc7453d9e168d171ac2b5146595'),
(67, 2, 1, 'farhan', 'nugraha', 'farhan', 'd21cd7e6e2d7acf1ea163e45122ad8fb'),
(68, 2, 1, 'six', 'six', 'sixth', '63996227d6a742128cd664b694155e6b'),
(69, 2, 1, 'asdf', 'asdf', 'asdf', '82ab7beafdce7107e7c50e8af9004dd4'),
(70, 2, 1, 'baru', 'baru', 'baru', '74415e16aa12c11d0afa306bad9fc63e');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peran`
--

CREATE TABLE `peran` (
  `idperan` int(11) NOT NULL,
  `peran` enum('admin','pelajar') NOT NULL DEFAULT 'pelajar'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `peran`
--

INSERT INTO `peran` (`idperan`, `peran`) VALUES
(1, 'admin'),
(2, 'pelajar');

-- --------------------------------------------------------

--
-- Struktur dari tabel `soal`
--

CREATE TABLE `soal` (
  `idsoal` int(11) NOT NULL,
  `idpengguna` int(64) NOT NULL,
  `idkategori` int(64) NOT NULL,
  `idjawaban` int(64) NOT NULL,
  `soal` mediumtext NOT NULL,
  `jawabana` char(128) NOT NULL,
  `jawabanb` char(128) NOT NULL,
  `jawabanc` char(128) NOT NULL,
  `jawaband` char(128) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `soal`
--

INSERT INTO `soal` (`idsoal`, `idpengguna`, `idkategori`, `idjawaban`, `soal`, `jawabana`, `jawabanb`, `jawabanc`, `jawaband`, `tanggal`) VALUES
(145, 36, 2, 1, 'Dalam sistem pengelompokan tumbuhan ada beberapa macam cara tergantung dari macam kelompoknya. Kelompok tumbuhan di bawah ini yang merupakan keanekaragaman tingkat jenis dalam satu genus, adalah', 'Aren, kelapa, pinang', 'Lengkuas, jahe, kunir', 'Kacang tanah, kacang panjang, kacang hijau', 'Jeruk bali, jeruk nipis, jeruk peras', '2016-12-19 01:57:30'),
(146, 36, 2, 2, 'Untuk memperbaiki tingkat kehidupan secara fisik, banyak teknologi yang digunakan oleh manusia di dalam prosesnya, salah satunya menggunakan teknologi hibridoma. Pada teknologi hibridoma terjadi peleburan 2 (dua) jenis sel, yaitu antara ...', 'Sel gamet dan sel ovum', 'Sel penghasil antibodi dan sel kanker', 'Sel gamet dan sel somatis', 'Sel penghasil antibodi dengan sel somatis', '2016-12-19 01:57:30'),
(147, 36, 2, 3, 'Dalam suatu ekosistem padang rumput dihuni oleh beberapa hewan, yaitu harimau, kelinci, ular, cacing. Jika populasi kelinci berkembang biak dengan cepat, maka dapat diperkirakan akan berakibat', 'Populasi harimau naik, populasi rumput naik', 'Populasi harimau turun, populasi rumput turun', 'Populasi harimau naik, populasi rumput turun', 'Populasi harimau turun, populasi rumput naik', '2016-12-19 01:57:30'),
(148, 36, 2, 3, 'Respirasi merupakan  proses  pembebasan energi  yang  tersimpan dalam  zat-zat makanan. Pada proses katabolisme karbohidrat  terjadi  tiga tahapan  reaksi, yaitu glikolisis,  siklus Krebs dan transpor elektron. Melalui siklus Krebs  akan dihasilkan ', '8 NADH, 2 FADH2, dan 2 ATP', '2 NADH dan 2 ATP', '4 NADH, 1 FADH2 dan 1 ATP', '2 NADH dan 34 ATP', '2016-12-19 01:57:30'),
(149, 36, 2, 3, 'Karakteristik  yang membedakan DNA dan RNA adalah', 'dapat menyebabkan mutasi', 'mengandung gula, basa, dan fosfat', 'mampu mereplikasi dan bertranslasi', '2 NADH dan 34 ATP', '2016-12-19 01:57:30'),
(150, 36, 2, 2, 'Konsfigurasi electron unsur Q yang terletak pada golongan IIIA pada periode 4 maka konfigurasinya yang paling sesuai adalah', '1s2 2s2 2p6 3s2 3p6 3d10 4p3', '1s2 2s2 2p6 3s2 3p6 3d10 4s2 4p1', '1s2 2s2 2p6 3s2 3p6 4s2 4p6 5s2 5p3', '1s2 2s2 2p6 3s2 3p6 4s2 4p6 3d5', '2016-12-19 01:57:31'),
(151, 36, 2, 2, 'Pasangan data yang berhubungan secara tepat adalah', 'Koloid pelindung/Penambahan tawas pada penjernih air', 'Dialysis/Mesin pencuci darah', 'Efek Tyndall/Penyaring asap pabrik', 'adsorpsi/glatin pada es krim', '2016-12-19 01:57:31'),
(152, 36, 2, 4, 'Contoh polimer dan kegunaanya yang tepat adalah', 'Protein/Kapas', 'Selulosa/Sutra', 'Polietilen/Cat', 'Poliviniklorida/Pipa Plastik', '2016-12-19 01:57:31'),
(153, 36, 2, 2, 'Tekanan hidrostatis pada suatu titik di dalam bejana yang berisi zat cair ditentukan oleh: (1) massa jenis zat cair (2) volume zat cair dalam bejana (3) kedalaman titik dari permukaan zat cair\r\n(4) bentuk bejana. Pernyataan yang benar adalah', '1-2-3', '1-3', '2-4', '4', '2016-12-19 01:57:31'),
(154, 36, 2, 3, 'Radioisotop Carbon-14 bermanfaat untuk', 'Pengobatan kanker', 'Mendeteksi kebocoran pipa', 'Menentukan umur bahan atau fosil', 'Uji mutu kerusakan bahan industri', '2016-12-19 01:57:31'),
(155, 36, 2, 4, 'Sejumlah gas ideal berada di dalam ruangan tertutup mula-mula bersuhu 27 Celcius. Supaya tekanannya menjadi 4 kali semula, maka suhu ruangan tersebut adalah', '108 C', '297 C', '300 C', '927 C', '2016-12-19 01:57:31'),
(156, 36, 2, 3, 'Gas Ideal yang berada dalam suatu bejana dimampatkan (ditekan) maka gas akan mengalami', 'Penurunan laju partikel', 'Penurunan suhu', 'Kenaikan suhu', 'Penambahan partikel gas', '2016-12-19 01:57:31'),
(157, 36, 2, 1, 'Perbedaan model atom Rutherford dan model atom Bohr adalah', 'Elektron berputar mengelilingi inti dengan membebaskan sejumlah energi', 'Elektron merupakan bagian atom yang bermuatan negatif', 'Atom berbentuk bola kosong dengan inti ada di tengah', 'Secara keseluruhan atom bersifat netral', '2016-12-19 01:57:31'),
(158, 36, 2, 3, 'Kerusakan alat filtrasi pada ginjal menyebabkan molekul albumin dan protein lain terdapat dalam urin sehingga mengakibatkan', 'terbentuk batu ginjal', 'perut menjadi buncit', 'seluruh tubuh bengkak', 'penimbunan air di kaki', '2016-12-19 01:57:31'),
(159, 36, 2, 3, 'Bahan kimia pada rokok yang membuat ketagihan bagi penggunanya adalah', 'tar', 'morfin', 'nikotin', 'kafein', '2016-12-19 01:57:31'),
(160, 36, 2, 4, 'Dari kelompok besaran dibawah ini yang hanya terdiri dari besaran turunan saja adalah', 'kuat arus, massa, gaya', 'suhu, massa, volume', 'waktu, percepatan, momentum', 'usaha, momentum, percepatan', '2016-12-19 01:57:31'),
(161, 36, 2, 2, 'Dibawah ini adalah besaran-besaran fisika: (1) Panjang (2) massa (3) kuat arus (4) gaya. Yang termasuk kedalam besaran pokok adalah\r\n', '1 dan 3', '1, 2, dan 3', '3 dan 2', '3 dan 4', '2016-12-19 01:57:31'),
(162, 36, 2, 3, 'Dari besaran fisika dibawah ini yang merupakan besaran pokok adalah', 'Massa, berat, jarak, gaya', 'Panjang, daya, momentum, kecepatan', 'Kuat arus, jumlah zat, suhu, panjang', 'Waktu, energi, percepatan, tekanan', '2016-12-19 01:57:31'),
(163, 36, 2, 4, 'Dibawah ini yang merupakan kelompok besaran turunan adalah', 'Momentum, waktu, kuat arus.', 'Kecepatan, usaha, massa', 'Energi, usaha, waktu putar', 'Momen gaya, usaha, momentum', '2016-12-19 01:57:31'),
(164, 36, 2, 4, 'Energi kinetik dinyatakan dengan Ek = 1/2 . m . v^2. Dimensi energi kinetik adalah', '[M] [L] [T]', '[M] [L] [T]^-2', '[M] [L]^-1 [T]^-2', '[M] [L]^-2 [T]^-2', '2016-12-19 01:57:31'),
(226, 36, 1, 1, 'Pusat Keuangan Amerika Serikat berada di', 'New York', 'Washington DC', 'Chicago', 'Las Vegas', '2016-12-19 01:49:43'),
(227, 36, 1, 4, 'Berikut ini adalah negara yang dilalui olehPegunungan Alpen, kecuali', 'Austria', 'Liechtenstein', 'Swiss', 'Hungaria', '2016-12-19 01:49:43'),
(228, 36, 1, 2, 'Benua biru adalah sebutan bagi benua', 'Asia', 'Eropa', 'Afrika', 'Australia', '2016-12-19 01:49:43'),
(229, 36, 1, 3, 'Ankara adalah ibukota dari negara', 'Libanon', 'Bahrain', 'Turki', 'Qatar', '2016-12-19 01:49:43'),
(230, 36, 1, 1, 'Allah Akbar adalah lagu kebangsaan dari negara', 'Libya', 'Saudi Arabia', 'Turki', 'Qatar', '2016-12-19 01:49:43'),
(231, 36, 1, 1, 'Hari perdamaian dunia diperingati setiap tanggal', '1 Januari', '1 Februari', '1 Maret', '1 April', '2016-12-19 01:49:43'),
(232, 36, 1, 2, 'Kereta api ditemukan oleh', 'Civrac', 'Murdocks I', 'Robert Fulton I', 'Nikola Tesla l', '2016-12-19 01:49:43'),
(233, 36, 1, 4, 'Berikut ini adalah pelopor berdirinya ASEAN yang berasal dari negara Filipina, yaitu', 'Adam Malik', 'Murdocks I', 'Thanat Khoman', 'Narcisco ramos l', '2016-12-19 01:49:43'),
(234, 36, 1, 1, 'Benua kuning adalah sebutan bagi benua', 'Asia', 'Eropa', 'Afrika', 'Amerika', '2016-12-19 01:49:43'),
(235, 36, 1, 3, 'Kejuaraan sepak bola dunia (World Cup) dilaksanakan pertama kali pada tahun 1930 di Uruguay dan juaranya adalah', 'Italia', 'Inggris', 'Uruguay', 'Amerika', '2016-12-19 01:49:43'),
(236, 36, 1, 3, 'Gubernur provinsi Jawa Timur yang pertama adalah', 'Dr. Moedjani', 'R. Samadikun', 'R.T. Soeryo', 'Imam Utomo', '2016-12-19 01:49:44'),
(237, 36, 1, 2, 'Suku Bugis berada di provinsi', 'Sumatera Utara', 'Sulawesi Selatan', 'Kalimantan Timur', 'NTT', '2016-12-19 01:49:44'),
(238, 36, 1, 3, 'Suku Bugis berada di provinsi', 'Sumatera Utara', 'Sulawesi Selatan', 'Sulawesi Utara', 'NTT', '2016-12-19 01:49:44'),
(239, 36, 1, 3, 'Tanggal 14 Agustus diperingata sebagai hari', 'Sumpah Pemuda', 'Kesaktian Pancasila', 'Pramuka', 'PMI', '2016-12-19 01:49:44'),
(240, 36, 1, 1, 'Taman hutan raya Ir. Juanda terletak di provinsi', 'Jawa Barat', 'Jawa Tengah', 'Jawa Timur', 'DKI Jakarta', '2016-12-19 01:49:44'),
(241, 36, 1, 3, 'Pasukan perdamaian Indonesia dibawah bendera PBB yang diberi nama Pasukan Garuda I (yang pertama) dikirim ke wilayah ', 'Kongo', 'Vietnam', 'Mesir', 'Iraq', '2016-12-19 01:49:44'),
(242, 36, 1, 3, 'Kabinet yang dipimpin oleh Presiden Megawati Soekarnoputri dinamakan', 'Reformasi Pembangunan', 'Indonesia Bersatu', 'Gotong Royong', 'Persatuan Nasional', '2016-12-19 01:49:44'),
(243, 36, 1, 1, 'Rudi Hartono memenangi kejuaraan All England sebanyak', '8 kali', '9 kali', '10 kali', '11 kali', '2016-12-19 01:49:44'),
(244, 36, 1, 2, 'Danau yang terdalam di dunia dan terletak diSiberia yaitu', 'Tanganyika', 'Baikal', 'Malawi', 'Superior', '2016-12-19 01:49:44'),
(245, 36, 1, 3, 'Bunga nasional dari Negara Indonesia adalah', 'Anggrek', 'Tulip l', 'Melati', 'Teratai Biru', '2016-12-19 01:49:44'),
(246, 36, 6, 2, 'Bacalah wacana berikut dengan saksama!\r\nBendungan di Desa Jatirogo ini tidak ada duanya di Indonesia. Tubuh bendungan tersebut dari bantalan karet berisi air. Karena terbuat dari karet, tinggi permukaannya bisa diatur secara fleksibel. Bila terjadi banjir, bantalan karet itu dikempiskan. Dan air bah lancar mengalir ke laut. Sebaliknya, bila volume air sungai mengecil, tubuh bendungan diisi penuh, sehingga tingginya mencapai 3 m. Sungai terbendung dan airnya dimanfaatkan sebagai air minum dan irigasi. Pada saat yang sama, air pasang dari laut akan terhambat dan tak mencemari sungai yang menjadi sumber utama air tawar masyarakat di sekitar sungai.\r\nSimpulan isi wacana di atas adalah', 'Bendungan dari bantalan karet dapat membendung sungai.', 'Bendungan dari bantalan karet sangat bermanfaat.', 'Bendungan dari bantalan karet dapat mengalirkan air.', 'Pemanfaatan air melalui bendungan bantalan karet.', '2016-12-19 02:37:30'),
(247, 36, 6, 1, 'Bacalah teks berikut ini dengan saksama! Soetomo lahir di Desa Ngepeh, Kabupaten Nganjuk, Jawa Timur, pada tanggal 30 Juli 1888. Pada waktu kecil pemuda itu oleh ayahnya diberi nama Soebroto. Nama itu kemudian diganti menjadi Soetomo ketika dia mengikuti sekolah rendah Belanda (ELS) di Bangil.\r\nSetelah tamat dari ELS di Bangil, Soetomo melanjutkan studinya ke Jakarta. Ia masuk sekolah kedokteran Jawa yang bernama STOVIA pada tanggal 10 Januari 1903. Pada masa kemahasiswaannya inilah, ia tampil sebagai penggerak utama berdirinya Boedi Oetomo pada bulan Mei 1908.\r\nPernyataan-pernyataan berikut yang sesuai dengan isi paragraf di atas adalah', 'Soetomo lahir di Desa Ngepeh, Kabupaten Nganjuk, Jawa Timur. Setamat dari ELS di Bangil, ia melanjutkan studinya ke STOVIA', 'Pada waktu kecil, Soetomo diberi nama Soebroto. Nama itu kemudian diganti menjadi Soetomo untuk melanjutkan sekolah ke STOVIA', 'Soetomo lahir di Desa Ngepah, Kabupaten Nganjuk, Jawa Timur. Setelah besar ia pindah ke Jakarta untuk menggapai cita-citanya', 'Soetomo lahir pada tanggal 30 Juli 1888. Setamat ELS, ia pindah ke Jakarta dan bersekolah di STOVIA.', '2016-12-19 02:38:54'),
(248, 36, 6, 2, 'Bacalah surat undangan berikut ini!\r\nYth. Saudara Bambang Sukadi, Jalan Sidobali 25, Kota Gede Yogyakarta..\r\nKalimat yang tepat untuk melengkapi bagian pembuka surat di atas adalah', 'Bersama surat ini kami mengundang Saudara untuk menghadiri rapat pada', 'Dengan surat ini kami mengundang Saudara untuk menghadiri rapat pada', 'Kami mengundang Saudara hadir untuk rapat', 'Saya mengundang Saudara untuk menghadiri rapat pada', '2016-12-19 02:37:31'),
(249, 36, 6, 3, 'Bacalah penggalan pidato di bawah ini dengan saksama! Dalam proses komunikasi saya dengan seluruh rakyat Indonesia, baik melalui surat, telepon, maupun SMS, masih sering dirasakan adanya pelayanan yang kurang baik kepada rakyat. Oleh karena itu, mari kita tingkatkan kualitas pelayanan dengan penuh ketulusan, kasih sayang, dan rasa tanggung jawab.\r\n(Presiden Susilo Bambang Yudhoyono, pada acara HUT ke-59 Bhayangkara). Penggalan pidato tersebut bertujuan', 'Mengecam kinerja POLRI yang kurang baik.', 'Memberitahukan kepada rakyat agar menggunakan SMS, surat, maupun telepon dalam berkomunikasi dengan presiden.', 'Mengimbau agar POLRI meningkatkan kualitas pelayanan kepada masyarakat dengan penuh tanggung jawab.', 'Menenangkan hati rakyat dengan cara mengadakan komunikasi melalui surat, telepon, maupun SMS.', '2016-12-19 02:37:31'),
(250, 36, 6, 1, 'Bacalah paragraf berikut dengan saksama!\r\nProduksi padi tahun 2005 diperkirakan mencapai 53,01 juta ton gabah kering giling atau turun dua persen dibandingkan dengan produksi tahun sebelumnya. Hal ini disebabkan adanya penurunan luas panen padi sawah akibat bencana banjir dan kekeringan, serta pergeseran waktu tanam pada empat bulan pertama di tahun 2005.\r\nGagasan utama paragraf di atas adalah', 'Produksi padi tahun 2005 diperkirakan menurun', 'Produksi padi tahun 2005 diperkirakan mencapai 53,01 juta ton gabah kering atau turun dua persen dari sebelumnya', 'Adanya penyebab turunnya produksi padi, yaitu banjir dan kekeringan', 'Produksi padi tahun 2005 turun akibat banjir, kekeringan, dan pergeseran waktu tanam', '2016-12-19 02:37:31'),
(251, 36, 6, 2, 'Mereka selalu saja bermusuhan tidak pernah rukun. Sekarang mereka harus menanggung segala akibat dari perbuatannya. Gurindam yang sesuai dengan ilustrasi di atas adalah', 'Kurang pikir kurang siasat, tentu kelak dirimu tersesat.', 'Siapa menggemari silang-sengketa, kelaknya pasti berdukacita.', 'Membuat perkara amatlah mudah, jika terjadi timbullah gundah.', 'Fikir dahulu sebelum berkata, supaya terelak silang-sengketa.', '2016-12-19 02:37:31'),
(252, 36, 6, 4, 'Bacalah paragraf berikut dengan saksama!\r\nMenurut hasil penelitian mahasiswa Institut Pertanian Bogor (IPB), daging ayam yang dijual pasaran di Jakarta, sebanyak 43% mengandung formalin, yaitu senyawa kimia yang mengandung zat karsiogenik. Zat ini ternyata dapat memicu penyakit kanker di dalam tubuh. Karena itu, para konsumen yang setiap hari belanja daging ayam, baik di pasar tradisional maupun modern agar waspada.\r\nKalimat tanya yang sesuai dengan isi paragraf di atas adalah', 'Kapan para mahasiswa IPB mengadakan penelitian daging ayam yang mengandung zat karsiogenik?', 'Berapa orang mahasiswa yang melakukan penelitian terhadap daging ayam?', 'Apa tindak lanjut hasil penelitian mahasiswa IPB terhadap daging ayam?', 'Apa hasil penelitian mahasiswa IPB terhadap daging ayam yang dijual di pasar tersebut?', '2016-12-19 02:37:31'),
(253, 36, 6, 4, 'Bacalah paragraf berikut dengan saksama!\r\nIndustri kimia dan petrokimia, industri pulp dan kertas, serta industri baja menggunakan minyak bumi sebgai bahan bakar utama untuk menggerakkan mesin-mesin pabrik. Demikian juga halnya alat transportasi laut, darat, dan udara, juga menggunakan minyak bumi sebagai bahan bakar utamanya. Simpulan umum paragraf di atas adalah', 'Minyak bumi sebagai bahan bakar berbagai industri.', 'Gas bumi dan batubara merupakan sumber energi yang penting.', 'Alat transportasi menggunakan minyak bumi sebagai bahan bakar utama.', 'Minyak bumi merupakan bahan bakar utama untuk berbagai macam industri dan alat transportasi.', '2016-12-19 02:37:31'),
(254, 36, 6, 1, 'Bacalah paragraf berikut dengan saksama!\r\nTruk yang bermuatan cukup sarat itu gagal mendaki tanjakan licin pada penyeberangan sungai. Hujan lebat sebelumnya menyebabkan kondisi jalan sangat berat untuk dilewati, sehingga truk terperosok mundur ke tengah sungai. Agar memudahkan pendakian tanjakan, maka Ayub, pengemudi truk, meminta para penumpangnya turun. Dia bahkan mengingatkan kemungkinan terjadinya banjir bandang dari sebelah hulu. Akan tetapi, para penumpang menolak permintaan itu. Ide pokok paragraf di atas adalah', 'Truk gagal mendaki tanjakan licin.', 'Truk terperosok mundur ke tengah sungai', 'Pengemudi truk meminta agar penumpang turun', 'Penumpang menolak permintaan supir', '2016-12-19 02:37:31'),
(255, 36, 6, 4, '(1) Dengarkan angin mengusir batang-batang padi, (2) Sebelum matahari terbenam, (3) Dengarkan senandung di balik jendela, (4) Rumah kecil, bukanlah pintu pagarku, (5) Angin datang mengantarkan berita. \r\nBerdasarkan puisi tersebut larik yang bermajas sama dintadai dengan nomor', '(1) dan (2)', '(1) dan (3)', '(1) dan (4)', '(1) dan (5)', '2016-12-19 02:37:31'),
(256, 36, 6, 4, 'Bacalah paragraf berikut dengan seksama!\r\nJumlah angkatan kerja yang meningkat setiap tahun merupakan keuntungan sekaligus sebagai tantangan bagi pemerintah dan bangsa Indonesia dalam melaksanakan pembangunan nasional. Menurut pendapat para ahli bahwa manusia sebagai sumber potensial merupakan salah satu modal dasar pembangunan, yaitu sebagai motor penggerak dalam mekanisme kerja dalam proses produksi, serta sebagai sasaran dan hasil produksi itu sendiri.\r\nOpini (pendapat) yang terdapat dalam paragraf diatas adalah', 'Jumlah angakatan kerja yang meningkat', 'Setiap tahun merupakan keinginan dan sekaligus sebagai tantangan', 'Sebagai sasaran dan hasil produksi sendiri', 'Manuisa sebagai sunmber potensi merupakan salah satu modal dasar pembangunan', '2016-12-19 02:37:30'),
(257, 36, 6, 1, 'Bacalah paragraf berikut dengan saksama!\r\nUntuk mengisi akhir tahun pelajaran, OSIS SMA Negeri 2 Madiun merencanakan untuk mengadakan karya wisata ke beberapa objek. Dalam rapat, ketua OSIS merencanakan kunjungan ke Bandung dan Pantai Kuta di Bali. Hal ini telah disesuaikan dengan program sekolah. Tanggapan yang tepat terhadap rencana tersebut adalah', 'Menurut penfapat saya, kedua tempat itu berbeda arahnya. Sebaiknya kita pilih saja satu diantaranya', 'Buat apa kita ke Pantai Kuta? Pantai yang dekat saja ada, misalnya Parangtritis di Yogyakarta.', 'Saya setuju saja karya wisata ke kedua tempat tersebut asal biaya ditanggung oleh sekolah.', 'Saya tidak setuju dengan acara itu. Waktu liburan sebaiknya kita beristirahat di rumah.', '2016-12-19 02:37:30'),
(258, 36, 6, 1, 'Bacalah paragraf berikut dengan saksama! Faktor utama untuk bersaing adalah SDM yang sekaligus sebagai subjek dalam berproduksi. SDM perusahaan atau industri harus memiliki kemampuan teknis profesional dan adaptif. Kemampuan teknis profesional adalah keahlian menghasilkan barang dan jasa dengan sarana teknologi yang memadai. Kemampuan adaptif adalah kesanggupan SDM untuk menyesuaikan diri dengan lingkungan alam, sosial, dan lingkungan kerja, disiplin dan niai-nilai dalam perusahaan itu sendiri. Dengan kata lain, mereka harus memiliki kemampuan normatif. Penalaran yang terkandung dalam paragraf di atas adalah', 'Deduktif', 'Induktif', 'Deduktif - Induktif', 'Sebab - akibat', '2016-12-19 02:37:30'),
(259, 36, 6, 1, 'Perhatikan silogisme berikut ini! PU = .. | PK = Polisi adalah aparat keamanan | \r\nK = Polisi melindungi masyarakat | \r\nPremis umum yang tepat untuk penalaran di atas adalah', 'Seluruh aparat keamanan melindungi masyarakat', 'Semua polisi pengayom masyarakat', 'Setiap abdi masyarakat melindungi masyarakat', 'Semua polisi harus melindungi masyarakat', '2016-12-19 02:37:30'),
(260, 36, 6, 4, 'Bacalah kutipan drama berikut! \r\nVan Dijk : Tadi kan bilang, bahwa isrimu cantik, bukan? Cantik sekali dan kau cinta sekali kepadanya? | Pedagang : iya | Van Dijk : Kau juga mengatakan padaku bahwa kau lebih cinta kepadanya\r\ndaripada nyawamu sendiri. Masih ingat? | Pedagang : Ya...! | Van Dijk : Baik....baik, nyawamu akan kuselamatkan, asal istrimu kau serahkan\r\npadaku...., Bagaimana........setuju? | \r\nPedagang : Setuju major, setuju. | \r\nVan Dijk : Tadi kau bilang kalau istrimu tak bisa dibeli; kini kau berikan untuk membeli nyawamu. Begitu mudah, begitu enteng!. (Bunga-bunga Bangsa, Emil Sanosa) Dialog pada kutipan drama di atas yang mendukung watak tokoh Van Dijk yang jahat dan licik terdapat pada nomor', '1,2,5', '3,5,6', '4,5,7', '3,5,7', '2016-12-19 02:37:30'),
(261, 36, 6, 2, 'Dusun Bone-Bone di Enrekang, 5 jam berkendaraan mobil dari Makasar, Sulawesi Selatan lebih hebat lagi. Kepala Dusun berpenduduk 542 jiwa ini berinisiatif menjadikan seluruh bagian dusunnya sebagai kawasan tidak merokok. Inisiatif ini dipicu oleh adanya warga dusun yang pulang kampung karena sakit paru-paru kronis yang diakibatkan menghirup asap rokok ditempat kerjanya. Pertanyaan yang menggelayuti Pak Idris saat itu,"Kalau perokok pasif saja bisa terkena penyakit, apalagi yang merokok, ya?" Maka ditetakanlah aturan untuk tidak merokok di Bone-Bone. Untuk secara langsung menyampaikan terima kasih atas partisipasi mandirinya menyehatkan masyarakat, Depkes mengundang Kepala Dusun Bone-Bone\r\nuntuk menerima peghargaan di Jakarta.\r\nJika kita menyusun pertanyaan atas wacana artikel di atas, maka kalimat pertanyaan yang paling tepat adalah', 'Dari manakah asal kepala dusun Bone-Bone hingga berinisiatif menjadikan seluruh bagian dusunnya sebagai kawasan tidak merokok?', 'Apa yang mendasari kepala dusun Bone-Bone berinisiatif menjadikan seluruh bagian dusunnya sebagai kawasan tidak merokok?', 'Dimanakah warga dusun yang pulang kampung karena sakit paru-paru kronis yang diakibatkan menghirup asap rokok bekerja?', 'Setujukah Departemen kesehatan dengan inisiatif Pak Idris memberlakukan larangan warganya untuk tidak merokok?', '2016-12-19 02:37:30'),
(262, 36, 6, 3, 'Bacalah wacana berikut dengan cermat!\r\nPemakaian batubara di negara kita hingga saat ini masih terbatas hanya pada PLTU dan pabrik semen. Teknologi pengolahan dan kualitas batubara yang dimiliki bisa dikatakan masih rendah. Selain itu, masalah dana juga sangat terbatas. Di negara-negara maju, batubara sudah bisa diolah menjadi sumber energi. Di samping itu, dengan teknologi tinggi, batubara sudah bisa menghasilkan bahan baku industri kimia berupa gas sintetis.\r\nBerikut ini yang bukan merupakan rincian gagasan yang dikemukakan pada wacana di atas adalah', 'Teknologi pengolahan batubara masih rendah', 'Kualitas batubara masih rendah', 'Batubara masih sumber energi', 'Batubara bahan baku industri kimia', '2016-12-19 02:37:30'),
(263, 36, 6, 3, 'Bacalah paragraf berikut dengan saksama!\r\nManajer perusahaan multiproduk itu berasal dari kalangan elit. Ia dalam manajemennya selalu menggunakan sistem kontrak.\r\nDalam paragraf di atas, terdapat kesalahan penulisan kata serapan, yakni', 'manajer seharusnya manager', 'elit seharusnya elite', 'manajemen seharusnya managemen', 'sistem seharusnya sistim', '2016-12-19 02:37:30'),
(264, 36, 6, 1, 'Sistem ujian SD/MI tahun 2008 dinamakan ujian nasional yang terintegrasi dengan\r\nujian sekolah. Ini adalah jalan tengah, mempersiapkan sekolah beradaptasi dengan UN yang menetapkan peserta didik harus lulus Bahasa Indonesia, Matematika, dan IPA. Jalan tengah itu diharapkan menghentikan protes penyelenggaraan UN tingkat SD setelah pemerintah berseikeras pantang mundur dan menyelenggarakan UN jenjang SLTP dan SLTA. Protes selama ini berisi UN tidak bisa dipakai untuk memetakan kondisi praktis pendidikan. UN hanya memotret sesaat, apalagi kemudian ternyata siswa didril dengan tiga mata pelajaran yang diujikan nasional,\r\nsebab sekolah mengharapkan sebanyak mungkin lulus. Pemetaan mesti \r\nditempatkan dalam konteks proses dan bukan diorientasikan pada hasil saja. (Kompas,12 November 2007). Simpulan yang tepat isi tajuk rencana diatas adalah..', 'Ujian nasional yang terintegrasi dengan ujian sekolah adalah jalan tengah yang diharapkan menghentikan protes penyelenggaraan UN', 'Ujian nasional yang terintegrasi dengan ujian sekolah mempersiapkan sekolah beradaptasi dengan UN yang menetapkan peserta didik', 'Protes selama ini berisi UN tidak bisa dipakai untuk memetakan kondisi praktis pendidikan yang hanya memotret sesaat', 'Pemerintah bersikeras pantang mundur menyelenggarakan UN jenjang SLTP dan SLTA dan SD meski protes selama ini berisi UN', '2016-12-19 02:37:30'),
(265, 36, 6, 1, 'Bacalah penggalan puisi berikut dengan saksama! Teratai, Kepada Ki Hajar Dewantara, Dalam kebun di tanah airku\r\n....., Tersembunyi kembang indah permai,\r\nTidak terlihat orang yang lalu, Akarnya tumbuh di hati dunia, Daun bersemi Laksmi mengarang, Biarpun ia diabaikan orang,\r\nSeroja kembang gemilang mulia. (Sanusi Pane). Majas alegori yang tepat untuk melengkapi puisi diatas adalah', 'Tumbuh sekuntum bunga teratai', 'Lahirlah bunga bangsaku', 'Bunga bangsa berguguran', 'Tumbuhlah bunga-bunga bangsa', '2016-12-19 02:37:30'),
(266, 36, 3, 3, 'Berikut penyebab-penyebab tidak terbatasnya kebutuhan manusia, kecuali', 'pertambahan jumlah penduduk', 'kemajuan ilmu pengetahuan dan teknologi', 'bertambahnya kemiskinan dan pengangguran', 'peningkatan taraf hidup', '2016-12-19 02:04:18'),
(267, 36, 3, 2, 'Pembagian kebutuhan menjadi kebutuhan primer, sekunder, dan tersier merupakan    pembagian berdasarkan', 'waktu pemenuhannya', 'intensitasnya', 'sifatnya', 'subjeknya', '2016-12-19 02:04:18'),
(268, 36, 3, 2, 'Inti masalah ekonomi adalah', 'kebutuhan manusia yang dapat dipenuhi dengan kerja', 'kebutuhan manusia dan keterbatasan alat pemuasnya', 'kebutuhan manusia dan uang sebagai alat pemuasnya', 'kebutuhan manusia barang atau jasa sebagai alat pemuasnya', '2016-12-19 02:04:18'),
(269, 36, 3, 2, 'Jas hujan akan berguna pada waktu musim hujan. Contoh tersebut sesuai dengan kegunaan', 'pelayanan', 'waktu', 'tempat', 'bentuk', '2016-12-19 02:04:18'),
(270, 36, 3, 3, 'Suatu kelompok yang berpengaruh dalam suatu lingkungan atau masyarakat disebut', 'Hollands', 'Lager', 'Elite', 'Opleiding', '2016-12-19 02:04:18'),
(271, 36, 3, 2, 'Benda kebutuhan yang jumlahnya terbatas serta untuk mendapatkannya diperlukan pengorbanan adalah', 'benda bebas', 'benda ekonomi', 'barang konsumsi', 'barang produksi', '2016-12-19 02:04:18'),
(272, 36, 3, 4, 'Kesenjangan antara harapan, kenyataan, dan kebutuhan disebut', 'keinginan', 'kelangkaan', 'inti masalah ekonomi', 'barang produksi', '2016-12-19 02:04:18'),
(273, 36, 3, 4, 'Kebijakan ekonomi pemerintah kolonial belanda sangat dipengaruhi oleh', 'kondisi ekonomi indonesia', 'giatnya penduduk pribumi\r\n', 'kondisi pribumi', 'kondisi alam indonesia', '2016-12-19 02:04:19'),
(274, 36, 3, 4, 'Survei pasar sangat diperlukan guna membantu produsen terutama dalam mengatasi satu masalah ekonomi, yaitu', 'bagaimana cara memproduksi', 'untuk siapa di \r\nproduksi', 'siapa yang memproduksi', 'apa yang harus di \r\nproduksi', '2016-12-19 02:04:19'),
(275, 36, 3, 4, 'Salah satu ciri-ciri sistem ekonomi komando yaitu', 'adanya persaingan bebas antara pengusaha', 'pemerintah secara politik mengawasi dan membantu kegiatan ekonomi', 'produsen memproduksi apabila di butuhkan', 'tidak ada kebebasan berusaha secara individu', '2016-12-19 02:04:19'),
(276, 36, 3, 3, 'Panjang rata-rata jari-jari bumi adalah ?', '4371 km', '5371 km', '6371 km', '7371 km', '2016-12-19 02:04:19'),
(277, 36, 3, 1, 'Struktur internal bumi dapat dibagi menjadi 4 lapisan utama yaitu :', 'kerak, mantel, inti dalam, inti luar', 'lempeng, mantel, inti dalam, inti luar', 'kerak, lempeng, mantel, inti', 'kerak, lempeng, inti dalam, inti luar', '2016-12-19 02:04:19'),
(278, 36, 3, 1, 'Kerak adalah lapisan terluar kulit bumi yang dapat terbagi menjadi', 'kerak benua dengan tebal 30-50 km dan kerak samudera dengan tebal rata-rata 7km', 'kerak benua dengan tebal rata-rata 7km dan kerak samudera dengan tebal 30-50 km', 'kerak benua dengan tebal rata-rata 70 km dan kerak samudera tebal rata rata 300 km', 'kerak benua dengan tebal rata-rata 300 km dan kerak samudera tebal rata-rata 70 km', '2016-12-19 02:04:19'),
(279, 36, 3, 4, 'Ciri-ciri dari kerak samudera antara lain adalah sebagai berikut', 'densitasnya 3,0 gr/cm3 dan batuan penyusunnya terutama memiliki komposisi kimia kaya unsur silica dan alumunium', 'densitasnya 2,7 gr/cm3 dan batuan penyusunnya terutama memiliki komposisi kimia yang kaya silika dan magnesium', 'densitasnya 2,7 gr/cm3 dan batuan penyusunnya terutama memiliki komposisi kimia yang kaya silika dan aluminium', 'densitasnya 3,0 gr/cm3 dan batuan penyusunnya terutama memiliki komposisi kimia yang kaya unsur silika dan magnesium', '2016-12-19 02:04:19'),
(280, 36, 3, 3, 'Kerak dan mantel bagian paling atas memiliki sifat yang keras dan rigid sehingga bagian tersebut disebut sebagai litosfer. Teori Tektonik Lempeng (Plate Tectonics) menyatakan bahwa litosfer ini terpecah-pecah menjadi banyak segmen yang dikenal sebagai lempeng. Diantara pernyataan-pernyataan berikut ini, manakah pernyataan yang benar', 'Lempeng-lempeng tersebut memiliki bentuk yang sama', 'Jumlah lempeng yang ada tidak diketahui', 'Masing-masing lempeng ini bergerak dan berubah bentuk serta ukuran secara kontinyu', 'Lempeng-lempeng tersebut tidak diketahui arah pergerakannya', '2016-12-19 02:04:19'),
(281, 36, 3, 1, 'Ilmu yang mempelajari mengenai interaksi antara individu dengan individu, individu dengan kelompok, dan kelompok dengan kelompok dalam masyarakat adalah pengertian dari', 'sosiologi', 'psikologi', 'ekonomi', 'sejarah', '2016-12-19 02:04:19'),
(282, 36, 3, 1, 'Sosiologi didasarkan pada hasil observasi terhadap suatu realitas sosial budaya, tidak spekulatif, dan menggunakan akal sehat. Hal ini menunjukkan bahwa sosiologi bersifat', 'empiris', 'teoritis', 'kumulatif', 'nonetis', '2016-12-19 02:04:19'),
(283, 36, 3, 3, 'Menurut Emile Durkheim, objek kajian sosiologi adalah', 'proses sosiologi', 'hubungan sosial', 'kontrak sosial', 'fakta sosial', '2016-12-19 02:04:19'),
(284, 36, 3, 1, 'Dalam sosiologi tokoh yang sering dianggap sebagai Bapak (pendiri bidang ilmu) adalah', 'auguste comte', 'karl marx', 'emile durkheim', 'max weber', '2016-12-19 02:04:19'),
(285, 36, 3, 2, 'Salah satu contoh kebutuhan hidup mendasar (primer) adalah', 'pendidikan', 'berketurunan', 'rekreasi', 'agama', '2016-12-19 02:04:19'),
(286, 36, 5, 4, 'A: "What kind of the narrative is it?" |\r\nB: "It is...."', 'romance', 'adventure', 'science fiction', 'mystery, folktale', '2016-12-19 02:11:41'),
(287, 36, 5, 1, 'I to the mall last week ', 'went', 'go', 'gone', 'goes', '2016-12-18 11:48:29'),
(288, 36, 5, 4, 'Lisa : Do you mind turning on the fan for me ? | Mita : ', 'no', 'yes', 'I do', 'I''d love to', '2016-12-19 02:11:41'),
(289, 36, 5, 4, 'Dicky : may I can to your house at 7 tonight ? | Anne : ... I will be going somewhere with my friend at that time.', 'yes, thats all right', 'yes, indeed', 'I''m afraid not', 'not at all', '2016-12-19 02:11:41'),
(290, 36, 5, 2, 'Nadia : Hey, Adi Do you have any plans for tomorrow | Adi : No ... Why?', 'I''m planning on mountain climbing', 'nothings come up yet', 'I''m thinking of going to mount salak', 'maybe you can go camping', '2016-12-19 02:11:41'),
(291, 36, 5, 1, 'Ari : Hi, Ari Do you know about the weather for tomorrow? | Adi : ....its going to be hot and sunny.', 'I predict', 'The plan is', 'I''m planning', 'yeah', '2016-12-19 02:11:41'),
(292, 36, 5, 3, 'A : Have you heard that uncle Joe will come next week? | B : Oh. really? When did he tell you? | A : Last week. The underlined sentence is used to express...', 'happniess', 'surprise', 'pleasure', 'enjoyment', '2016-12-19 02:11:41'),
(293, 36, 5, 1, 'I ... a fantastic film at the cinema last week', 'saw', 'seeing', 'seed', 'see', '2016-12-19 02:11:41'),
(294, 36, 5, 2, 'Watch the TV tonight. My daughter is on TV channel 5 at eight. She always makes me happy. Sure, I will. From the underlined words we know that the first speaker feels ... her daughter.', 'angry with', 'proud of', 'worried about', 'dissapointed at', '2016-12-19 02:11:41'),
(295, 36, 5, 3, 'The batik dress mother gave me is old, its colour has faded. Its refers to', 'mother', 'old', 'batik', 'color', '2016-12-19 02:11:41'),
(296, 36, 5, 3, 'I am sorry I dont know the answer, but I really wish I', 'know', 'have known', 'knew', 'will know', '2016-12-19 02:11:41'),
(297, 36, 5, 1, '... you met your friend last Sunday?', 'did', 'do', 'does', 'are', '2016-12-19 02:11:41'),
(298, 36, 5, 1, 'I listen to everything ... he saids', 'which', 'who', 'whom', 'whos', '2016-12-19 02:11:41'),
(299, 36, 5, 2, 'this semester I had to buy fifteen books, most of ... english', 'which is', 'which are', 'whom are', 'whom is', '2016-12-19 02:11:41'),
(300, 36, 5, 4, 'The company hired ten new employees, some of ... men', 'which is', 'which are', 'whom are', 'whom is', '2016-12-19 02:11:41'),
(301, 36, 5, 3, 'My sister, Siska has all her dresses made because', 'she likes sewing', 'she is a dress maker', 'she cannot sew at all', 'she doesnt have a good dressmaker', '2016-12-19 02:11:42'),
(302, 36, 5, 1, 'This area is not suitable for farming because the soil is not ...', 'fertile', 'fertilize', 'fertility', 'fertilizer', '2016-12-19 02:11:42'),
(303, 36, 5, 4, 'May I go shopping with my friends, mom ? No, you ... stay in bed until you recover.', 'may', 'might', 'could', 'must', '2016-12-19 02:11:42'),
(304, 36, 5, 3, 'When do you want to have the parcels ... to you house ? Its better tomorrow morning', 'deliver', 'to deliver', 'delivered', 'delivering', '2016-12-19 02:11:42'),
(305, 36, 5, 1, 'As I see him again, I feel happy. We can also say: ..., I feel happy.', 'seeing him again', 'to see him again', 'having seen him again', 'in seeing him again', '2016-12-19 02:11:42'),
(307, 36, 4, 3, 'Diketahui premis-premis berikut. Jika Yudi rajin belajar maka ia menjadi pandai. Jika Yudi menjadi pandai maka ia lulus ujian. Yudi tidak lulus ujian. Kesimpulan yang sah adalah', 'Yudi rajin belajar', 'Yudi tidak pandai', 'Yudi tidak rajin belajar', 'Yudi pandai', '2016-12-19 01:38:30'),
(308, 36, 4, 3, 'Dari dalam kantong yang berisi 8 kelereng merah dan 10 kelereng putih akan diambil 2 kelereng sekaligus secara acak. Peluang yang terambil 2 kelereng putih adalah', '20/153', '28/153', '45/153', '90/153', '2016-12-19 01:38:31'),
(309, 36, 4, 3, 'Suatu perusahaan menghasilkan x produk dengan biaya sebesar 2 (9000 + 1000x + 10 x^2) rupiah. Jika semua ahasil produk perusahaan tersebut habis dijual dengan harga Rp 5000,00 untuk satu produknya, maka laba maksimum yang dapat diperoleh perusahaan tersebut adalah', 'Rp 149.000,00', 'Rp 249.000,00', 'Rp 391.000,00', 'Rp 757.000,00', '2016-12-19 01:38:31'),
(310, 36, 4, 2, 'Luas daerah yang dibatasi kurva y = 4 - x^2, y = -x + 2, dan 0 <= x <= 2 adalah', '8/3 satuan luas', '10/3 satuan luas', '14/3 satuan luas', '16/3 satuan luas', '2016-12-19 01:38:31'),
(311, 36, 4, 2, 'Suku ke-4 dan ke-9 suatu barisan aritmetika berturut-turut adalah 110 dan 150. Suku ke-30 barisan aritmetika tersebut adalah', '308', '318', '328', '338', '2016-12-19 01:38:31'),
(312, 36, 4, 3, 'Seorang penjual daging pada bulan Januari dapat menjual 120 kg, bulan Februari 130 kg, Maret dan seterusnya selama 10 bulan selalu bertambah 10 kg dari bulan sebelumnya. Jumlah daging yang terjual selama 10 bulan ada ', '1450', '1550', '1650', '1750', '2016-12-19 01:38:31'),
(313, 36, 4, 4, 'Volume benda putar yang terjadi jika daerah yang dibatasi oleh kurva y = x^2, garis y = 2x ? di kuadran I diputar 360 derajat terhadap sumbu x adalah', '30/15 satuan volume', '54/15 satuan volume', '60/15 satuan volume', '64/15 satuan volume', '2016-12-19 01:38:31'),
(314, 36, 4, 4, 'Diketahui prisma segitiga tegak ABC.DEF . Panjang AB = 4 cm, BC = 6 cm, AC = 2 akar 7 cm, dan CF = 8 cm. Volume prisma tersebut adalah', '96 akar 3 cm^3', '96 akar 2 cm^3', '96 cm^3', '48 akar 3 cm^3', '2016-12-19 01:38:31'),
(315, 36, 4, 4, 'Himpunan penyelesaian persamaan cos 2x + cos x= 0 , 0 <= x <= 180 adalah', '{45,120}', '{60,135}', '{60,120}', '{60,180}', '2016-12-19 01:38:31'),
(316, 36, 4, 2, 'Diketahui titik A(5, 1, 3), B(2, -1, -1), C(4, 2, -4). Besar sudut ABC adalah', 'phi', 'phi/2', 'phi/3', 'phi/6', '2016-12-19 01:43:45'),
(317, 36, 4, 1, 'Akar-akar persamaan kuadrat 2x^2 + mx + 16 = 0 adalah a dan b. Jika a = 2b dan a, b positif, maka nilai m adalah', '12', '6', '-6', '-12', '2016-12-19 01:42:55'),
(318, 36, 4, 4, 'Pada suatu hari Pak Ahmad, Pak Badrun, dan Pak Yadi panen jeruk. Hasil kebun Pak Yadi lebih sedikit 15 kg dari hasil kebun Pak Ahmad dan lebih banyak 15 kg dari hasil kebun Pak Badrun. Jika jumlah hasil panen ketiga kebun itu 225 kg, maka hasil panen Pak Ahmad adalah', '70', '75', '80', '90', '2016-12-19 01:42:56'),
(319, 36, 4, 4, 'Pada suatu hari Pak Ahmad, Pak Badrun, dan Pak Yadi panen jeruk. Hasil kebun Pak Yadi lebih sedikit 15 kg dari hasil kebun Pak Ahmad dan lebih banyak 15 kg dari hasil kebun Pak Badrun. Jika jumlah hasil panen ketiga kebun itu 225 kg, maka hasil panen Pak Ahmad adalah', '70', '75', '80', '90', '2016-12-19 01:42:56'),
(320, 36, 4, 3, 'Akar-akar persamaan 3x^2 - 12x + 2 = 0 adalah a dan b. Persamaan kuadrat baru yang akar-akarnya (a+2) dan (b+2) adalah', '-3x^2 - 24x + 38 = 0', '3x^2 - 24x - 38 = 0', '3x^2 - 24x + 38 = 0', '3x^2 + 24x + 38 = 0', '2016-12-19 01:42:56'),
(321, 36, 4, 2, 'Persamaan garis singgung lingkaran x^2 + y^2 - 6x + 4y - 12 = 0 di titik (7,1) adalah', '3x - 4y - 41 = 0', '4x + 3y - 31 = 0', '4x - 5y - 53 = 0', '4x - 3y - 41 = 0', '2016-12-19 01:42:56'),
(322, 36, 4, 2, 'Diketahui premis-premis: (1) Jika hari hujan, maka ibu memakai payung (2) Ibu tidak memakai payung. Penarikan kesimpulan yang sah dari premis-premis tersebut adalah', 'Hari tidak hujan', 'Hari hujan', 'Ibu memakai payung', 'Hari hujan dan Ibu memakai payung', '2016-12-19 01:42:56'),
(323, 36, 4, 3, 'Persamaan bayangan garis y = 2x -3 karena refleksi terhadap garis y = -x, dilanjutkan refleksi terhadap y = x adalah', 'y + 2x +3 = 0', 'y - 2x + 3 = 0', 'y - 2x -3 = 0', '2y - x + 3 = 0', '2016-12-19 01:42:56'),
(324, 36, 4, 3, 'Persamaan bayangan garis y = 2x -3 karena refleksi terhadap garis y = -x, dilanjutkan refleksi terhadap y = x adalah', 'y + 2x +3 = 0', 'y - 2x + 3 = 0', 'y - 2x -3 = 0', '2y - x + 3 = 0', '2016-12-19 01:42:56'),
(325, 36, 4, 2, 'Seorang siswa diwajibkan mengerjakan 8 dari 10 soal, tetapi nomor 1 sampai dengan 4 wajib dikerjakan. Banyaknya pilihan yang harus diambil siswa tersebut ada', '10', '15', '20', '25', '2016-12-19 01:42:56'),
(328, 36, 4, 4, ' 2 + 10 x 4 - 6 : 2 = ', '20', '40', '21', '39', '2016-12-19 02:28:01'),
(335, 70, 1, 2, 'baru', 'baru', 'baru', 'barub', 'baru', '2016-12-23 08:25:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `soaltunggu`
--

CREATE TABLE `soaltunggu` (
  `idsoaltunggu` int(11) NOT NULL,
  `idpengguna` int(64) NOT NULL,
  `idkategori` int(64) NOT NULL,
  `idjawaban` int(64) NOT NULL,
  `soal` varchar(255) NOT NULL,
  `jawabana` char(128) NOT NULL,
  `jawabanb` char(128) NOT NULL,
  `jawabanc` char(128) NOT NULL,
  `jawaband` char(128) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `soaltunggu`
--

INSERT INTO `soaltunggu` (`idsoaltunggu`, `idpengguna`, `idkategori`, `idjawaban`, `soal`, `jawabana`, `jawabanb`, `jawabanc`, `jawaband`, `tanggal`) VALUES
(2, 68, 1, 1, 'hari kartini', '21 april', '22 april', '23 april', '24 april', '2016-12-23 06:03:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `statistikpelajar`
--

CREATE TABLE `statistikpelajar` (
  `idstatistik` int(11) NOT NULL,
  `idpengguna` int(64) NOT NULL,
  `terjawab` int(11) NOT NULL DEFAULT '0',
  `benar` int(11) NOT NULL DEFAULT '0',
  `salah` int(11) NOT NULL DEFAULT '0',
  `skor` int(64) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `statistikpelajar`
--

INSERT INTO `statistikpelajar` (`idstatistik`, `idpengguna`, `terjawab`, `benar`, `salah`, `skor`) VALUES
(30, 61, 160, 95, 85, 475),
(31, 62, 0, 0, 0, 0),
(32, 63, 10, 5, 5, 25),
(33, 64, 10, 10, 0, 50),
(34, 65, 20, 14, 6, 70),
(35, 66, 10, 4, 6, 20),
(36, 67, 70, 39, 31, 195),
(37, 68, 10, 8, 2, 40),
(38, 69, 10, 3, 7, 15),
(39, 70, 10, 2, 8, 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jawaban`
--
ALTER TABLE `jawaban`
  ADD PRIMARY KEY (`idjawaban`);

--
-- Indexes for table `jeniskelamin`
--
ALTER TABLE `jeniskelamin`
  ADD PRIMARY KEY (`idjeniskelamin`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`idkategori`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`idpengguna`),
  ADD UNIQUE KEY `idpengguna` (`idpengguna`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `peran`
--
ALTER TABLE `peran`
  ADD PRIMARY KEY (`idperan`);

--
-- Indexes for table `soal`
--
ALTER TABLE `soal`
  ADD PRIMARY KEY (`idsoal`);

--
-- Indexes for table `soaltunggu`
--
ALTER TABLE `soaltunggu`
  ADD PRIMARY KEY (`idsoaltunggu`);

--
-- Indexes for table `statistikpelajar`
--
ALTER TABLE `statistikpelajar`
  ADD PRIMARY KEY (`idstatistik`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jawaban`
--
ALTER TABLE `jawaban`
  MODIFY `idjawaban` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `jeniskelamin`
--
ALTER TABLE `jeniskelamin`
  MODIFY `idjeniskelamin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `idkategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `idpengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
--
-- AUTO_INCREMENT for table `peran`
--
ALTER TABLE `peran`
  MODIFY `idperan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `soal`
--
ALTER TABLE `soal`
  MODIFY `idsoal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=336;
--
-- AUTO_INCREMENT for table `soaltunggu`
--
ALTER TABLE `soaltunggu`
  MODIFY `idsoaltunggu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `statistikpelajar`
--
ALTER TABLE `statistikpelajar`
  MODIFY `idstatistik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

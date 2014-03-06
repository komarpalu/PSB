
/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `agama` */

DROP TABLE IF EXISTS `agama`;

CREATE TABLE `agama` (
  `agama_id` int(11) NOT NULL AUTO_INCREMENT,
  `agama_nama` varchar(64) NOT NULL,
  `agama_keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`agama_id`),
  UNIQUE KEY `UNIQUE` (`agama_nama`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `agama` */

insert  into `agama`(`agama_id`,`agama_nama`,`agama_keterangan`) values (1,'Islam',NULL),(2,'Katolik',NULL),(3,'Kristen',NULL),(4,'Hindu',NULL),(7,'Budha',NULL),(8,'Konghuchu',NULL);

/*Table structure for table `gelombang` */

DROP TABLE IF EXISTS `gelombang`;

CREATE TABLE `gelombang` (
  `gel_id` int(11) NOT NULL AUTO_INCREMENT,
  `gel_ta` year(4) NOT NULL,
  `gel_kode` int(4) NOT NULL,
  `gel_nama` varchar(128) NOT NULL,
  `gel_tanggal_mulai` date NOT NULL,
  `gel_tanggal_selesai` date NOT NULL,
  `gel_jumlah_pilihan` smallint(2) NOT NULL DEFAULT '1',
  `gel_keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`gel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `gelombang` */

insert  into `gelombang`(`gel_id`,`gel_ta`,`gel_kode`,`gel_nama`,`gel_tanggal_mulai`,`gel_tanggal_selesai`,`gel_jumlah_pilihan`,`gel_keterangan`) values (1,2014,1401,'Gelombang 1','2014-03-08','2014-03-15',2,NULL);

/*Table structure for table `jenis_test` */

DROP TABLE IF EXISTS `jenis_test`;

CREATE TABLE `jenis_test` (
  `jentest_id` int(11) NOT NULL AUTO_INCREMENT,
  `jentest_gel` int(11) DEFAULT NULL,
  `jentest_nama` varchar(64) NOT NULL,
  `jentest_singkatan` char(16) DEFAULT NULL,
  `jentest_persen` decimal(5,2) NOT NULL,
  `jentest_keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`jentest_id`),
  UNIQUE KEY `UNIQUE` (`jentest_nama`,`jentest_gel`),
  KEY `jentest_gel` (`jentest_gel`),
  CONSTRAINT `jentest_gel` FOREIGN KEY (`jentest_gel`) REFERENCES `gelombang` (`gel_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `jenis_test` */

insert  into `jenis_test`(`jentest_id`,`jentest_gel`,`jentest_nama`,`jentest_singkatan`,`jentest_persen`,`jentest_keterangan`) values (1,1,'Test Tertulis','TT',10.00,NULL),(2,1,'Test Orang Tua','TO',20.00,NULL),(3,1,'Test Kepribadian','TK',10.00,NULL);

/*Table structure for table `jurusan` */

DROP TABLE IF EXISTS `jurusan`;

CREATE TABLE `jurusan` (
  `jur_id` int(11) NOT NULL AUTO_INCREMENT,
  `jur_nama` varchar(128) NOT NULL,
  `jur_singkatan` char(16) DEFAULT NULL,
  `jur_no_sk` varchar(255) DEFAULT NULL,
  `jur_tanggal` date DEFAULT NULL,
  `jur_keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`jur_id`),
  UNIQUE KEY `UNIQUE` (`jur_nama`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `jurusan` */

insert  into `jurusan`(`jur_id`,`jur_nama`,`jur_singkatan`,`jur_no_sk`,`jur_tanggal`,`jur_keterangan`) values (1,'Tekni Komputer Jaringan','TKJ',NULL,'2014-03-01',NULL),(2,'Teknik Permesinan','TP',NULL,'2014-03-01',NULL);

/*Table structure for table `kuota` */

DROP TABLE IF EXISTS `kuota`;

CREATE TABLE `kuota` (
  `kuota_id` int(11) NOT NULL AUTO_INCREMENT,
  `kuota_gel` int(11) DEFAULT NULL,
  `kuota_jur` int(11) DEFAULT NULL,
  `kuota_jumlah` int(11) NOT NULL,
  `kuota_cadangan` int(11) NOT NULL,
  `kuota_keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`kuota_id`),
  UNIQUE KEY `UNIQUE` (`kuota_gel`,`kuota_jur`),
  KEY `kuota_jur` (`kuota_jur`),
  CONSTRAINT `kuota_gel` FOREIGN KEY (`kuota_gel`) REFERENCES `gelombang` (`gel_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `kuota_jur` FOREIGN KEY (`kuota_jur`) REFERENCES `jurusan` (`jur_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `kuota` */

insert  into `kuota`(`kuota_id`,`kuota_gel`,`kuota_jur`,`kuota_jumlah`,`kuota_cadangan`,`kuota_keterangan`) values (1,1,1,30,10,NULL),(2,1,2,30,10,NULL);

/*Table structure for table `link` */

DROP TABLE IF EXISTS `link`;

CREATE TABLE `link` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `link_text` varchar(255) NOT NULL,
  `link_url` varchar(255) NOT NULL,
  KEY `link_id` (`link_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `link` */

insert  into `link`(`link_id`,`link_text`,`link_url`) values (1,'Twitter','http://twitter.com/AnggitHerdianto'),(2,'FaceBook','http://facebook.com/AnggitHerdianto');

/*Table structure for table `mata_pelajaran` */

DROP TABLE IF EXISTS `mata_pelajaran`;

CREATE TABLE `mata_pelajaran` (
  `mapel_id` int(11) NOT NULL AUTO_INCREMENT,
  `mapel_gel` int(11) DEFAULT NULL,
  `mapel_nama` varchar(64) NOT NULL,
  `mapel_singkatan` char(16) DEFAULT NULL,
  `mapel_keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mapel_id`),
  UNIQUE KEY `UNIQUE` (`mapel_nama`,`mapel_gel`),
  KEY `mapel_gel` (`mapel_gel`),
  CONSTRAINT `mapel_gel` FOREIGN KEY (`mapel_gel`) REFERENCES `gelombang` (`gel_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `mata_pelajaran` */

insert  into `mata_pelajaran`(`mapel_id`,`mapel_gel`,`mapel_nama`,`mapel_singkatan`,`mapel_keterangan`) values (1,1,'Bahasa Indonesia','BI',NULL),(2,1,'Bahasa Inggris','BING',NULL),(3,1,'Matematika','MAT',NULL),(4,1,'Ilmu Pengetahuan Alam','IPA',NULL);

/*Table structure for table `nilai` */

DROP TABLE IF EXISTS `nilai`;

CREATE TABLE `nilai` (
  `nilai_id` int(11) NOT NULL AUTO_INCREMENT,
  `nilai_siswa` int(11) DEFAULT NULL,
  `nilai_mapel` int(11) DEFAULT NULL,
  `nilai_uan` decimal(5,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`nilai_id`),
  UNIQUE KEY `UNIQUE` (`nilai_siswa`,`nilai_mapel`),
  KEY `nilai_siswa` (`nilai_siswa`),
  KEY `nilai_mapel` (`nilai_mapel`),
  CONSTRAINT `nilai_mapel` FOREIGN KEY (`nilai_mapel`) REFERENCES `mata_pelajaran` (`mapel_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `nilai_siswa` FOREIGN KEY (`nilai_siswa`) REFERENCES `siswa` (`siswa_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `nilai` */

insert  into `nilai`(`nilai_id`,`nilai_siswa`,`nilai_mapel`,`nilai_uan`) values (1,1,1,10.00),(2,1,2,10.00),(3,1,3,10.00),(4,1,4,10.00),(5,2,1,10.00),(6,2,2,10.00),(7,2,3,10.00),(8,2,4,10.00),(9,3,1,10.00),(10,3,2,10.00),(11,3,3,10.00),(12,3,4,10.00),(13,4,1,10.00),(14,4,2,10.00),(15,4,3,10.00),(16,4,4,10.00);

/*Table structure for table `orang_tua` */

DROP TABLE IF EXISTS `orang_tua`;

CREATE TABLE `orang_tua` (
  `ot_id` int(11) NOT NULL AUTO_INCREMENT,
  `ot_siswa` int(11) DEFAULT NULL,
  `ot_nama_ayah` varchar(255) DEFAULT NULL,
  `ot_pend_ayah` int(11) DEFAULT NULL,
  `ot_pek_ayah` int(11) DEFAULT NULL,
  `ot_gaji_ayah` char(16) DEFAULT NULL,
  `ot_hp_ayah` varchar(16) DEFAULT NULL,
  `ot_nama_ibu` varchar(255) DEFAULT NULL,
  `ot_pend_ibu` int(11) DEFAULT NULL,
  `ot_pek_ibu` int(11) DEFAULT NULL,
  `ot_gaji_ibu` char(16) DEFAULT NULL,
  `ot_hp_ibu` varchar(16) DEFAULT NULL,
  `ot_alamat_ortu` varchar(255) DEFAULT NULL,
  `ot_nama_wali` varchar(255) DEFAULT NULL,
  `ot_pend_wali` int(11) DEFAULT NULL,
  `ot_pek_wali` int(11) DEFAULT NULL,
  `ot_gaji_wali` char(16) DEFAULT NULL,
  `ot_hp_wali` varchar(16) DEFAULT NULL,
  `ot_alamat_wali` varchar(255) DEFAULT NULL,
  `ot_status_asuh` enum('ortu','wali') DEFAULT 'ortu',
  PRIMARY KEY (`ot_id`),
  UNIQUE KEY `UNIQUE` (`ot_siswa`),
  KEY `ot_siswa` (`ot_siswa`),
  KEY `ot_pen_ayah` (`ot_pend_ayah`),
  KEY `ot_pen_ibu` (`ot_pend_ibu`),
  KEY `ot_pen_wali` (`ot_pend_wali`),
  KEY `ot_pek_ayah` (`ot_pek_ayah`),
  KEY `ot_pek_ibu` (`ot_pek_ibu`),
  KEY `ot_pek_wali` (`ot_pek_wali`),
  CONSTRAINT `ot_pek_ayah` FOREIGN KEY (`ot_pek_ayah`) REFERENCES `pekerjaan` (`pek_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ot_pek_ibu` FOREIGN KEY (`ot_pek_ibu`) REFERENCES `pekerjaan` (`pek_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ot_pek_wali` FOREIGN KEY (`ot_pek_wali`) REFERENCES `pekerjaan` (`pek_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ot_pen_ayah` FOREIGN KEY (`ot_pend_ayah`) REFERENCES `pendidikan` (`pend_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ot_pen_ibu` FOREIGN KEY (`ot_pend_ibu`) REFERENCES `pendidikan` (`pend_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ot_pen_wali` FOREIGN KEY (`ot_pend_wali`) REFERENCES `pendidikan` (`pend_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ot_siswa` FOREIGN KEY (`ot_siswa`) REFERENCES `siswa` (`siswa_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `orang_tua` */

insert  into `orang_tua`(`ot_id`,`ot_siswa`,`ot_nama_ayah`,`ot_pend_ayah`,`ot_pek_ayah`,`ot_gaji_ayah`,`ot_hp_ayah`,`ot_nama_ibu`,`ot_pend_ibu`,`ot_pek_ibu`,`ot_gaji_ibu`,`ot_hp_ibu`,`ot_alamat_ortu`,`ot_nama_wali`,`ot_pend_wali`,`ot_pek_wali`,`ot_gaji_wali`,`ot_hp_wali`,`ot_alamat_wali`,`ot_status_asuh`) values (1,1,NULL,2,1,NULL,NULL,NULL,2,1,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,'ortu'),(2,2,NULL,2,1,NULL,NULL,NULL,2,1,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,'ortu'),(3,3,NULL,2,1,NULL,NULL,NULL,2,1,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,'ortu'),(4,4,NULL,2,1,NULL,NULL,NULL,2,1,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,'ortu');

/*Table structure for table `pekerjaan` */

DROP TABLE IF EXISTS `pekerjaan`;

CREATE TABLE `pekerjaan` (
  `pek_id` int(11) NOT NULL AUTO_INCREMENT,
  `pek_nama` varchar(64) NOT NULL,
  `pek_keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pek_id`),
  UNIQUE KEY `UNIQUE` (`pek_nama`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `pekerjaan` */

insert  into `pekerjaan`(`pek_id`,`pek_nama`,`pek_keterangan`) values (1,'PNS',NULL),(2,'Swasta',NULL),(3,'TNI/POLRI',NULL),(4,'Petani',NULL),(5,'Wiraswasta',NULL),(6,'Buruh',NULL),(7,'Lain-Lain',NULL);

/*Table structure for table `pendidikan` */

DROP TABLE IF EXISTS `pendidikan`;

CREATE TABLE `pendidikan` (
  `pend_id` int(11) NOT NULL AUTO_INCREMENT,
  `pend_nama` varchar(64) NOT NULL,
  `pend_keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pend_id`),
  UNIQUE KEY `UNIQUE` (`pend_nama`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `pendidikan` */

insert  into `pendidikan`(`pend_id`,`pend_nama`,`pend_keterangan`) values (1,'Tidak Tamat SD',NULL),(2,'SD',NULL),(3,'SMP',NULL),(4,'SMA',NULL),(5,'Diploma 1',NULL),(6,'Diploma 2',NULL),(7,'Diploma 3',NULL),(8,'S1',NULL),(9,'S2',NULL),(10,'S3',NULL);

/*Table structure for table `pilihan` */

DROP TABLE IF EXISTS `pilihan`;

CREATE TABLE `pilihan` (
  `pilihan_id` int(11) NOT NULL AUTO_INCREMENT,
  `pilihan_siswa` int(11) DEFAULT NULL,
  `pilihan_jur` int(11) DEFAULT NULL,
  `pilihan_ke` smallint(1) NOT NULL,
  `pilihan_status` enum('kosong','diterima','cadangan','ditolak') DEFAULT 'kosong',
  PRIMARY KEY (`pilihan_id`),
  UNIQUE KEY `UNIQUE` (`pilihan_siswa`,`pilihan_ke`),
  KEY `pilihan_siswa` (`pilihan_siswa`),
  KEY `pilihan_jur` (`pilihan_jur`),
  CONSTRAINT `pilihan_jur` FOREIGN KEY (`pilihan_jur`) REFERENCES `jurusan` (`jur_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pilihan_siswa` FOREIGN KEY (`pilihan_siswa`) REFERENCES `siswa` (`siswa_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `pilihan` */

insert  into `pilihan`(`pilihan_id`,`pilihan_siswa`,`pilihan_jur`,`pilihan_ke`,`pilihan_status`) values (1,1,1,1,'diterima'),(2,1,2,2,'kosong'),(3,1,NULL,3,'kosong'),(4,2,1,1,'diterima'),(5,2,2,2,'kosong'),(6,2,NULL,3,'kosong'),(7,3,1,1,'diterima'),(8,3,2,2,'kosong'),(9,3,NULL,3,'kosong'),(10,4,1,1,'kosong'),(11,4,2,2,'kosong'),(12,4,NULL,3,'kosong');

/*Table structure for table `post` */

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_judul` text NOT NULL,
  `post_link` text NOT NULL,
  `post_isi` longtext,
  `post_user` int(11) DEFAULT NULL,
  `post_tanggal` date DEFAULT NULL,
  KEY `post_id` (`post_id`),
  KEY `post_user` (`post_user`),
  CONSTRAINT `post_user` FOREIGN KEY (`post_user`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `post` */

insert  into `post`(`post_id`,`post_judul`,`post_link`,`post_isi`,`post_user`,`post_tanggal`) values (1,'Helo','helo','<p style=\"text-align: justify;\">Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello</p>',1,'2014-03-01');

/*Table structure for table `prestasi` */

DROP TABLE IF EXISTS `prestasi`;

CREATE TABLE `prestasi` (
  `prestasi_id` int(11) NOT NULL AUTO_INCREMENT,
  `prestasi_siswa` int(11) DEFAULT NULL,
  `prestasi_nilai` decimal(5,1) DEFAULT '0.0',
  PRIMARY KEY (`prestasi_id`),
  KEY `prestasi_siswa` (`prestasi_siswa`),
  CONSTRAINT `prestasi_siswa` FOREIGN KEY (`prestasi_siswa`) REFERENCES `siswa` (`siswa_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `prestasi` */

insert  into `prestasi`(`prestasi_id`,`prestasi_siswa`,`prestasi_nilai`) values (1,1,NULL),(2,2,NULL),(3,3,NULL),(4,4,NULL);

/*Table structure for table `provinsi` */

DROP TABLE IF EXISTS `provinsi`;

CREATE TABLE `provinsi` (
  `prov_id` int(11) NOT NULL AUTO_INCREMENT,
  `prov_nama` varchar(64) NOT NULL,
  `prov_pulau` varchar(64) DEFAULT NULL,
  `prov_keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`prov_id`),
  UNIQUE KEY `UNIQUE` (`prov_nama`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `provinsi` */

insert  into `provinsi`(`prov_id`,`prov_nama`,`prov_pulau`,`prov_keterangan`) values (1,'Jawa Tengah','Jawa','Semarang'),(2,'Sumatera Utara','Sumatera','Medan'),(3,'Sumatera Barat','Sumatera','Padang'),(4,'Riau','Sumatera','Pekan Baru'),(5,'Kepulauan Riau','Sumatera','Tanjung Pinang'),(6,'Jambi','Sumatera','Jambi'),(7,'Sumatera Selatan','Sumatera','Palembang'),(8,'Bangka Belitung','Sumatera','Pangkal Pinang'),(9,'Bengkulu','Sumatera','Bengkulu'),(10,'Lampung','Sumatera','Bandar Lampung'),(11,'DKI Jakarta','Jawa','Jakarta'),(12,'Jawa Barat','Jawa','Bandung'),(13,'Banten','Jawa','Serang'),(14,'Daerah Istimewa Yogyakarta','Jawa','Yogyakarta'),(15,'Nanggro Aceh Darussalam','Sumatera','Banda Aceh'),(16,'Jawa Timur','Jawa','Surabaya'),(17,'Bali','Bali','Denpasar'),(18,'Nusa Tenggara Barat','Nusa Tenggara','Mataram'),(19,'Nusa Tenggara Timur','Nusa Tenggara','Kupang'),(20,'Kalimantan Barat','Kalimantan','Pontianak'),(21,'Kalimantan Tengah','Kalimantan','Palangkaraya'),(22,'Kalimantan Selatan','Kalimantan','Banjarmasin'),(23,'Kalimantan Timur','Kalimantan','Samarinda'),(24,'Sulawesi Utara','Sulawesi','Manado'),(25,'Sulawesi Barat','Sulawesi','Kota Mamuju'),(26,'Sulawesi Tengah','Sulawesi','Palu'),(27,'Sulawesi Tenggara','Sulawesi','Kendari'),(28,'Sulawesi Selatan','Sulawesi','Makassar'),(29,'Gorontalo','Sulawesi','Gorontalo'),(30,'Maluku','Maluku','Ambon'),(31,'Maluku Utara','Maluku','Ternate'),(32,'Papua Barat','Papua','Kota Manokwari'),(33,'Papua','Papua','Jayapura'),(34,'Kepulauan Bangka Belitung','Kepulauan Bangka Belitung','');

/*Table structure for table `reset_pass` */

DROP TABLE IF EXISTS `reset_pass`;

CREATE TABLE `reset_pass` (
  `reset_id` int(11) NOT NULL AUTO_INCREMENT,
  `reset_users` int(11) DEFAULT NULL,
  `reset_link` varchar(255) DEFAULT NULL,
  `reset_input` datetime DEFAULT NULL,
  `reset_expired` datetime DEFAULT NULL,
  KEY `reset_id` (`reset_id`),
  KEY `reset_users` (`reset_users`),
  CONSTRAINT `reset_users` FOREIGN KEY (`reset_users`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `reset_pass` */

/*Table structure for table `sessions` */

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sessions` */

insert  into `sessions`(`session_id`,`ip_address`,`user_agent`,`last_activity`,`user_data`) values ('00007b9022f979f6e2b33f037c05aa0f','::1','Mozilla/5.0 (Windows NT 6.2; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0',1393693523,'a:3:{s:9:\"user_data\";s:0:\"\";s:5:\"login\";s:88:\"VsXI1tQtTTGfELvtX0spMNpDaSUm4gn0FsdFQT97QI00ylfI/I/1M+fbSlHa8bmzLma4pdWXgpn6mJk3wP9qWQ==\";s:7:\"user_id\";s:88:\"d7P7p/tDSOtOzv8PFjA1OhnPvJdvmCRO5SWpARYAbDZTFvvn5nYyCisHbKhKienjc3QaWeKYm31hON61NQpjbA==\";}');

/*Table structure for table `setting` */

DROP TABLE IF EXISTS `setting`;

CREATE TABLE `setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `setting_nama` char(128) DEFAULT NULL,
  `setting_value` varchar(255) DEFAULT NULL,
  UNIQUE KEY `UNIQUE` (`setting_nama`),
  KEY `setting_id` (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `setting` */

insert  into `setting`(`setting_id`,`setting_nama`,`setting_value`) values (1,'web_judul','Penerimaan Siswa Baru'),(2,'sekolah_nama','SMK Maju Jaya'),(3,'sekolah_alamat','Jl. Maju Jaya No 123'),(4,'sekolah_telpon','(0123)-123456'),(5,'sekolah_email','noreply@localhost.com');

/*Table structure for table `siswa` */

DROP TABLE IF EXISTS `siswa`;

CREATE TABLE `siswa` (
  `siswa_id` int(11) NOT NULL AUTO_INCREMENT,
  `siswa_gel` int(11) NOT NULL,
  `siswa_no_pendaftaran` int(8) NOT NULL,
  `siswa_nama` varchar(128) NOT NULL,
  `siswa_nama_panggilan` varchar(32) DEFAULT NULL,
  `siswa_jenis_kelamin` enum('l','p') DEFAULT 'l',
  `siswa_tempat_lahir` varchar(64) NOT NULL,
  `siswa_tanggal_lahir` date NOT NULL,
  `siswa_agama` int(11) DEFAULT NULL,
  `siswa_suku` varchar(64) DEFAULT NULL,
  `siswa_sekolah_asal` varchar(128) NOT NULL,
  `siswa_sekolah_alamat` varchar(255) DEFAULT NULL,
  `siswa_jumlah_saudara` int(2) DEFAULT NULL,
  `siswa_alamat` varchar(255) DEFAULT NULL,
  `siswa_prov` int(11) DEFAULT NULL,
  `siswa_kabupaten` varchar(64) DEFAULT NULL,
  `siswa_kecamatan` varchar(64) DEFAULT NULL,
  `siswa_kode_pos` char(16) DEFAULT NULL,
  `siswa_alamat_pos` varchar(255) DEFAULT NULL,
  `siswa_telepon` char(16) DEFAULT NULL,
  `siswa_hp` char(16) DEFAULT NULL,
  `siswa_email` varchar(128) DEFAULT NULL,
  `siswa_gol_darah` enum('none','a','b','ab','o') DEFAULT 'none',
  `siswa_anak_ke` int(2) DEFAULT NULL,
  `siswa_tinggi_badan` char(16) DEFAULT NULL,
  `siswa_berat_badan` char(16) DEFAULT NULL,
  `siswa_penyakit` varchar(255) DEFAULT NULL,
  `siswa_tanggal_daftar` date DEFAULT NULL,
  `siswa_status` enum('blm_dicek','sdh_dicek') NOT NULL DEFAULT 'blm_dicek',
  `siswa_ulang` enum('sudah','belum') DEFAULT 'belum',
  `siswa_tanggal_ulang` date DEFAULT NULL,
  `siswa_keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`siswa_id`),
  UNIQUE KEY `UNIQUE` (`siswa_no_pendaftaran`),
  KEY `siswa_agama` (`siswa_agama`),
  KEY `siswa_suku` (`siswa_suku`),
  KEY `siswa_prov` (`siswa_prov`),
  KEY `siswa_gel` (`siswa_gel`),
  CONSTRAINT `siswa_agama` FOREIGN KEY (`siswa_agama`) REFERENCES `agama` (`agama_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `siswa_gel` FOREIGN KEY (`siswa_gel`) REFERENCES `gelombang` (`gel_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `siswa_prov` FOREIGN KEY (`siswa_prov`) REFERENCES `provinsi` (`prov_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `siswa` */

insert  into `siswa`(`siswa_id`,`siswa_gel`,`siswa_no_pendaftaran`,`siswa_nama`,`siswa_nama_panggilan`,`siswa_jenis_kelamin`,`siswa_tempat_lahir`,`siswa_tanggal_lahir`,`siswa_agama`,`siswa_suku`,`siswa_sekolah_asal`,`siswa_sekolah_alamat`,`siswa_jumlah_saudara`,`siswa_alamat`,`siswa_prov`,`siswa_kabupaten`,`siswa_kecamatan`,`siswa_kode_pos`,`siswa_alamat_pos`,`siswa_telepon`,`siswa_hp`,`siswa_email`,`siswa_gol_darah`,`siswa_anak_ke`,`siswa_tinggi_badan`,`siswa_berat_badan`,`siswa_penyakit`,`siswa_tanggal_daftar`,`siswa_status`,`siswa_ulang`,`siswa_tanggal_ulang`,`siswa_keterangan`) values (1,1,14010001,'Test',NULL,'l','Test','1998-05-25',1,NULL,'Test',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'none',NULL,NULL,NULL,NULL,'2014-03-02','sdh_dicek','belum',NULL,NULL),(2,1,14010002,'Test',NULL,'l','Test','1998-05-25',1,NULL,'Test',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'none',NULL,NULL,NULL,NULL,'2014-03-02','sdh_dicek','belum',NULL,NULL),(3,1,14010003,'Test',NULL,'l','Test','1998-05-25',1,NULL,'Test',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'none',NULL,NULL,NULL,NULL,'2014-03-02','sdh_dicek','belum',NULL,NULL),(4,1,14010004,'Test',NULL,'l','Test','1998-05-25',1,NULL,'Test',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'none',NULL,NULL,NULL,NULL,'2014-03-02','blm_dicek','belum',NULL,NULL);

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `test_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_siswa` int(11) DEFAULT NULL,
  `test_jentest` int(11) DEFAULT NULL,
  `test_nilai` decimal(5,2) DEFAULT '0.00',
  PRIMARY KEY (`test_id`),
  UNIQUE KEY `UNIQUE` (`test_siswa`,`test_jentest`),
  KEY `test_siswa` (`test_siswa`),
  KEY `test_jenis` (`test_jentest`),
  CONSTRAINT `test_jenis` FOREIGN KEY (`test_jentest`) REFERENCES `jenis_test` (`jentest_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `test_siswa` FOREIGN KEY (`test_siswa`) REFERENCES `siswa` (`siswa_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `test` */

insert  into `test`(`test_id`,`test_siswa`,`test_jentest`,`test_nilai`) values (1,1,1,NULL),(2,1,2,NULL),(3,1,3,NULL),(4,2,1,NULL),(5,2,2,NULL),(6,2,3,NULL),(7,3,1,NULL),(8,3,2,NULL),(9,3,3,NULL),(10,4,1,NULL),(11,4,2,NULL),(12,4,3,NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_username` varchar(128) NOT NULL,
  `user_password` varchar(32) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_pangkat` enum('admin','user') NOT NULL DEFAULT 'user',
  `user_nama` varchar(128) DEFAULT NULL,
  `user_tanggal` date DEFAULT NULL,
  `user_keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UNIQUE` (`user_username`,`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`user_id`,`user_username`,`user_password`,`user_email`,`user_pangkat`,`user_nama`,`user_tanggal`,`user_keterangan`) values (1,'admin','0c7540eb7e65b553ec1ba6b20de79608','admin@localhost.com','admin','Nama Saya Admin','2014-03-01','Nama Saya Admin');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

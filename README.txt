##################################################
PSB-214-3
Penerimaan Siswa Baru
##################################################

##################################################
Petunjuk Instalasi
1. Extract semua file dan letakan diserver.
2. Buat database kosong kemudian restore file "psb.sql" ke databse yang telah dibuat tadi.
3. Buka file "/psb-application/config/database.php", 
   rubah baris di bawah ini sesuai dengan konfigurasi server.
   
   $db['default']['hostname'] = 'localhost';
   $db['default']['username'] = 'root';
   $db['default']['password'] = '';
   $db['default']['database'] = 'psb';
   $db['default']['dbdriver'] = 'mysql';
   $db['default']['dbprefix'] = '';
   $db['default']['pconnect'] = TRUE;
   $db['default']['db_debug'] = TRUE;
   $db['default']['cache_on'] = FALSE;
   $db['default']['cachedir'] = '';
   $db['default']['char_set'] = 'utf8';
   $db['default']['dbcollat'] = 'utf8_general_ci';
   $db['default']['swap_pre'] = '';
   $db['default']['autoinit'] = TRUE;
   $db['default']['stricton'] = FALSE;

4. Buka alamat berikut ini untuk login "localhost.com/psb-admin".
5. Untuk login pertama kali, masukan username "admin" dan password "admin".
##################################################

##################################################
Anggit Herdianto
http://twitter.com/AnggitHerdianto
http://facebook.com/AnggitHerdianto
##################################################
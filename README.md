### PSB
Sofware Penerimaan Siswa Baru untuk SMK

### VERSI
psb-214-3

## PETUNJUK INSTALASI
1. Extract semua file dan letakan diserver.

2. Buat database kosong kemudian restore file "psb.sql" ke databse yang telah dibuat tadi.

3. Buka file "/psb-application/config/database.php", kemuadian rubah baris di bawah ini sesuai dengan konfigurasi server.
   
   $db['default']['hostname'] = 'localhost';
   
   $db['default']['username'] = 'root';
   
   $db['default']['password'] = '';
   
   $db['default']['database'] = 'psb';
   
   ...

4. Buka alamat berikut ini untuk login "localhost.com/psb-admin".

5. Untuk login pertama kali, masukan username "admin" dan password "admin".

### PENGEMBANG
Anggit Herdianto 

[Facebook](http://twitter.com/AnggitHerdianto) [Twitter](http://facebook.com/AnggitHerdianto)


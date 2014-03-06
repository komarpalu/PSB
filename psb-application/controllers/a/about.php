<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class About extends CI_Controller {
   function __construct(){
      parent::__construct();
      if(!is_login()) redirect('a/login/index/loginfalse/'.encode(uri_string()));
      date_default_timezone_set('Asia/Jakarta');
   }
   function index(){
      $data['url'] = array('a', __CLASS__, __FUNCTION__);
      $data['judul'] = 'Informasi Pengembang';
      $data['notice'] = array('', '');
      $data['msg'] = 'Sofware ini dibuat oleh R. Anggit Herdianto';
      $this->load->view(view('a', 'view_about'), $data);
   }
   function software(){
      $data['url'] = array('a', __CLASS__, __FUNCTION__);
      $data['judul'] = 'Informasi Software';
      $data['notice'] = array('', '');
      $data['msg'] = 'Sofware Penerimaan Siswa Baru';
      $this->load->view(view('a', 'view_about'), $data);
   }
}
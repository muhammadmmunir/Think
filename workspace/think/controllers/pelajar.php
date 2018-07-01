<?php

class Pelajar extends Controller {

	function __construct(){
		parent::__construct();
		Auth::handleLogin();
		
		$this->view->js = array('pelajar/js/pelajar.js');
	}

	function index(){
		$this->view->render('pelajar/index');
	}

	function choose(){
		Session::unset('nomor');
  		Session::unset('jawabanbenar');
  		Session::unset('soal');
		$this->view->render('pelajar/choose');
	}

	public function prepare($idkategori = false){
		if($idkategori==false){
			header('location: '.URL.'pelajar/choose');
		}else{
			$idpelajar = Session::get('idpengguna');
			$this->view->statistik = $this->model->getStatistik($idpelajar);

			if($idkategori==1){
				$this->view->selection = 'Pengetahuan Umum';
			}elseif($idkategori==2){
				$this->view->selection = 'Ilmu Pengetahuan Alam';
			}elseif($idkategori==3){
				$this->view->selection = 'Ilmu Pengetahuan Sosial';
			}elseif($idkategori==4){
				$this->view->selection = 'Matematika';
			}elseif($idkategori==5){
				$this->view->selection = 'Bahasa Inggris';
			}elseif($idkategori==6){
				$this->view->selection = 'Bahasa Indonesia';
			}
			$this->view->idKategori = $idkategori;
			$this->view->render('pelajar/prepare');		
		}
	}

	
	public function finalscore(){
		$idpelajar = Session::get('idpengguna');
		$statistik = $this->model->getStatistik($idpelajar);

  		$updateScore = array();
  		$updateScore['idstatistik'] = $statistik[0]['idstatistik'];
  		$updateScore['idpengguna'] = $idpelajar;
  		$updateScore['terjawab'] = $statistik[0]['terjawab'] + Session::get('nomor');
  		$updateScore['benar'] = $statistik[0]['benar'] + Session::get('jawabanbenar');
  		$salah = 10 - Session::get('jawabanbenar');
  		$updateScore['salah'] = $statistik[0]['salah'] + $salah;
  		$updateScore['skor'] = $updateScore['benar'] * 5;

  		$this->model->updateScore($updateScore);
		$newStatistik = $this->model->getStatistik($idpelajar);  		

		$this->view->terjawab = $newStatistik[0]['terjawab'];
  		$this->view->benar = $newStatistik[0]['benar'];
  		$this->view->salah = $newStatistik[0]['salah'];
  		$this->view->skor = $newStatistik[0]['skor'];

  		Session::unset('nomor');
  		Session::unset('jawabanbenar');
  		Session::unset('soal');
		$this->view->render('pelajar/finalscore');
	}
	
	public function run($id = false){

		$this->view->js = array('pelajar/js/run.js');
		if(!isset($_SESSION['kategori'])){
			header('location: '.URL.'pelajar/choose');
		}
		if($id){
			$this->model->kategori($id);
			if(!Session::get('soal')){
				Session::set('soal', $this->model->randomSoal(Session::get('kategori')));
			}
			header('location: '.URL.'pelajar/run');
		}else{
			if(!Session::get('nomor')){
				Session::set('nomor', 0);
				Session::set('jawabanbenar', 0);
			}else{
 				if(isset($_POST['submit'])){
 					if($_POST['submit']=='SOAL SELANJUTNYA' && isset($_POST['jawaban']) ){
 						if($_POST['jawaban'] == Session::get('soal',Session::get('nomor')-1,'jawaban')){
  							Session::set('jawabanbenar',(Session::get('jawabanbenar')+1));		
  						}
  						Session::set('nomor',(Session::get('nomor')+1));		
 					}else if($_POST['submit']=='HASIL' && isset($_POST['jawaban'])){
 						if($_POST['jawaban']==Session::get('soal',Session::get('nomor')-1,'jawaban')){
  							Session::set('jawabanbenar',(Session::get('jawabanbenar')+1));		
  						}
  						header('location: '.URL.'pelajar/finalscore');
 					}
 				}
			}

			$this->view->nomor = Session::get('nomor') == 0 ? 1 : Session::get('nomor');
			
			if(Session::get('nomor') < 10){
				$this->view->tombolsubmit = 'SOAL SELANJUTNYA';
			}else{
				$this->view->tombolsubmit = 'HASIL';
			}
			if(Session::get('nomor') == 0){
				Session::set('nomor',(Session::get('nomor')+1));	
				$this->view->index = 0;
			}else{
				$this->view->index = Session::get('nomor')-1;
			}
			$this->view->render('pelajar/run');	
		}
	}

	function leaders(){
		$this->view->leaders = $this->model->getLeaders();		
		$this->view->render('pelajar/leaders');
	}

	function upload(){
		
		$data = array();
		$data['idpengguna'] = Session::get('idpengguna');
		$data['kategori'] = $_POST['kategori'];
		$data['soal'] = $_POST['soal'];
		$data['jawabana'] = $_POST['jawabana'];
		$data['jawabanb'] = $_POST['jawabanb'];
		$data['jawabanc'] = $_POST['jawabanc'];
		$data['jawaband'] = $_POST['jawaband'];
		$data['jawaban'] = $_POST['rekomjawaban'];
		$data['tanggal'] = date("Y-m-d H:i:s",time());

		$this->model->create($data);
		header('location: ' . URL . 'pelajar');
	}

	function logout(){

		Session::destroy();
		header('location: ' . URL . 'guest/login');
		exit;
	}
}
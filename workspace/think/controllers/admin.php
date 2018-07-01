<?php

class Admin extends Controller {

	function __construct(){
		parent::__construct();
		Auth::handleLogin();

		$this->view->js = array('admin/js/admin.js');
	}

	function index(){

		$this->view->render('admin/index');
	}

	function soal(){

		$this->view->recom = false;
		$this->view->soalList = $this->model->soalList();
		$this->view->render('admin/soal');
	}

	function recomSoal(){

		$this->view->recom = true;
		$this->view->soalList = $this->model->recomList();
		$this->view->render('admin/soal');	
	}

	function create(){

		$data = array();
		$data['idpengguna'] = Session::get('idpengguna');
		$data['kategori'] = $_POST['kategori'];
		$data['soal'] = $_POST['soal'];
		$data['jawabana'] = $_POST['jawabana'];
		$data['jawabanb'] = $_POST['jawabanb'];
		$data['jawabanc'] = $_POST['jawabanc'];
		$data['jawaband'] = $_POST['jawaband'];
		$data['jawaban'] = $_POST['jawaban'];
		$data['tanggal'] = date("Y-m-d H:i:s",time());

		$this->model->create($data);
		header('location: ' . URL . 'admin/soal');
	}	

	public function editSave($id){

		$data = array();
		$data['idpengguna'] = Session::get('idpengguna');
		$data['updateidsoal'] = $_POST['updateidsoal'];
		$data['kategori'] = $_POST['updatekategori'];
		$data['soal'] = $_POST['updatesoal'];
		$data['jawabana'] = $_POST['jawabana'];
		$data['jawabanb'] = $_POST['jawabanb'];
		$data['jawabanc'] = $_POST['jawabanc'];
		$data['jawaband'] = $_POST['jawaband'];
		$data['jawaban'] = $_POST['updatejawaban'];
		$data['tanggal'] = date("Y-m-d H:i:s",time());

		$this->model->editSave($data);
		header('location: ' . URL . 'admin/soal');
	}

	public function recomEditSave($id){
		
		$data = array();
		$data['updateidsoal'] = $_POST['updateidsoal'];
		$data['kategori'] = $_POST['updatekategori'];
		$data['soal'] = $_POST['updatesoal'];
		$data['jawabana'] = $_POST['jawabana'];
		$data['jawabanb'] = $_POST['jawabanb'];
		$data['jawabanc'] = $_POST['jawabanc'];
		$data['jawaband'] = $_POST['jawaband'];
		$data['jawaban'] = $_POST['updatejawaban'];
		$data['tanggal'] = date("Y-m-d H:i:s",time());

		$this->model->recomEditSave($data);
		header('location: ' . URL . 'admin/recomSoal');
	}

	public function delete($id){

		$this->model->delete($id);
		header('location: ' . URL . 'admin/soal');
	}

	public function recomDelete($id){
		
		$this->model->recomDelete($id);
		header('location: ' . URL . 'admin/recomSoal');
	}

	public function recomInsert($id){
		$this->model->recomInsert($id);
		header('location: ' . URL . 'admin/recomSoal');
	}

	function logout(){

		Session::destroy();
		header('location: ' . URL . 'guest/login');
		exit;
	}
}

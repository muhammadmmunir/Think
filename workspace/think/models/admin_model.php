<?php

class Admin_Model extends Model{

	function __construct(){
		parent::__construct();
	}

	public function soalList(){

		return $this->db->select('SELECT s.idsoal, p.username, k.kategori, j.jawaban, s.soal, s.jawabana, 
			s.jawabanb, s.jawabanc, s.jawaband, s.tanggal FROM soal s join pengguna p join kategori k join jawaban j ON 
			s.idpengguna = p.idpengguna AND s.idkategori = k.idkategori AND s.idjawaban = j.idjawaban 
			ORDER BY s.idsoal ASC');
	}

	public function recomList(){

		return $this->db->select('SELECT s.idsoaltunggu, p.username, k.kategori, j.jawaban, s.soal, s.jawabana, s.jawabanb, s.jawabanc, s.jawaband, s.tanggal FROM soaltunggu s join pengguna p join kategori k join jawaban j ON 
			s.idpengguna = p.idpengguna AND 
			s.idkategori = k.idkategori AND 
			s.idjawaban = j.idjawaban');
	}

	public function recomInsert($id){	
		
		$column = array('idpengguna' => 'idpengguna','idkategori' =>'idkategori',
			'idjawaban'=>'idjawaban','soal'=>'soal','jawabana'=>'jawabana',
			'jawabanb'=>'jawabanb','jawabanc'=>'jawabanc','jawaband'=>'jawaband',
			'tanggal'=>'tanggal');

		$this->db->insertFrom('soaltunggu', 'soal', $column, 
			'idsoaltunggu',$id);
		$this->db->delete('soaltunggu', "idsoaltunggu = $id");
	}

	public function create($data){

		$this->db->insert('soal', array(
			'idpengguna' => $data['idpengguna'],
			'idkategori' => $data['kategori'],
			'idjawaban' => $data['jawaban'],
			'soal' => $data['soal'],
			'jawabana' => $data['jawabana'],
			'jawabanb' => $data['jawabanb'],
			'jawabanc' => $data['jawabanc'],
			'jawaband' => $data['jawaband'],
			'tanggal' => $data['tanggal']
		));
	}

	public function editSave($data){

		$postData = array(
			'idpengguna' => $data['idpengguna'],
			'idkategori' => $data['kategori'],
			'idjawaban' => $data['jawaban'],
			'soal' => $data['soal'],
			'jawabana' => $data['jawabana'],
			'jawabanb' => $data['jawabanb'],
			'jawabanc' => $data['jawabanc'],
			'jawaband' => $data['jawaband'],
			'tanggal' => $data['tanggal']
		);	

		$this->db->update('soal',$postData, "`idsoal` = {$data['updateidsoal']}");
	}

	public function recomEditSave($data){

		$postData = array(
			'idkategori' => $data['kategori'],
			'idjawaban' => $data['jawaban'],
			'soal' => $data['soal'],
			'jawabana' => $data['jawabana'],
			'jawabanb' => $data['jawabanb'],
			'jawabanc' => $data['jawabanc'],
			'jawaband' => $data['jawaband'],
			'tanggal' => $data['tanggal']
		);	

		$this->db->update('soaltunggu',$postData, "`idsoaltunggu` = {$data['updateidsoal']}");

	}	

	public function delete($id){

		$result = $this->db->select('SELECT p.peran FROM soal s 
										JOIN pengguna q JOIN peran p ON
										s.idpengguna = q.idpengguna AND
										q.idperan = p.idperan WHERE idsoal = :idsoal', array('idsoal' => $id));

		//if($result[0]['peran'] != 'admin')
		//return false;	

		$this->db->delete('soal', "idsoal = '$id'");
	}	

	public function recomDelete($id){

		if(Session::get('peran') != 'admin')
		return false;	

		$this->db->delete('soaltunggu', "idsoaltunggu = '$id'");
	}	
}
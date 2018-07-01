<?php

class Pelajar_Model extends Model{

	function __construct(){
		parent::__construct();
	}

	public function kategori($idkategori){
		Session::set('kategori',$idkategori);
	}

	public function getStatistik($id){
		return $this->db->select('SELECT idstatistik, terjawab, benar, salah, skor 
			FROM statistikpelajar s JOIN pengguna p
			ON s.idpengguna = p.idpengguna
			WHERE s.idpengguna = :id', array(':id' => $id));
	}

	public function getSoal($idsoal){

		return $this->db->select('SELECT s.idsoal, k.kategori, j.jawaban, s.soal, 
			s.jawabana, s.jawabanb, s.jawabanc, s.jawaband 
			FROM soal s JOIN kategori k JOIN jawaban j ON 
			s.idkategori = k.idkategori AND 
			s.idjawaban = j.idjawaban 
			WHERE s.idkategori = '.$get.'
			ORDER BY rand() LIMIT 10');
	}

	public function updateScore($data){

		$postData = array(
			'idpengguna' => $data['idpengguna'],
			'terjawab' => $data['terjawab'],
			'benar' => $data['benar'],
			'salah' => $data['salah'],
			'skor' => $data['skor']
		);	

		$this->db->update('statistikpelajar',$postData, "`idstatistik` = {$data['idstatistik']}");
	}

	public function getLeaders(){
		return $this->db->select('SELECT p.username, s.skor, s.terjawab, s.benar, s.salah FROM statistikpelajar s JOIN pengguna p
			ON s.idpengguna = p.idpengguna
			ORDER BY s.skor DESC');	
	}

	public function create($data){

		$this->db->insert('soaltunggu', array(
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

	public function randomSoal($get){

		return $this->db->select('SELECT s.idsoal, k.kategori, j.jawaban, s.soal, 
			s.jawabana, s.jawabanb, s.jawabanc, s.jawaband 
			FROM soal s JOIN kategori k JOIN jawaban j ON 
			s.idkategori = k.idkategori AND 
			s.idjawaban = j.idjawaban 
			WHERE s.idkategori = '.$get.'
			ORDER BY rand() LIMIT 10');
	}

}
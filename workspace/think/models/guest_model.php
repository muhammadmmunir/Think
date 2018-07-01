<?php

class Guest_Model extends Model{

	function __construct(){
		parent::__construct();
	}

	public function runLogin(){

		$sth = $this->db->prepare("SELECT p.idpengguna, q.peran, p.username FROM pengguna p join peran q ON
			p.idperan = q.idperan	
			WHERE 
			p.username = :username AND p.password = :password");
		
		$sth->execute(array(
			':username' => $_POST['username'],
			':password' => Hash::create('md5',$_POST['password'], HASH_PASSWORD_KEY)
			));

		$data = $sth->fetch();

		$count = $sth->rowCount();
		if($count > 0){
			//login
			Session::init();
			Session::set('peran',$data['peran']);
			Session::set('username',$data['username']);
			Session::set('idpengguna',$data['idpengguna']);
			Session::set('loggedIn',true);
			if(Session::get('peran') == 'admin'){
				header('location: '.URL.'admin');	
			}else if(Session::get('peran') == 'pelajar'){
				header('location: '.URL.'pelajar');
			}
		}else{
			//error
			echo '<script>alert("username atau password salah")</script>';
			header('location: '.URL.'guest/login');
		}
	}

	public function runRegister(){

		$sth = $this->db->prepare('INSERT INTO `pengguna`(`idjeniskelamin`,`namadepan`,`namabelakang`,`username`,`password`) 
			VALUES(:jeniskelamin, :namadepan, :namabelakang, :username, :password)');

		$sth->execute(array(
			':jeniskelamin' => $_POST['idjeniskelamin'],
			':namadepan' => $_POST['namadepan'],
			':namabelakang' => $_POST['namabelakang'],
			':username' => $_POST['username'],
			':password' => Hash::create('md5',$_POST['password'], HASH_PASSWORD_KEY)
			));
		$lastId = $this->db->lastInsertId();

		$sth = $this->db->prepare('INSERT INTO `statistikpelajar`(`idpengguna`)VALUES(:idpengguna)');
		$sth->execute(array('idpengguna' => $lastId));

		//redirect
		header('location: '.URL.'guest/login');
	}


}
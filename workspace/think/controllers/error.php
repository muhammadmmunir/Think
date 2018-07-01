<?php

class Errors extends Controller {

	function __construct(){
		parent::__construct();
	}

	function index(){
		$this->view->msg = 'Halaman tidak ditemukan';
		$this->view->render('error/index');
	}
}
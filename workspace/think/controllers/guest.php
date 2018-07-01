<?php

class Guest extends Controller {

	function __construct(){
		parent::__construct();

		$this->view->js = array('guest/js/guest.js');
	}

	function notfound(){
		
		$this->view->render('error/index',true);		
	}

	function login(){

		$this->view->render('guest/login');
	}
	
	function register(){

		$this->view->render('guest/register');
	}

	function runLogin(){

		$this->model->runLogin();
	}

	function runRegister(){

		$this->model->runRegister();
	}
}
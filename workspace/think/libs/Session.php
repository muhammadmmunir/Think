<?php

class Session{

	public static function init(){
		@session_start();
	}

	public static function set($key, $value){
		$_SESSION[$key] = $value;
	}

	public static function get($key, $index = false, $column = false){
		if($key && !$index && !$column){
			if(isset($_SESSION[$key]))
			return $_SESSION[$key];	
		}else{
			return $_SESSION[$key][$index][$column];
		}
	}

	public static function unset($key){	
		unset($_SESSION[$key]);
	}

	public static function destroy(){		
		session_destroy();
	}
		
}
<?php 
	ob_start();
	session_start();

	function loggedIn(){
		return (bool)(isset($_SESSION['pass']) && !empty($_SESSION['pass']));
	}
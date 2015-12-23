<?php
	$connect_error = 'Could not connect';
	$mysql_host = 'localhost';
	$mysql_user = 'root';
	$mysql_pass = '696163';
	$mysql_data = 'nsitonline_timetable';
	
	if(!$connection = mysqli_connect($mysql_host , $mysql_user , $mysql_pass, $mysql_data))
		die(mysqli_error($connection));
?>
<?php
	$DEACTIVE = true;

	if($DEACTIVE)
		die('deactivated');

	require_once '../inc/connection.inc.php';

	$timetables_dir = "Timetables/";
	$files = scandir($timetables_dir);


	foreach($files as $json){
		if($json == '.' || $json == '..')
			continue;

		$json_response = file_get_contents($timetables_dir . $json);
		$professors_array = json_decode($json_response, true)['professors'];

		foreach($professors_array as $professor){
			$name = trim($professor['fullname']);
			$code = strtoupper(trim($professor['codename']));

			if($name != '' && $code != ''){
				$query = "INSERT INTO `profs` (`code`,`name`) VALUES ('$code','$name')";
				if(mysqli_query($connection, $query)){
					echo "success\n";
				} else {
					if(stripos(mysqli_error($connection), 'duplicate') != false)
						echo "database failure\n";
					else
						echo "duplicate\n";
				}
			}
		}
	}

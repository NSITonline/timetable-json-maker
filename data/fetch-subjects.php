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
		$subjects_array = json_decode($json_response, true)['subjects'];

		foreach($subjects_array as $subject){
			$code = strtoupper(trim($subject['code']));
			$name = trim($subject['title']);

			if($name != '' && $code != ''){
				$query = "INSERT INTO `subjects` (`code`,`subject_name`) VALUES ('$code','$name')";
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

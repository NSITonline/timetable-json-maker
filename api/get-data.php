<?php

require_once 'error.inc.php';

/**
 * Sends out the timetable JSON 
 * Parameters : branch, semester, section
 */

$final_response = new stdClass();
$url = "../res/";

if(isset($_GET['branch']) && isset($_GET['semester']) && isset($_GET['section'])){
	$branch = (int)$_GET['branch'];
	$semester = (int)$_GET['semester'];
	$section = (int)$_GET['section'];

	// branch codes for ICE and MPAE interchanged because of miscommunication
	// with Android team, they don't know anything, our bunch of Jon Snows
	if($branch == 4){
		$branch = 5;
	} elseif($branch == 5) {
		$branch = 4;
	}

	$filename = array($branch, $semester, $section);
	$filename = implode("-", $filename);
	$filepath = $url . $filename;

	if(file_exists($filepath)){
		$final_response = file_get_contents($filepath);
		
		$final_response = json_decode($final_response, true);

		$final_response['professors'] = [];
		$final_response['subjects'] = [];
	}

}

echo json_encode($final_response);

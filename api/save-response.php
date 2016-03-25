<?php
/**
 * @Author: prabhakar
 * @Date:   2016-03-25 23:43:27
 * @Last Modified by:   Prabhakar Gupta
 * @Last Modified time: 2016-03-26 00:05:34
 */


/**
 * function to get time string as required 
 * in API response from timestamp
 * @param  timestamp 	$time
 * @return string
 */
function getTimeStamp($time){
	return date("Y-m-d H:i:s", $time);
}


$url = "../res/";
$current_timestamp = getTimeStamp(time());


if(isset($_POST['json'])){
	$response = json_decode($_POST['json'], true);
	
	$branch = (int)$response['branch'];
	$semester = (int)$response['semester'];
	$section = (int)$response['section'];
	
	$filename = array($branch, $semester, $section);
	$filename = implode("-", $filename);


	$metadata = array(
		'branch'		=> $branch,
		'semester'		=> $semester,
		'section'		=> $section,
		'last_updated'	=> $current_timestamp,
	);

	$final_json = array(
		'metadata'	=> $metadata,
		'timetable'	=> $response['data'],
	);


	if(file_put_contents($url . $filename, json_encode($final_json))){
		$success = true;
	} else {
		$success = false;
	}

	$final_response = array(
		'success'	=> $success,
	);

	echo json_encode($final_response);
}

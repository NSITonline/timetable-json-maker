<?php

	require_once '../inc/connection.inc.php';
	require_once '../inc/function.inc.php';

	$error = false;
	$error_messages = array(
		'Invalid parameters',
		'Try again after some time',
	);

	$current_time = time();
	$current_timestamp = getTimeStamp($current_time);

	date_default_timezone_set("Asia/Kolkata");

	if(isset($_POST['json'])){
		$response = json_decode($_POST['json'], true);
		
		$branch = (int)$response['branch'];
		$semester = (int)$response['semester'];
		$section = (int)$response['section'];
		
		$section_code = getSectionCode($connection, $branch, $semester, $section);

		if(is_null($section_code)){
			$error = true;
			$error_code = 0;
		} else {

			// remove all data which was present earlier
			$query_remove = "DELETE FROM `timetable` WHERE `main_id`='$section_code'";
			mysqli_query($connection, $query_remove);

			$query_update = "UPDATE `main` SET `last_updated_tx`='$current_timestamp' WHERE `id`='$section_code'";
			mysqli_query($connection, $query_update);

			foreach($response['data'] as $data_entry){
				if($data_entry['value'] == "theory"){
					$query_inc = "INSERT INTO `timetable` (`main_id`,`day`,`timeslot`,`type`,`suject_code`,`profFH`,`roomFH`) VALUES ('$section_code','" . $data_entry['day'] . "','" . $data_entry['timeslot'] . "','" . $data_entry['value'] . "','" . $data_entry['subject'] . "','" . $data_entry['prof'] . "','" . $data_entry['room'] . "')";
				} else if($data_entry['value'] == "lab"){
					$query_inc = "INSERT INTO `timetable` (`main_id`,`day`,`timeslot`,`type`,`suject_code`,`profFH`,`roomFH`,`profSH`,`roomSH`) VALUES ('$section_code','" . $data_entry['day'] . "','" . $data_entry['timeslot'] . "','" . $data_entry['value'] . "','" . $data_entry['subject'] . "','" . $data_entry['prof_FH'] . "','" . $data_entry['room_FH'] . "','" . $data_entry['prof_SH'] . "','" . $data_entry['room_SH'] . "')";
				} else {
					$query_inc = "INSERT INTO `timetable` (`main_id`,`day`,`timeslot`,`type`) VALUES ('$section_code','" . $data_entry['day'] . "','" . $data_entry['timeslot'] . "','" . $data_entry['value'] . "')";
				}

				if(mysqli_query($connection, $query_inc)){
					$error = false;
				} else {
					$error = true;
					$error_code = 1;
				}
			}
			
		}

		$final_response = array(
			'success'	=> (bool)!$error,
		);

		if(!$final_response['success'])
			$final_response['message'] = $error_messages[$error_code];


		echo json_encode($final_response);

	}

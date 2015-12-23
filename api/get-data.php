<?php

	require_once '../inc/connection.inc.php';
	require_once '../inc/function.inc.php';

	$final_response = array();
	$subjects = array();
	$professors = array();
	
	if(isset($_GET['branch']) && isset($_GET['semester']) && isset($_GET['section'])){
		$final_response['metadata']['branch'] = (int)$_GET['branch'];
		$final_response['metadata']['semester'] = (int)$_GET['semester'];
		$final_response['metadata']['section'] = (int)$_GET['section'];

		$response = getSectionCode($connection, $final_response['metadata']['branch'], $final_response['metadata']['semester'], $final_response['metadata']['section'], true);

		$section_code = (int)$response['id'];
		$final_response['metadata']['last_updated'] = $response['last_updated_tx'];

		$final_response['timetable'] = array();

		if(!is_null($final_response['metadata']['last_updated'])){
			$query = "SELECT * FROM `timetable` WHERE `main_id`='$section_code' ORDER BY `day` ASC, `timeslot` ASC";
			$query_run = mysqli_query($connection, $query);
			
			$current_day = 0;
			$current_day_timetable = array();

			while($query_row = mysqli_fetch_assoc($query_run)){
				if((int)$query_row['day'] != $current_day){
					$current_day++;
					array_push($final_response['timetable'], $current_day_timetable);
					$current_day_timetable = array();
				}

				if($query_row['type'] == 'theory'){
					$timeslot = array(
						"type"		=> $query_row['type'],
						"subject"	=> $query_row['subject_code'],
						"professor"	=> $query_row['profFH'],
						"room"		=> $query_row['roomFH']
					);

					$subjects 	= addToArray($subjects, $timeslot['subject']);
					$professors = addToArray($professors, $timeslot['professor']);
					
				} else if($query_row['type'] == 'lab'){
					$timeslot = array(
						"type"			=> $query_row['type'],
						"subject"		=> $query_row['subject_code'],
						"professorFH"	=> $query_row['profFH'],
						"roomFH"		=> $query_row['roomFH'],
						"professorSH"	=> $query_row['profSH'],
						"roomSH"		=> $query_row['roomSH'],
					);

					$subjects 	= addToArray($subjects, $timeslot['subject']);
					$professors = addToArray($professors, $timeslot['professorFH']);
					$professors = addToArray($professors, $timeslot['professorSH']);
					
				} else {
					$timeslot = array(
						'subject' 	=> $query_row['type'],
					);
				}

				array_push($current_day_timetable, $timeslot);
			}
			array_push($final_response['timetable'], $current_day_timetable);
		}
	}

	$final_response['professors'] = array();
	$final_response['subjects'] = array();

	$professors = implode("','",$professors);
	$query_prof = "SELECT `name` AS `fullname`,`code` AS `codename` FROM `profs` WHERE `code` IN ('$professors') ORDER BY `code` ASC";
	$query_run_prof = mysqli_query($connection, $query_prof);
	while($query_row_prof = mysqli_fetch_assoc($query_run_prof)){
		array_push($final_response['professors'], $query_row_prof);
	}

	$subjects = implode("','",$subjects);
	$query_sub = "SELECT `code`,`subject_name` AS `title` FROM `subjects` WHERE `code` IN ('$subjects') ORDER BY `code` ASC";
	$query_run_sub = mysqli_query($connection, $query_sub);
	while($query_row_sub = mysqli_fetch_assoc($query_run_sub)){
		array_push($final_response['subjects'], $query_row_sub);
	}

	echo json_encode($final_response);

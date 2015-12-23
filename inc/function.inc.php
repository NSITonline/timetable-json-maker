<?php

	function getSectionCode($connection, $branch, $semester, $section, $flag = false){
		if($flag){
			$query = "SELECT `id`,`last_updated_tx` FROM `main` WHERE `branch`='$branch' AND `sem`='$semester' AND `section`='$section' LIMIT 1";
		} else {
			$query = "SELECT `id` FROM `main` WHERE `branch`='$branch' AND `sem`='$semester' AND `section`='$section' LIMIT 1";
		}
		
		$query_row = mysqli_fetch_assoc(mysqli_query($connection, $query));

		if($flag){
			return $query_row;
		} else {
			return $query_row['id'];
		}
	}
	
	function getTimeStamp($time){
		return date("Y-m-d H:i:s", $time);
	}

	function addToArray($array, $element){
		if(!in_array($element, $array)){
			array_push($array, $element);
		}

		return $array;
	}
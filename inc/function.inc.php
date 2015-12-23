<?php

	function getSectionCode($connection, $branch, $semester, $section){
		$query = "SELECT `id` FROM `main` WHERE `branch`='$branch' AND `sem`='$semester' AND `section`='$section' LIMIT 1";
		$query_row = mysqli_fetch_assoc(mysqli_query($connection, $query));

		return $query_row['id'];
	}
	
	function getTimeStamp($time){
		return date("Y-m-d H:i:s", $time);
	}

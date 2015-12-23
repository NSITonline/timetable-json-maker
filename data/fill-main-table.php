<?php
	$DEACTIVE = true;

	if($DEACTIVE)
		die("deactivated\n");


	require_once '../inc/connection.inc.php';

	// it, mpae, bt, me
	$excluded_branches = [2,5,6,7];

	for($branch=1; $branch<=7; $branch++){
		for($sem=1; $sem<=8; $sem++){
			for($section=1; $section<=3; $section++){
				// these branches don't have 3rd section
				if(in_array($branch, $excluded_branches) && $section == 3)
					continue;

				// BT doesn't have 2nd section and no timetable for sem1
				if($branch == 6 && ($sem == 1 || $section == 2))
					continue;

				$query = "INSERT INTO `main` (`branch`,`sem`,`section`) VALUES ('$branch','$sem','$section')";
				if(mysqli_query($connection, $query))
					echo "success\n";
				else
					echo "fail\n";
			}
		}
	}
<?php
/**
 * @Author: prabhakar
 * @Date:   2016-03-25 21:40:40
 * @Last Modified by:   prabhakar
 * @Last Modified time: 2016-08-15 14:13:53
 */

$final_response = array();
$url = "../res/";

if(isset($_GET['branch']) && isset($_GET['semester']) && isset($_GET['section'])){
	$branch = (int)$_GET['branch'];
	$semester = (int)$_GET['semester'];
	$section = (int)$_GET['section'];

	if($branch == 4){
		$branch = 5;
	} elseif($branch == 5) {
		$branch = 4;
	}

	$filename = array($branch, $semester, $section);
	$filename = implode("-", $filename);

	$final_response = file_get_contents($url . $filename);

}
echo $final_response;

<?php
	require 'inc/connection.inc.php';
	require 'inc/constant.inc.php';
	require 'inc/function.public.inc.php';

	$field_type_string = "<option>Break</option><option>Lunch Break</option><option>Theory</option><option>Lab</option>";

?>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="author" content="">

	<link rel="shortcut icon" href="">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/select2.min.css">

	<meta name="description" content="">
    <meta name="keywords" content="">
    <title>NSITonline | Timetable Maker</title>
    <script type="text/javascript">
<?php

	$current_url = explode('/', returnCurrentURL());
	unset($current_url[count($current_url) - 1 ]);
	echo "\tconfig_api_url = '" . implode('/', $current_url) . "/api/';" . PHP_EOL;

?>
    </script>
</head>
<body>
<hr>
<div class="container">
	<div class="row">
		<div class="col-md-4 text-center">Branch</div>
		<div class="col-md-4 text-center">Semester</div>
		<div class="col-md-4 text-center">Section</div>
	</div>
	<div class="row">
		<form class="form-horizontal">
			<div class="form-group">
				<div class="col-md-4">
					<select class="form-control" id="branch_select">
						<option value="1">COE</option>
						<option value="2">IT</option>
						<option value="3">ECE</option>
						<option value="4">MPAE</option>
						<option value="5">ICE</option>
						<option value="6">BT</option>
						<option value="7">ME</option>
					</select>
				</div>
				<div class="col-md-4">
					<select class="form-control" id="semester_select">
<?php
	for($i=1; $i<=8; $i++){
		echo '<option value="' . $i . '">' . romanic_number($i) . '</option>' . PHP_EOL;
	}
?>
					</select>
				</div>
				<div class="col-md-4">
					<select class="form-control" id="section_select">
<?php
	for($i=1; $i<=3; $i++){
		echo '<option value="' . $i . '">' . romanic_number($i) . '</option>' . PHP_EOL;
	}
?>
					</select>
				</div>
			</div>
		</form>
	</div>
</div>
<hr>
<div class="col-md-12">
	<div class="table-responsive">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Day</th>
					<th>8:30 - 9:30</th>
					<th>9:30 - 10:30</th>
					<th>10:30 - 11:30</th>
					<th>11:30 - 12:30</th>
					<th>12:30 - 1:30</th>
					<th>1:30 - 2:30</th>
					<th>2:30 - 3:30</th>
					<th>3:30 - 4:30</th>
					<th>4:30 - 5:30</th>
					<th>5:30 - 6:30</th>
				</tr>
			</thead>
			<tbody>
<?php
	$key = 0;
	foreach($DAY_OF_WEEK as $day){
		echo '<tr><th scope="row">' . $day . '</th>';

		for($i=0; $i<10; $i++){
			echo '
			<td>
				<select class="js-example-basic-single" data-field-name="' . $key . '/' . $i . '">' . $field_type_string . '</select>
				<div></div>
			</td>';
		}

		echo '</tr>';
		$key++;
	}
?>
			</tbody>
		</table>
	</div>
</div>
<div class="clearfix"></div>
<hr>
<div class="container">
	<div class="btn-group pull-right" role="group">
		<button type="button" class="btn btn-default" id="refresh-button">Refresh</button>
		<button type="button" class="btn btn-success" id="submit-button">Submit</button>
	</div>
</div>


<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/select2.min.js"></script>
<script type="text/javascript" src="js/custom.js"></script>

<script type="text/javascript">

$(document).ready(function() {
  $(".js-example-basic-single").select2();
});

</script>

</body>
</html>
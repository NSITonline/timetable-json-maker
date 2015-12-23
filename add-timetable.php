<?php
	require 'inc/connection.inc.php';
	require 'inc/constant.inc.php';

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

</head>
<body>
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
<hr>

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
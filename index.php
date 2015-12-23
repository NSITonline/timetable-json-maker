<?php
	require_once 'inc/login.function.inc.php';
	require_once 'inc/connection.inc.php';

	if(loggedin())
		header('Location: add-timetable.php');

	if(isset($_POST['pass'])){
		$password_entered = strtolower(trim(str_replace(' ','',$_POST['pass'])));
		if($password_entered == 'xxxx'){
			$_SESSION['pass'] = $password_entered;

			header("Location: add-timetable.php");
		} else {
			$error = 0;
		}
	}

	include 'inc/public/meta.inc.php';

?>
</head>
<body>
<?php

	include 'inc/public/header.inc.php';

?>
	<div class="container" style="padding-top:50px">
<?php 
	
	if(isset($error)){
		echo '<div class="alert alert-danger alert-dismissible" style="margin:10px 10px -10px 10px ;" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>YOU ARE NOT AUTHORIZED, GO BACK</div>';
	}

?>	
        <div class="row">
            <div class="col-md-6 col-lg-6 col-md-offset-3 col-lg-offset-3">
                <form id="login-form" method="POST">
                    <label>You need to enter the secret code given by <a>Almighty</a></label>
                    <hr>
                    <div class="form-group">
                        <input name="pass" type="password" class="form-control input-lg not-round" placeholder="Password" required autofocus>
                    </div>
                    <button type="submit" class="btn btn-lg btn-success not-round">Login</button>
                </form>
            </div>
        </div>
    </div>


<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>

</body>
</html>
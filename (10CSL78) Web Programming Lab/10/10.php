<?php
	session_start();
	if(!isset($_SESSION['views']))
		$_SESSION['views']=0;
	echo 'View count : '.(++$_SESSION['views']);
?>
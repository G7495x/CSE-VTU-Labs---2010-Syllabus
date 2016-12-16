<?php
	if(!isset($_COOKIE['lastVisit']))
		echo 'Not yet visited';
	else
		echo 'Last date : '.$_COOKIE['lastVisit'];
	$inTwoMonths=24*60*60*60+time();
	setcookie('lastVisit',date('G:i - d/m/y'),$inTwoMonths);	#cookie name,cookie value,(Optional)cookie expiry time
?>

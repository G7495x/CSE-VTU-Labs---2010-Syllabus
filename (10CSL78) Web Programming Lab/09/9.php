<?php
	$inTwoMonths=24*60*60*60+time();
	setcookie('lastVisit',date('G:i - m/d/y'),$inTwoMonths);	#cookie name,cookie value,cookie expiry time (Optional)
	if(isset($_COOKIE['lastVisit']))
		echo 'Last date : '.$_COOKIE['lastVisit'];
	else
		echo 'Not yet visited';
?>

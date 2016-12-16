<?php

# Note: Do the following before execution
#
# $ mysql -u root -p
# root123				(password)
#
# > CREATE DATABASE test;
# > use test;
# > CREATE TABLE Persons (name TEXT,addr1 TEXT,addr2 TEXT,email TEXT);

	$con=mysqli_connect('localhost','root','root123');
	if(!$con) echo 'Could not connect! '.mysqli_connect_error() and die;
	mysqli_select_db($con,'test');

	$name=$_REQUEST['name'];
	$addr1=$_REQUEST['addr1'];
	$addr2=$_REQUEST['addr2'];
	$email=$_REQUEST['email'];
	if(mysqli_query($con,"INSERT INTO Persons VALUES('$name','$addr1','$addr2','$email')"))
		echo 'Data inserted successfully!';
	else
		echo 'Data insertion failed!';
	mysqli_close($con);
?>
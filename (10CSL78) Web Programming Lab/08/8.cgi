#!/usr/bin/perl

# Note: Do the following before execution
#
# $ myquery -u root -p
# root123				(password)
#
# > CREATE DATABASE test;
# > use test;
# > CREATE TABLE Students (name TEXT, age INT);

use CGI':standard';
use DBI;

$dbi=DBI->connect("DBI:mysql:test","root","root123");				#Create database handle. Connect to driver:database:table
$name=param("name");
$age=param("age");
$sql=$dbi->prepare("insert into Students values('$name','$age')");
$sql->execute;
$sql=$dbi->prepare("select * from Students");
$sql->execute;
print "
<table border size=1>
	<tr>
		<th>Name</th>
		<th>Age</th>
	</tr>
";

print "Content-type:text/html\n\n";
while(($name,$age)=$sql->fetchrow()){
	print "
	<tr>
		<td>$name</td>
		<td>$age</td>
	</tr>
	";
}

$sql->finish();
$dbi->disconnect();
print"</table>";


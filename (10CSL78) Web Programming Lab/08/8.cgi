#!/usr/bin/perl

# Note: Do the following before execution
#
# $ myquery -u root -p
# root123				(password)
#
# > CREATE DATABASE test;
# > use test;
# > CREATE TABLE Students (name TEXT,age INT);

use CGI':standard';
use DBI;

$dbh=DBI->connect('DBI:mysql:test','root','root123') or die;	#Get database handle ('Driver:Platform:Database','User','Password')

$name=param('name');
$age=param('age');
$q=$dbh->prepare("INSERT INTO Students VALUES('$name',$age)");
$q->execute or die;

$q=$dbh->prepare('SELECT * FROM Students');
$q->execute or die;

print 'Content-type:text/html

<html>
	<table border=1>
		<tr>
			<th>Name</th>
			<th>Age</th>
		</tr>';
while(($name,$age)=$q->fetchrow()){
	print '
		<tr>
			<td>$name</td>
			<td>$age</td>
		</tr>';
}
print '
	</table>
</html>';

$q->finish;
$dbh->disconnect;

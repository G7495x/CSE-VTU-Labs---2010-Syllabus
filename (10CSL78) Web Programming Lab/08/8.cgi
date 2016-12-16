#!/usr/bin/perl

# Note: Do the following before execution
#
# $ mysql -u root -p
# root123				(password)
#
# > CREATE DATABASE test;
# > use test;
# > CREATE TABLE Students (name TEXT,age INT);

use CGI':standard';
use DBI;
print "Content-type:text/html\n\n";

$dbh=DBI->connect('DBI:mysql:test','root','root123')	#Create database handle ('Driver:Platform:Database','User','Password')
or (print $DBI::errstr and die);

$name=param('name');
$age=param('age');
$q=$dbh->prepare("INSERT INTO Students VALUES('$name',$age)");
$q->execute or (print $q->errstr and die);

$q=$dbh->prepare('SELECT * FROM Students');
$q->execute or (print $q->errstr and die);

print '
<table border=1>
	<tr>
		<th>Name</th>
		<th>Age</th>
	</tr>';
while(($name,$age)=$q->fetchrow()){
	print "
	<tr>
		<td>$name</td>
		<td>$age</td>
	</tr>";
}
print '
</table>';

$q->finish;
$dbh->disconnect;
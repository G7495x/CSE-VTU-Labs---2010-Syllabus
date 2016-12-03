#!/usr/bin/perl
use CGI':standard';
print "Content-type:text/html\n\n";

open(FILE,'<count.txt');	#Open as read-only
$count=<FILE>;				#Get value in file
close(FILE);

$count++;

open(FILE,'>count.txt');	#Open as write-only
print FILE "$count";		#Print value in file
close(FILE);

print "View count: $count";
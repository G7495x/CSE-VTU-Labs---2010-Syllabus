#!/usr/bin/perl
use CGI':standard';
print "Content-type:text/html\n\n";

foreach $i(%ENV){
	print "$i : $ENV{$i} <br />"
}
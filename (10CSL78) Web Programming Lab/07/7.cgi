#!/usr/bin/perl
use CGI':standard';
print "Refresh:1\n";					#Refresh the page every second
print "Content-type:text/html\n\n";

($s,$m,$h)=localtime(time);
print br "The current server time is $h:$m:$s";
#!/usr/bin/perl
use CGI':standard';
#refresh the display every second
print "Refresh:1\n";
print "Content-type:text/html\n\n";

($s,$m,$h)=localtime(time);
print br "The current server time is $h:$m:$s";

#!/usr/bin/perl
use CGI':standard';
print "Content-type:text/html\n\n";

$name=param('username');
@msgs=("Good morning!","How are you?","Wassup?");
print $name," ",@msgs[rand @msgs];
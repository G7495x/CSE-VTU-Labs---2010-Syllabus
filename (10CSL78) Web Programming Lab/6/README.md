# 6.
#### a) Write a Perl program to accept the User Name and display a greeting message randomly chosen from a list of 4 greeting messages.
### Code (HTML)
**File Path:** /opt/lampp/htdocs/6a.html
```html
<html>
	<form action="/cgi-bin/6a.cgi" method="post">
		Name:<input type="text" name="username">
		<input type="submit">
	</form>
</html>
```
### Code (Perl)
**File Path:** /opt/lampp/cgi-bin/6a.cgi
```perl
#!/usr/bin/perl
use CGI':standard';
print "Content-type:text/html\n\n";

$name=param('username');
@msgs=("Good morning!","How are you?","Wassup?");
$random_msg=@msgs[rand @msgs];
print $name," ",$random_msg;
```
#### b) Write a Perl program to keep track of the number of visitors visiting the web page and to display this count of visitors, with proper headings.
### Code (HTML)
**File Path:** /opt/lampp/htdocs/6b.html
```html
<html>
	<form action="/cgi-bin/6b.cgi">
		<input type="submit" value="Show view count">
	</form>
</html>
```
### Code (Perl)
**File Path:** /opt/lampp/cgi-bin/6b.cgi
```perl
#!/usr/bin/perl
use CGI':standard';
print "Content-type:text/html\n\n";

open(FILE,'<count.txt');
$count=<FILE>;
close(FILE);

$count++;

open(FILE,'>count.txt');
print FILE "$count";
close(FILE);

print "View count:$count";
```

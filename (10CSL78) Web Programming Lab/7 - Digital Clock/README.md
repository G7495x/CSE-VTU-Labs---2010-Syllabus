# 7. Write a Perl program to display a digital clock which displays the current time of the server.
### Code (HTML)
**File Path:** /opt/lampp/htdocs/7.html
```html
<html>
	<form action="/cgi-bin/7.cgi">
		<input type="submit" value="Click Here">
	</form>
</html>
```
### Code (Perl)
**File Path:** /opt/lampp/cgi-bin/7.cgi
```perl
#!/usr/bin/perl
use CGI':standard';
#refresh the display every second
print "Refresh:1\n";
print "Content-type:text/html\n\n";

($s,$m,$h)=localtime(time);
print br "The current server time is $h:$m:$s";
```

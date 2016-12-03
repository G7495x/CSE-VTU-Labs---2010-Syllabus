# 5.
#### a) Write a Perl program to display various Server Information like Server Name, Server Software, Server protocol, CGI Revision etc.
### Important bits:
* ```%ENV```: A hash map that holds the server environment variables.
* ```param(name)```: Gets parameter from name.
* ```system(command)```: Executes a shell command.

### Code (HTML)
**File Path:** ```/opt/lampp/htdocs/web-lab/5a.html```
```html
<html>
	<form action="/cgi-bin/web-lab/5a.cgi">
		<input type="submit" value="Show Server info">
	</form>
</html>
```
### Code (Perl)
**File Path:** ```/opt/lampp/cgi-bin/web-lab/5a.cgi```
```perl
#!/usr/bin/perl
use CGI':standard';
print "Content-type:text/html\n\n";

foreach $i(%ENV){
	print "$i : $ENV{$i} <br/>"
}
```
### Output
![](a1.png)
![](a2.png)
#### b) Write a Perl program to accept UNIX command from a HTML form and to display the output of the command executed.
### Code (HTML)
**File Path:** ```/opt/lampp/htdocs/web-lab/5b.html```
```html
<html>
	<form action="/cgi-bin/web-lab/5b.cgi">
		Command:<input type="text" name="cmd">
		<input type="submit" value="submit">
	</form>
</html>
```
### Code (Perl)
**File Path:** ```/opt/lampp/cgi-bin/web-lab/5b.cgi```
```perl
#!/usr/bin/perl
use CGI':standard';
print "Content-type:text/html\n\n";

system(param('cmd'));
exit(0);
```
### Output
![](b1.png)
![](b2.png)

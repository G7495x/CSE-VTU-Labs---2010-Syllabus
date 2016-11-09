# 1.Develop and demonstrate a XHTML file that includes Javascript script for the following problems:
#### a) Input: A number n obtained using prompt<br>&nbsp;&nbsp;&nbsp;&nbsp;Output: The first n Fibonacci numbers
###Code (XHTML)
```xhtml
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR?xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>1a - Fibonacci</title>
	</head>
	<body>
		<h1>Fibonacci Series</h1>
		<script type="text/javascript">
			n=prompt("Enter a value for n")
			if(n>=1){
				if(n==1)
					document.write("0<br />")
				else{
					a=0;
					b=1;
					document.write("0<br />1<br />")
					for(i=2;i<n;++i){
						c=a+b;
						a=b;
						b=c;
						document.write(c+"<br />")
					}
				}
			}
			else	alert("Invalid input!!!")
		</script>
	</body>
</html>
```
#### b) Input: A number n obtained using prompt<br>&nbsp;&nbsp;&nbsp;&nbsp;Output: A table of numbers from 1 to n and their squares using alert
###Code (XHTML)
```xhtml
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR?xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>1b - Squares</title>
	</head>
	<body>
		<h1>Squares</h1>
		<script type="text/javascript">
			n=prompt("Enter a value for n")
			if(n>=1){
				s=""
				for(i=1;i<=n;++i)
					s+=i*i+"\n"
				alert(s)
			}
			else	alert("Invalid input!!!")
		</script>
	</body>
</html>
```

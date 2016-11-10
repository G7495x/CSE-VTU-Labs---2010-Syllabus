#3.
#### a) Develop and demonstrate, using Javascript script, a XHTML document that contains three short paragraphs of text, stacked on top of each other, with only enough of each showing so that the mouse cursor can be placed over some part of  them. When the cursor is placed over the exposed part of any paragraph, it should rise to the top to become completely visible.
### Code (XHTML)
```xhtml
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR?xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>3a - Stack Ordering</title>
	</head>
	<body>
		<h1>Stack Ordering</h1>
		<style>
			p{
				position:		absolute;
				width:			400px;
				height:			300px;
				z-index:		0;
			}
			#p1{
				left:		50px;
				top: 		50px;
				background:	red;
			}
			#p2{
				left:		100px;
				top: 		100px;
				background:	blue;
			}
			#p3{
				left:		150px;
				top: 		150px;
				background:	green;
			}
		</style>

		<p id="p1" onmouseover="hover('p1')"></p>
		<p id="p2" onmouseover="hover('p2')"></p>
		<p id="p3" onmouseover="hover('p3')"></p>

		<script type="text/javascript">
			var bottom='p1';
			function hover(top){
				document.getElementById(bottom).style.zIndex='0';
				document.getElementById(top).style.zIndex='1';
				bottom=top;
			}
		</script>
	</body>
</html>
```
####b) Modify the above document so that when a paragraph is moved from the top stacking position, it returns to its original position rather than to the bottom.
### Code (XHTML)
```xhtml
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR?xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>3b - Stack Ordering and recovering</title>
	</head>
	<body>
		<h1>Stack Ordering and recovering</h1>
		<style>
			p{
				position:		absolute;
				width:			400px;
				height:			300px;
				z-index:		0;
			}
			#p1{
				left:		50px;
				top: 		50px;
				background:	red;
			}
			#p2{
				left:		100px;
				top: 		100px;
				background:	blue;
			}
			#p3{
				left:		150px;
				top: 		150px;
				background:	green;
			}
		</style>

		<p id="p1" onmouseover="hover('p1')" onmouseout="hover('p3')"></p>
		<p id="p2" onmouseover="hover('p2')" onmouseout="hover('p3')"></p>
		<p id="p3" onmouseover="hover('p3')" onmouseout="hover('p3')"></p>

		<script type="text/javascript">
			var bottom='p1';
			function hover(top){
				document.getElementById(bottom).style.zIndex='0';
				document.getElementById(top).style.zIndex='1';
				bottom=top;
			}
		</script>
	</body>
</html>
```

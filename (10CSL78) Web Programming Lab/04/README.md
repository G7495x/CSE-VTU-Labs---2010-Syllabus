# 4.
#### a) Design an XML document to store information about a student in an engineering college affiliated to VTU. The information must include USN, Name, Name of the College, Brach, Year of Joining, and e-mail id. Make up sample data for 3 students. Create a CSS style sheet and use it to display the document.
### Important bits:
* ```xsl:template match="/tag-path"```: Matches root tag.
* ```xsl:for-each select="tag"```: For each loop on all specified elements.
* ```xsl:value-of match="tag"```: Value of an element.

### Code (XML)
**File path:** ```/opt/lampp/htdocs/web-lab/4a.xml```
```xml
<?xml version="1.0" encoding="utf-8"?>
<?xml-stylesheet type="text/css" href="4a.css"?>
<student>
	<stud-info>Student Details</stud-info>
	<stud1>
		USN:<usn>1AB10CD001</usn>
		Name:<name>Asd</name>
		College:<col>ABC</col>
		Branch:<branch>CD</branch>
		Year of joining:<yoj>2010</yoj>
		E-mail:<email>asd@xyz.com</email>
	</stud1>
	<stud2>
		USN:<usn>1AB10CD002</usn>
		Name:<name>Fgh</name>
		College:<col>ABC</col>
		Branch:<branch>CD</branch>
		Year of joining:<yoj>2010</yoj>
		E-mail:<email>fgh@xyz.com</email>
	</stud2>
	<stud3>
		USN:<usn>1AB10CD003</usn>
		Name:<name>Vbn</name>
		College:<col>ABC</col>
		Branch:<branch>CD</branch>
		Year of joining:<yoj>2010</yoj>
		E-mail:<email>vbn@vbn.com</email>
	</stud3>
</student>
```
### Code (CSS)
**File path:** ```/opt/lampp/htdocs/web-lab/4a.css```
```css
stud-info{
	color:			black;
	font-size:		36px;
	font-weight:	bold;
	font-style:		italic;
}

student{
	color:			gray;
	font-size:		18px;
	font-weight:	bold;
}

stud1,
stud2,
stud3{
	display:		block;
	padding-left:	18px;
}

student * *{
	font-size:	24px;
}

stud1 *{
	color:	red;
}

stud2 *{
	color:	blue;
}

stud3 *{
	color:	green;
}
```
### Output
![](a.png)
#### b) Create an XSLT style sheet for one student element of the above document and use it to create a display of that element.
### Code (XML)
**File path:** ```/opt/lampp/htdocs/web-lab/4b.xml```
```xml
<?xml version="1.0" encoding="utf-8"?>
<?xml-stylesheet type="text/xsl" href="4b.xsl"?>
<student>
	<stud-info>
		<usn>1AB10CD001</usn>
		<name>Asd</name>
		<col>ABC</col>
		<branch>CD</branch>
		<yoj>2010</yoj>
		<email>asd@xyz.com</email>
	</stud-info>
</student>
```
### Code (XSL)
**File path:** ```/opt/lampp/htdocs/web-lab/4b.xsl```
```xsl
<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/student">
		<html>
			<table border="1">
				<tr>
					<th>USN</th>
					<th>Name</th>
					<th>College</th>
					<th>Branch</th>
					<th>Year Of Joining</th>
					<th>Email-ID</th>
				</tr>
				<xsl:for-each select="stud-info">
					<tr>
						<td><xsl:value-of select="usn"/></td>
						<td><xsl:value-of select="name"/></td>
						<td><xsl:value-of select="col"/></td>
						<td><xsl:value-of select="branch"/></td>
						<td><xsl:value-of select="yoj"/></td>
						<td><xsl:value-of select="email"/></td>
					</tr>
				</xsl:for-each>
		   </table>
	   </html>
	</xsl:template>
</xsl:stylesheet>
```
### Output
![](b.png)

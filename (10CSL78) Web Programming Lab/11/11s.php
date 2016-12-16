<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/MarkUp/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>11 - Search results - MySQL DB interfacing through PHP</title>
	</head>
	<body>
		<h2>Search Result</h2>
		<table border=1>
			<tr>
				<th>Name</th>
				<th>Address Line 1</th>
				<th>Address Line 2</th>
				<th>Email-ID</th>
			</tr>
			<?php
				$name=$_REQUEST['name'];
				$con=mysqli_connect('localhost','root','root123');
				if(!$con) echo 'Could not connect! '.mysqli_connect_error() and die;
				mysqli_select_db($con,'test');

				$result=mysqli_query($con,"SELECT * FROM Persons WHERE name LIKE '%$name%'");
				while($row=mysqli_fetch_array($result))
					echo '
					<tr>
						<td>'.$row['name'].'</td>
						<td>'.$row['addr1'].'</td>
						<td>'.$row['addr2'].'</td>
						<td>'.$row['email'].'</td>
					</tr>';
				mysqli_close($con);
			?>
		</table>
	</body>
</html>




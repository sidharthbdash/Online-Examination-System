<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" type="text/css" href="css/studentstyle.css">
	<link rel="stylesheet" type="text/css" href="css/addstudent.css">
</head>
<body>
	<main>
		<center>
			
			<section class="middle" style="height: 300px">
				<form action="addinstructiondb.jsp" method="get">
				<h1>Add Instruction</h1><br>
				<hr color=#033BAB>
				<section class="addstudent" style="height: 115px; margin-top: 20px;">
					<table>
						<tr>
							<td>New Instruction:</td>
							<td><input type="text" name="instid" class="addsinput" placeholder="Enter a new Instruction" required></th></td>
						</tr>
						
					</table>

				</section>
				<hr color=#033BAB>
				<input type="submit" name="Login" value="Add" class="btn">
				<input type="button" name="Exit" value="Back" class="btn" onclick="window.location.href='inmanage.jsp';">

			</form>
			</section>
			
		</center>
	</main>
	
</body>
</html>

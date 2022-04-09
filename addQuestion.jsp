<!DOCTYPE html>
<html>
<head>
	<title>Add Question</title>
	<link rel="stylesheet" type="text/css" href="css/studentstyle.css">
	<link rel="stylesheet" type="text/css" href="css/addstudent.css">
</head>
<body>
	<main>
		<center>
			
			<section class="middle" style="height: 618px;transform: translate(0%,3%);">
				<form action="addquestiondb.jsp" method="get">
				<h1>Add Question</h1><br>
				<hr color=#033BAB>
				<section class="addstudent" style="height: 448px">
					<table>
						<tr>
							<td>Question:</td>
							<td><input type="text" name="que" class="addsinput" placeholder="Enter the Question" required></th></td>
						</tr>
						<tr>
							<td>Option A:</td>
							<td><input type="text" name="op1" class="addsinput" placeholder="First option" required></th></td>
						</tr>
						<tr>
							<td>Option B:</td>
							<td><input type="text" name="op2" class="addsinput" placeholder="Second option" required></th></td>
						</tr>
						<tr>
							<td>Option C:</td>
							<td><input type="text" name="op3" class="addsinput" placeholder="Third option" required></th></td>
						</tr>
						<tr>
							<td>Option D:</td>
							<td><input type="text" name="op4" class="addsinput" placeholder="Fourth option" required></th></td>
						</tr>
						<tr>
							<td>Correct Ans:</td>
							<td><input type="text" name="ans" class="addsinput" placeholder="Enter option..A/B/C/D" required></th></td>
						</tr>
					</table>
	
				</section>
				<hr color=#033BAB>
				<input type="submit" name="Login" value="Add" class="btn">
				<input type="button" name="Exit" value="Back" class="btn" onclick="window.location.href='qmanage.jsp';">

			</form>
			</section>
			
		</center>
	</main>

</body>
</html>

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
			
			<section class="middle" style="height: 430px">
				<form action="addsdb.jsp" method="get">
				<h1>Add Student</h1><br>
				<hr color=#033BAB>
				<section class="addstudent" style="height: 260px">
					<table>
						<tr>
							<td>User Id:</td>
							<td><input type="text" name="asid" class="addsinput" placeholder="Enter your id" required></th></td>
						</tr>
						<tr>
							<td>Name:</td>
							<td><input type="text" name="asname" class="addsinput" placeholder="Enter your Name" required></th></td>
						</tr>
						<tr>
							<td>Password:</td>
							<td><input type="password" name="aspwd" class="addsinput" id="myInput" placeholder="Enter your Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required></th></td>
						</tr>
					</table>
					<input type="checkbox" onclick="myFunction()" style="height: 15px; width: 15px;color: #033BAB">Show Password

				</section>
				<hr color=#033BAB>
				<input type="submit" name="Login" value="Add" class="btn">
				<input type="button" name="Exit" value="Back" class="btn" onclick="window.location.href='smanage.jsp';">

			</form>
			</section>
			
		</center>
	</main>
	
<script>
function myFunction() {
  var x = document.getElementById("myInput");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}
</script>
</body>
</html>

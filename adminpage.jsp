<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" type="text/css" href="css/studentstyle.css">
</head>
<body>
	<%! String userName;%>
	<main>
		<center>
			
			<section class="middle">
				<form action="studentcon.jsp"method="get">
				<h1>Welcome <%out.print(session.getAttribute("user"));%></h1><br>
				<hr color=#033BAB>
				<table class="table">
  					<tr>
  					  <td><input type="button" name="Exit" style="white-space: normal;" value="Add/Update Student" class="btn" onclick="window.location.href='smanage.jsp';"></th>
  					  <td><input type="button" name="Exit" style="white-space: normal;" value="Add/Update Instruction" class="btn" onclick="window.location.href='inmanage.jsp';"></th>
  					</tr>
  					<tr>
  					  <td><input type="button" name="Exit" style="white-space: normal;" value="Add/Update Question" class="btn" onclick="window.location.href='qmanage.jsp';"></td>
  					  <td><input type="button" name="Exit"  value="Exit" class="btn" onclick="window.location.href='index.html';"></td>
  					</tr>
  					
				</table>
				<hr color=#033BAB>

			</form>
			</section>
			
		</center>
	</main>
	

</body>
</html>

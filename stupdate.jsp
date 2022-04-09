<!DOCTYPE html>
<html>
<head>
	<title>Update student to Database</title>
		<link rel="stylesheet" type="text/css" href="css/studentstyle.css">
			<link rel="stylesheet" type="text/css" href="css/addstudent.css">


</head>
<body>
	<%@ page import= "java.sql.*"%>

	<%! String userid; %>
	<% userid=request.getParameter("id");%>
	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "jenar");
	Statement st=conn.createStatement();
	String sql="select * from studentdata where userid='"+userid+"'";
	ResultSet rs=st.executeQuery(sql);
	try{
	
	if(rs!=null){
			rs.next();
			%>
			<center>
			
			<section class="middle" style="height: 430px">
				<form action="ustudentdb.jsp" method="get">
				<h1>Update Student Data</h1><br>
				<hr color=#033BAB>
				<section class="addstudent" style="height: 260px">
					<table>
						<tr>
							<td>User Id:</td>
							<td><input type="text" name="usid" class="addsinput"  value="<%=rs.getString("userid")%>" readonly></th></td>
						</tr>
						<tr>
							<td>Name:</td>
							<td><input type="text" name="usname" class="addsinput"  value="<%=rs.getString("name")%>" required></th></td>
						</tr>
						<tr>
							<td>Password:</td>
							<td><input type="password" name="uspwd" class="addsinput" id="myInput" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" value="<%=rs.getString("password")%>" required></th></td>
						</tr>
					</table>
					<input type="checkbox" onclick="myFunction()" style="height: 15px; width: 15px;color: #033BAB">Show Password

				</section>
				<hr color=#033BAB>
				<input type="submit" name="Login" value="Update" class="btn">
				<input type="button" name="Exit" value="Back" class="btn" onclick="window.location.href='smanage.jsp';">

			</form>
			</section>
			
		</center>

			<%
		}
	else{
			out.println("failed");
		}

	}
	


	catch(Exception e)
	{

	}
	st.close();
	conn.close();
	%>
</body>
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
</html>
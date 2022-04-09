<!DOCTYPE html>
<html>
<head>
	<title>Update student to Database</title>
		<link rel="stylesheet" type="text/css" href="css/studentstyle.css">
			<link rel="stylesheet" type="text/css" href="css/addstudent.css">


</head>
<body>
	<%@ page import= "java.sql.*"%>

	<%! String id; %>
	<% id=request.getParameter("id");%>
	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "jenar");
	Statement st=conn.createStatement();
	String sql="select * from instruction where instruction='"+id+"'";
	ResultSet rs=st.executeQuery(sql);
	try{
	
	if(rs!=null){
			rs.next();
			session.setAttribute("id",id);
			%>
			<center>
			
			<section class="middle" style="height: 300px">
				<form action="inupdatedb.jsp" method="get">
				<h1>Update Instruction</h1><br>
				<hr color=#033BAB>
				<section class="addstudent" style="height: 115px; margin-top: 20px;">
					<table>
						<tr>
							<td>New Instruction:</td>
							<td><input type="text" name="uinid" class="addsinput"  value="<%=rs.getString("instruction")%>" required></th></td>
						</tr>
						
					</table>

				</section>
				<hr color=#033BAB>
				<input type="submit" name="Login" value="Update" class="btn">
				<input type="button" name="Exit" value="Back" class="btn" onclick="window.location.href='inmanage.jsp';">

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
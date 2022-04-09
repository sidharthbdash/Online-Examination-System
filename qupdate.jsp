<!DOCTYPE html>
<html>
<head>
	<title>Update student to Database</title>
		<link rel="stylesheet" type="text/css" href="css/studentstyle.css">
			<link rel="stylesheet" type="text/css" href="css/addstudent.css">


</head>
<body>
	<%@ page import= "java.sql.*"%>

	<%! String qid; %>
	<% qid=request.getParameter("id");%>
	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "jenar");
	Statement st=conn.createStatement();
	String sql="select * from question where question='"+qid+"'";
	ResultSet rs=st.executeQuery(sql);
	try{
	
	if(rs!=null){
			rs.next();
			session.setAttribute("id",qid);

			%>
			<center>
			
			<section class="middle" style="height: 618px;transform: translate(0%,3%);">
				<form action="qupdatedb.jsp" method="get">
				<h1>Update Student</h1><br>
				<hr color=#033BAB>
				<section class="addstudent" style="height: 448px">
					<table>
						<tr>
							<td>Question:</td>
							<td><input type="text" name="que" class="addsinput" value="<%=rs.getString("question")%>" required></th></td>
						</tr>
						<tr>
							<td>Option A:</td>
							<td><input type="text" name="op1" class="addsinput" value="<%=rs.getString("option1")%>" required></th></td>
						</tr>
						<tr>
							<td>Option B:</td>
							<td><input type="text" name="op2" class="addsinput" value="<%=rs.getString("option2")%>" required></th></td>
						</tr>
						<tr>
							<td>Option C:</td>
							<td><input type="text" name="op3" class="addsinput" value="<%=rs.getString("option3")%>" required></th></td>
						</tr>
						<tr>
							<td>Option D:</td>
							<td><input type="text" name="op4" class="addsinput" value="<%=rs.getString("option4")%>" required></th></td>
						</tr>
						<tr>
							<td>Correct Ans:</td>
							<td><input type="text" name="ans" class="addsinput" value="<%=rs.getString("ans")%>" required></th></td>
						</tr>
					</table>
	
				</section>
				<hr color=#033BAB>
				<input type="submit" name="Login" value="Update" class="btn">
				<input type="button" name="Exit" value="Back" class="btn" onclick="window.location.href='qmanage.jsp';">

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
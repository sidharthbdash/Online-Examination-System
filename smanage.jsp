<!DOCTYPE html>
<html>
<head>
	<title>Manage Students</title>
	<link rel="stylesheet" type="text/css" href="css/studentstyle.css">

</head>
<body>
	<%@ page import= "java.sql.*"%>
	<%! int i=1; %>
	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "jenar");
	Statement st=conn.createStatement();
	Statement st2=conn.createStatement();
	String sql="select * from studentdata";
	ResultSet rs=st.executeQuery(sql);
	try{
		if(rs!=null)
		{
	%>
<main>
		<center>
			
			<section class="middle"  style="height: 420px">				
					<h1>List of Students</h1><br>
				<hr color=#033BAB>
				
				<section class="list">
				<table class="table" border="1" cellpadding="5">
  					<tr>
  					  <th>Sl No.</th>
  					  <th>UserId</th>
  					  <th>Name</th>
  					  <th>Update/Delete</th>
  					</tr>
	<%
			while(rs.next())
			{
			%>
				<tr>
					<td>
						<%=i %>
					</td>
					<td>
						<%=rs.getString("userid") %>
					</td>
					<td>
						<%=rs.getString("name") %>
					</td>
					<td><a href="stupdate.jsp?id=<%=rs.getString("userid")%>" id="say_hello">+Update</a><br><a href="sdelete.jsp?id=<%=rs.getString("userid")%>" id="say_hello"> - Delete</a></td>

				
			<%
				i++;
			}
			i=1;

			%>
				</table>
				</section>
				<hr color=#033BAB>
				<input type="button" name="Exit" style="white-space: normal;" value="AddMember" class="btn" onclick="window.location.href='addMember.jsp';"></th>
				<input type="button" name="Exit"  value="Back" class="btn" onclick="window.location.href='adminpage.jsp';">

			</section>
			<%
		}
		
		

	}
	


	catch(Exception e)
	{

	}
	st.close();
	st2.close();
	rs.close();
	conn.close();
	%>

				
			
		</center>
	</main>
</body>
</html>
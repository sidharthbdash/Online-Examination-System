<!DOCTYPE html>
<html>
<head>
	<title>Manage Instruction</title>
	<link rel="stylesheet" type="text/css" href="css/studentstyle.css">

</head>
<body>
	<%@ page import= "java.sql.*"%>
	<%! int i=1; %>
	<%! String s; %>
	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "jenar");
	Statement st=conn.createStatement();
	String sql="select * from instruction";
	ResultSet rs=st.executeQuery(sql);
	try{
		if(rs!=null)
		{
	%>
<main>
		<center>
			
			<section class="middle"  style="height: 420px">
					<h1>List of Instructions</h1><br>
				<hr color=#033BAB>
				
				<section class="list">
				<table class="table" border="1" cellpadding="5">
  					<tr>
  					  <th>Sl No.</th>
  					  <th>Instructions</th>
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
			 			<%=rs.getString("instruction") %>
						
					</td>
					<td><a href="inupdate.jsp?id=<%=rs.getString("instruction")%>" id="say_hello">+Update</a><br><a href="indelete.jsp?id=<%=rs.getString("instruction")%>" id="say_hello"> - Delete</a></td>

				
			<%
				i++;
			}
			i=1;

			%>
				</table>
				</section>
				<hr color=#033BAB>
				<input type="button" name="Exit" style="white-space: normal;" value="Add Instruction" class="btn" onclick="window.location.href='addInstruction.jsp';"></th>
				<input type="button" name="Exit"  value="Back" class="btn" onclick="window.location.href='adminpage.jsp';">

			</section>
			<%
		}
		
		

	}
	


	catch(Exception e)
	{

	}
	st.close();
	rs.close();
	conn.close();
	%>

				
			
		</center>
	</main>
</body>
</html>
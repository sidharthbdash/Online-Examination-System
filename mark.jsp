<!DOCTYPE html>
<html>
<head>
	<title>Mark Obtained</title>
	<link rel="stylesheet" type="text/css" href="css/studentstyle.css">

</head>
<body>
	<%@ page import= "java.sql.*"%>
	<%! int i=1; %>
	<%
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "jenar");
	Statement st=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
	String sql="select * from mark";
	ResultSet rs=st.executeQuery(sql);
	try{
		if(rs!=null)
		{rs.last();
	%>
<main>
		<center>
			
			<section class="middle"  style="height: 370px">
					<h1>Welcome <%=session.getAttribute("user")%></h1><br>
				<hr color=#033BAB>
					<h3 style="margin-top: 10px;"><u>Mark Obtained</u></h3>
				
				<section class="list" style="height: 180px;">
				<table class="table" border="1" cellpadding="5"  style="width: 400px;">
  					<tr>
  					  <th align="left">No of Questions Attempted</th>
  					  <td style="padding: 5px;"><%=rs.getString(2)%></td>
  					</tr>
  					<tr>
  					  <th align="left">No of Correct Ans</th>
  					  <td style="padding: 5px;"><%=rs.getString(1)%></td>
  					</tr>
  					<tr>
  					  <th align="left">Total Mark Obtained</th>
  					  <td style="padding: 5px;"><%=rs.getString(1)%></td>
  					</tr>
				</table>
				</section>
				<hr color=#033BAB>
				<input type="button" name="Next" style="white-space: normal;" value="Exit" class="btn" onclick="window.location.href='index.html';"></th>
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
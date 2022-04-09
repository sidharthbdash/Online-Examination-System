<!DOCTYPE html>
<html>
<head>
	<title>Please read Carefully the Instructions</title>
	<link rel="stylesheet" type="text/css" href="css/studentstyle.css">

</head>
<body>
	<%@ page import= "java.sql.*"%>
	<%! int i=1; %>
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
					<h1>Welcome <%=session.getAttribute("user")%></h1><br>
				<hr color=#033BAB>
					<h3><u>Please read Carefully the Instructions</u></h3>
				
				<section class="list" style="height: 230px;">
				<ul align="justify" style=" margin: 10px;">
	<%
			while(rs.next())
			{
			%>
				<li style="padding: 5px; ">
					<%=i %>.&nbsp;<%=rs.getString("instruction") %>

				</li>
							
			<% i++;
			} i=1;
			%>
				</ul>
				</section>
				<hr color=#033BAB>
				<input type="button" name="Next" style="white-space: normal;" value="Next" class="btn" onclick="window.location.href='questionPage.jsp';"></th>
			</section>
			<%
		}
		
		String sql2="update mark set correct='"+0+"',attempt='"+0+"'";
		st.executeUpdate(sql2);

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
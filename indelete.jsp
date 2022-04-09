<!DOCTYPE html>
<html>
<head>
	<title>Manage Students</title>
	<link rel="stylesheet" type="text/css" href="css/studentstyle.css">

</head>
<body>
	<%@ page import= "java.sql.*"%>
	
	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "jenar");
	Statement st=conn.createStatement();
	//out.print();
	String sql="delete from instruction where instruction='"+request.getParameter("id")+"'";
	
	try{
	int rs=st.executeUpdate(sql);
	%><jsp:forward page="inmanage.jsp"/>
	<%
		}

	catch(Exception e)
	{

	}

	st.close();
	conn.close();
	%>

				
			
		</center>
	</main>
</body>
</html>
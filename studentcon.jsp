<!DOCTYPE html>
<html>
<head>
	<title>Student connect</title>
</head>
<body>
	<%@ page import= "java.sql.*"%>
	<%! String id,password,uid,upd,uname; %>
	<% id=request.getParameter("sid");%>
		<%password=request.getParameter("spwd");%>
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
			while(rs.next())
			{
				if(id.equals(rs.getString("userid")))
					{
						uid=rs.getString("userid");
						uname=rs.getString("name");
						upd=rs.getString("password");
					}
			}
		}
		
		if(password.equals(upd))
			{session.setAttribute("user", uname);
		%>
			<jsp:forward page="instructionpage.jsp"/>
		<% 
		}
		else
		{
		%>
			<jsp:forward page="serror.html"/>
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
</body>
</html>
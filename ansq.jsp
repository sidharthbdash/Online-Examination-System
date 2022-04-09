<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<%@page import="java.sql.*,java.io.*" %>
<%
String ans=request.getParameter("ans");
out.println(ans);

 try {

		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","jenar");
		Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
		
		out.println("he1");

		String sql1="select count(*) from question";
		ResultSet rc=st.executeQuery(sql1);
		rc.next();
		int count=	rc.getInt(1);
		int serial=0;
		int correct=0;
		int attempt=0;
		

		String sql4="select * from quec";
		ResultSet rb=st.executeQuery(sql4);
		while(rb.next())
		{
		serial=rb.getInt("counter");
		}
		String sql="select * from question";
		ResultSet rs=st.executeQuery(sql);
		
	
		rs.absolute(serial);
		out.println("hello");
		String crctans=rs.getString("ans");
		if(ans.equals(crctans))
	{
		
		
		String sql6="select * from mark";
		ResultSet ra=st.executeQuery(sql6);
		
		while(ra.next())
		{
			
			correct=ra.getInt(1);
			attempt=ra.getInt(2);
      }
		
	
		correct++;
		attempt++;
		String sql2="update mark set correct='"+correct+"',attempt='"+attempt+"'";
		st.executeUpdate(sql2);
	
		
	}
	else
	{
		
		

		String sql5="select * from mark";
		ResultSet ra=st.executeQuery(sql5);
		while(ra.next())
		{
     		correct=ra.getInt("correct");
      		attempt=ra.getInt("attempt");
		}
	
		attempt++;
		String sql2="update mark set correct='"+correct+"',attempt='"+attempt+"'";
		st.executeUpdate(sql2);
	
	}
	
	
	
	serial++;
	String sql3="update quec set counter='"+serial+"'";
	st.executeUpdate(sql3);
	if(serial > count)
	{

		String sql2="update quec set counter=1";
		st.executeUpdate(sql2);
		response.sendRedirect("mark.jsp");	
	}
	response.sendRedirect("questionPage.jsp");
		


}
catch(Exception e)
{
out.println("hey");
//response.sendRedirect("questionPage.jsp");
}


%>
</body>
</html>
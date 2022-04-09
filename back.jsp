
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<%@page import="java.sql.*,java.io.*" %>
<%
String ans=request.getParameter("q");
int serial=0;


 try {

		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","jenar");
		Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
		

String sql1="select count(*) from question";
ResultSet rc=st.executeQuery(sql1);
rc.next();
int count=	rc.getInt(1);
		

		String sql4="select * from quec";
		ResultSet rb=st.executeQuery(sql4);
		while(rb.next())
		{
		serial=rb.getInt("counter");
		}
		if(serial>1)
		{
		--serial;
		}
		String sql5="update quec set counter='"+serial+"'";
		st.execute(sql5);
		
		
		
		
		response.sendRedirect("questionPage.jsp");
 }
 catch(Exception e)
 {
	 
 }
		
		%>
		



</body>
</html>
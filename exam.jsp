<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	<%@ page import= "java.sql.*"%>
	
	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");

	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "jenar");
	
	Statement st=conn.createStatement();

	String sql="select * from studentdata";
	ResultSet rs=st.executeQuery(sql);

	if (rs!=null) {
	%>
	<ol>
	<%
		while(rs.next())
		{
			%>
			<li><%=rs.getString("name")%></li>
			<%
		}
	%>
	</ol>

	<%

	st.close();
	rs.close();
	conn.close();
		
	}
	
	%>
</body>
</html>
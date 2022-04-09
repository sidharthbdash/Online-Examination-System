<!DOCTYPE html>
<html>
<head>
	<title>Add instruction to Database</title>
</head>
<body>
	<%@ page import= "java.sql.*"%>
	<%! String id; %>
	<% id=request.getParameter("instid");%>
	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "jenar");
	Statement st=conn.createStatement();
	String sql="insert into instruction values('"+id+"')";
	try{
	int rs=st.executeUpdate(sql);
	if(rs==1){
			out.println("added successfully");
			%><jsp:forward page="inmanage.jsp"/>
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
</html>
<!DOCTYPE html>
<html>
<head>
	<title>Add student to Database</title>
</head>
<body>
	<%@ page import= "java.sql.*"%>
	<%! String id,nid; %>
	<% nid=request.getParameter("uinid");%>

	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "jenar");
	Statement st=conn.createStatement();
	String sql="UPDATE instruction SET instruction = '"+nid+"' WHERE instruction = '"+session.getAttribute("id")+"'";
	try{
	int rs=st.executeUpdate(sql);
	if(rs==1){
			out.println("added successfully");
			%>
			<jsp:forward page="inmanage.jsp"/>
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
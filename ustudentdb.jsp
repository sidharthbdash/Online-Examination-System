<!DOCTYPE html>
<html>
<head>
	<title>Add student to Database</title>
</head>
<body>
	<%@ page import= "java.sql.*"%>
	<%! String id,name,password; %>
	<% id=request.getParameter("usid");%>
	<% name=request.getParameter("usname");%>
	<%password=request.getParameter("uspwd");%>
	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "jenar");
	Statement st=conn.createStatement();
	String sql="UPDATE studentdata SET name = '"+name+"', password= '"+password+"' WHERE userid = '"+id+"'";
	try{
	int rs=st.executeUpdate(sql);
	if(rs==1){
			out.println("added successfully");
			%>
			<jsp:forward page="smanage.jsp"/>
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
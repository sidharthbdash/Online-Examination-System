<!DOCTYPE html>
<html>
<head>
	<title>Add instruction to Database</title>
</head>
<body>
	<%@ page import= "java.sql.*"%>
	<%! String que,op1,op2,op3,op4,ans; %>
	<% que=request.getParameter("que");%>
	<% op1=request.getParameter("op1");%>
	<% op2=request.getParameter("op2");%>
	<% op3=request.getParameter("op3");%>
	<% op4=request.getParameter("op4");%>
	<% ans=request.getParameter("ans");%>
	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "jenar");
	Statement st=conn.createStatement();
	String sql="insert into question values('"+que+"','"+op1+"','"+op2+"','"+op3+"','"+op4+"','"+ans+"')";
	try{
	int rs=st.executeUpdate(sql);
	if(rs==1){
			out.println("added successfully");
			response.sendRedirect("qmanage.jsp");
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
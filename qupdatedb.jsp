<!DOCTYPE html>
<html>
<head>
	<title>Add student to Database</title>
</head>
<body>
	<%@ page import= "java.sql.*"%>
	<%! String qid,op1,op2,op3,op4,ans; %>
	<% qid=request.getParameter("que");
		op1=request.getParameter("op1");
		op2=request.getParameter("op2");
		op3=request.getParameter("op3");
		op4=request.getParameter("op4");
		ans=request.getParameter("ans");
		%>

	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "jenar");
	Statement st=conn.createStatement();

	String sql="UPDATE question SET question = '"+qid+"',option1='"+op1+"',option2='"+op2+"',option3='"+op3+"',option4='"+op4+"',ans='"+ans+"' WHERE question = '"+session.getAttribute("id")+"'";

	try{
	int rs=st.executeUpdate(sql);
	if(rs==1){
			out.println("added successfully");
			%>
			<jsp:forward page="qmanage.jsp"/>
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
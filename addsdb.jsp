<!DOCTYPE html>
<html>
<head>
	<title>Add student to Database</title>
</head>
<body>
	<%@ page import= "java.sql.*"%>
	<%! String id,name,password; %>
	<% id=request.getParameter("asid");%>
	<% name=request.getParameter("asname");%>
	<%password=request.getParameter("aspwd");%>
	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "jenar");
	Statement st=conn.createStatement();
	String sq="select * from studentdata";
	ResultSet rs2=st.executeQuery(sq);

	while(rs2.next())
			{
				if(id.equals(rs2.getString("userid")))
					{
						response.sendRedirect("exit.jsp");
		
						
					}
			}


	String sql=	"insert into studentdata values('"+name+"','"+id+"','"+password+"')";
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
<!DOCTYPE html>
<html>
<head>
	<title>Manage Question</title>
	<link rel="stylesheet" type="text/css" href="css/studentstyle.css">
	<link rel="stylesheet" type="text/css" href="css/questionstyle.css">

<script>
var deadline = new Date("Dec 05, 2019 18:00:00").getTime(); 
var x = setInterval(function() { 
var now = new Date().getTime(); 
var t = deadline - now; 
var days = Math.floor(t / (1000 * 60 * 60 * 24)); 
var hours = Math.floor((t%(1000 * 60 * 60 * 24))/(1000 * 60 * 60)); 
var minutes = Math.floor((t % (1000 * 60 * 60)) / (1000 * 60)); 
var seconds = Math.floor((t % (1000 * 60)) / 1000); 
document.getElementById("demo").innerHTML = hours + "h " + minutes + "m " + seconds + "s "; 
	if (t < 0) { 
		clearInterval(x); 
		window.location.href = "mark.jsp"
		document.getElementById("demo").innerHTML = "EXPIRED"; 
		document.forma.p.disabled = true;
		document.forma.n.disabled = true;
		//document.formb.send.style.display = "block";
	} 
}, 1000);
</script>
</head>
<body>
	<%@ page import= "java.sql.*"%>
	<%! int i=1; %>
	<%
	int serial=0;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "jenar");
	Statement st=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);

	try{String sql="select count(*) from question";
		ResultSet rs=st.executeQuery(sql);
		if(rs!=null)
		{rs.next();
			int count=rs.getInt(1);

			String sql2="select * from quec";
			ResultSet rb=st.executeQuery(sql2);
			
			while(rb.next())
			{
				 serial=rb.getInt("counter");
			}
			if(serial<=count){
				String sql4="select * from question";

				ResultSet rs1=st.executeQuery(sql4);
				rs1.absolute(serial);
				session.setAttribute("rowno",rs.getRow());
	%>
<main>
		<center>
			
			<section class="middle"  style="height: 430px">
					<h1>Welcome <%=session.getAttribute("user")%><div style="font-size: 19px;" id="timer" ><span id="demo"></span></div></h1><br>
				<hr color=#033BAB>
				
				<section class="list">
				<form action="ansq.jsp" method="get">
					<h3 align="justify">&nbsp;<%=serial%>. &nbsp;<%=rs1.getString(1)%> </h3>
					<section>
						<table>
							<tr>
								<td>
										<label class="container">
  										<input type="radio" value="a" name="ans">A.&nbsp;<%=rs1.getString(2)%>
  										<span class="checkmark"></span>
										</label>
								</td>
								<td>
										<label class="container">
  										<input type="radio" value="b" name="ans">B.&nbsp;<%=rs1.getString(3)%>
  										<span class="checkmark"></span>
										</label>
								</td>
							</tr>
							<tr>
								<td>
										<label class="container">
  										<input type="radio" value="c" name="ans">C.&nbsp;<%=rs1.getString(4)%>
  										<span class="checkmark"></span>
										</label>
								</td>
								<td>
										<label class="container">
  										<input type="radio"  value="d" name="ans">D.&nbsp;<%=rs1.getString(5)%>
  										<span class="checkmark"></span>
										</label>
								</td>
							</tr>
						</table>
										
  										<input type="radio" style="display: none; visibility: hidden;opacity: 0"  checked value="zero" name="ans">
  										
					</section>


				
				</section>
				<hr color=#033BAB>
				<input type="submit" name="Ans" value="Answer" class="btn" >
		<% 	if(serial==1)	{ %>
				<input type="button" name="back"  value="Back" class="btn" disabled>
		<%
			}else{ %>	
				<input type="button" name="back"  value="Back" class="btn" onclick="window.location.href='back.jsp?rowno=<%=rs.getRow()%>';">
		<%}%>
				<input type="button" name="next"  value="Next" class="btn" onclick="window.location.href='next.jsp?rowno=<%=rs.getRow()%>';">
				</form>
			</section>
			<%
		}
		}	

	}
	catch(Exception e)
	{

	}
	st.close();
	//rs.close();
	conn.close();
	%>	
		</center>
	</main>
</body>

</html>
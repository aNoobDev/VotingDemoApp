<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*" %>



<!DOCTYPE html>
<html>
<head>
<title>Voting Page</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Bootstrap/css/bootstrap-grid.min.css"
	type="text/css"></link>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Bootstrap/css/bootstrap-grid.min.css.map"
	type="text/css"></link>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Bootstrap/css/bootstrap-reboot.min.css"
	type="text/css"></link>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Bootstrap/css/bootstrap-reboot.min.css.map"
	type="text/css"></link>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Bootstrap/css/bootstrap.min.css"
	type="text/css"></link>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Bootstrap/css/bootstrap.min.css.map"
	type="text/css"></link>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/JavaScript"
	src="${pageContext.request.contextPath}/Bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/JavaScript"
	src="${pageContext.request.contextPath}/Bootstrap/js/bootstrap.min.js"></script>
<script type="text/JavaScript"
	src="${pageContext.request.contextPath}/assets/js/tableSearch.js"></script>
<%
	String url="jdbc:mysql://localhost:3306/hackers?useSSL=false&serverTimezone=UTC";
	String user="root";
	String pass="root";
	Connection con=null;
	Statement statement=null,statementFirstId=null;
	ResultSet rs=null,rs1=null;
	String name=null;
	String link = request.getParameter("link");
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection(url,user,pass);
		//System.out.println("Connection Successful");
		
		statement = con.createStatement();
		statementFirstId = con.createStatement();
		 
		rs = statement.executeQuery("SELECT * FROM hackerr_detail");
		if(link==null)
		{
			ResultSet rs3=statementFirstId.executeQuery("SELECT id FROM hackers.hackerr_detail LIMIT 1");;
			rs3.next();
			link=rs3.getString("id");
		}
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection(url,user,pass);
		Statement statement1 = con.createStatement();
		rs1=statement1.executeQuery("SELECT * FROM hackerr_detail where id="+link);
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	String msg=(String)request.getSession().getAttribute("msg6");
	if(msg==null)
		msg="Welcome!";
 %>
 <script>
function myFunction()
{
	request.getSession().setAttribute("id",$(this).attr('id'));
	console.log($(this).attr('id'));
}
</script>
</head>

	<body>
		<div class="container">
		<div class="col-md-8 offset-md-2">
			<h1 style="text-align:center">Hacker's Voting Contest</h1>
			<div class="row">
				<div class="col-md-5">
					<form action="#" method="get">
						<div class="input-group">
							<input class="form-control" id="system-search" name="q"
								placeholder="Search hacker" required>
						</div>
					</form>
				</div>
				<div class="col-md-8">
					<p>Note: <i>Click on hacker's name for more details.</i></p><hr class="my-2"></hr><h3 style="color:green"><%=msg%></h3>
				</div>
				<table class="table table-striped table-list-search">
					<thead class="thead-dark">
						<th>S.no</th>
						<th>Name </th>
						<th>Vote</th>
					</thead>
					<%
						int i=0;
						while (rs.next()) {
							i+=1;
					%>
					<tr>
						<td><%=i%></td>
						<td><a href="Voting.jsp?link=<%=rs.getString("id")%>"><%=rs.getString("name")%></a></td>
						<td>
							<form action="HackersVoting" method="post">
								<button type="submit" name="<%=rs.getString(1)%>"id="<%=rs.getString(1)%>" class="btn btn-light" >
									<i class="material-icons" style="color:red" data-toggle="tooltip" data-placement="top" title="Click to Vote <%=rs.getString("name")%>">favorite_border</i>
								</button>
							</form>
						</td>
					</tr>
					<% } %>
				</table>
			<h4>Details</h4>
			<table class="table table-bordered">
			  <thead>
			  	  <th>SR No.</th>
			      <th>Name</th>
			      <th>Age</th>
			      <th>Town</th>
			      <th>Edit</th>
			   </thead>
			<% while(rs1.next()){%>
			  <tr>
			    <td>1</td>
			    <td><%=rs1.getString(2)%></td>
			    <td><%=rs1.getString(3)%></td>
			    <td><%=rs1.getString(4)%></td>
			    <td>
			    	<form action="userAuth.jsp">
								<button type="submit" name="<%=rs1.getString(1)%>"id="<%=rs1.getString(1)%>" onclick="myFunction()" class="btn btn-primary btn-xs" >
								<i class="material-icons">edit</i>
								</button>
					</form>
				</td>
			   </tr>
			  <% } %>
		   </table>
		 </div>
	 	</div>
	</div>
</body>
</html>
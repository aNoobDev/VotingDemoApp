<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*" %>



<!DOCTYPE html>
<html>
<head>
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
	Statement statement=null;
	ResultSet rs=null;
	int k=0;
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection(url,user,pass);
		//System.out.println("Connection Successful");
		
		statement = con.createStatement();
		
		rs=statement.executeQuery("SELECT * FROM hackerr_detail");
		
		//System.out.println(rs.getString(2));
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	String msg=(String)request.getSession().getAttribute("msg2");
 %>
 
</head>
	<body>
		<div class="container">
		<div class="col-md-8 offset-md-2">
			<h1 style="text-align:center">Current LeaderBoard</h1>
			
			<h4 style="text-align:center; color:green"><%=msg %></h4>
			<div class="row">
				<div class="col-md-5">
					<form action="#" method="get">
						<div class="input-group">
							<input class="form-control" id="system-search" name="q"
								placeholder="Search hacker" required>
						</div>
						<hr class="my-2"></hr>
					</form>
				</div>
				<table class="table table-striped table-list-search">
					<thead class="thead-dark">
						<th>S.no</th>
						<th>Name</th>
						<th>Total Vote</th>
					</thead>
					<%
						int i=0;
						while (rs.next()) {
							i+=1;
					%>
					<tr>
						<td><%=i%></td>
						<td><%=rs.getString("name")%></td>
						<td><%=rs.getString("Vote_Count") %></td>
					</tr>
					<% } %>
				</table>			
		 </div>
	 	</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit</title>
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
	if (session.getAttribute("Username") == null)
	response.sendRedirect("LogIn.jsp");
%>
<%
String url = "jdbc:mysql://localhost:3306/hackers?useSSL=false&serverTimezone=UTC";
String user = "root";
String pass = "root";
Connection con = null;
Statement statement = null;
ResultSet rs = null;
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(url, user, pass);
	//System.out.println("Connection Successful");

	statement = con.createStatement();

	rs = statement.executeQuery("SELECT * FROM hackerr_detail");

} 
catch (Exception e) {
	e.printStackTrace();
}
%>
<%String msg=(String)request.getSession().getAttribute("msg5");
		if(msg==null)
			msg="Welcome!";
%>
</head>

<body>
	<div class="container">
		<div class="col-md-8 offset-md-2">
			<h1>Edit/Delete Candidate</h1><hr class="my-2"></hr><h3 style="color:green"><%=msg%></h3>
			<div class="row">
				<div class="col-md-6">
					<form action="#" method="get">
						<div class="input-group">
							<input class="form-control" id="system-search" name="q"
								placeholder="Search table" required>
						</div>
					</form>
					<hr class="my-1">
				</div>
				<table class="table table-striped table-list-search">
					<thead class="thead-dark">
						<th>S.no</th>
						<th>ID</th>
						<th>Name</th>
						<th>Age</th>
						<th>Town</th>
						<th>Total Vote</th>
						<th>Edit</th>
						<th>Delete</th>
					</thead>
					<%
						int i=0;
						while (rs.next()) {
							i+=1;
					%>
					<tr>
						<td><%=i%></td>
						<td><%=rs.getString(1)%></td>
						<td><%=rs.getString(2)%></td>
						<td><%=rs.getString(3)%></td>
						<td><%=rs.getString(4)%></td>
						<td><%=rs.getString(5)%></td>
						<td>
							<form action="edit2.jsp" method="post">
								<button type="submit" name="<%=rs.getString(1)%>"id="<%=rs.getString(1)%>" class="btn btn-primary btn-xs" >
								<i class="material-icons">edit</i>
								</button>
							</form>
							

						</td>
						<td>
							<form action="update2" method="post">
								<button type="submit" name="<%=rs.getString(1)%>" class="btn btn-light"  >
									<i  class="material-icons" style="color:red">delete</i>
								</button>
							</form>
						</td>
					</tr>
					<%
						}
					%>
				</table>
				<form action="logout" method="get">
		       		<button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" name="add" >Logout</button>       
		          	<hr class="my-2">
		          </form>
		 </div>
	 	</div>
	</div>
		          
</body>
</html>
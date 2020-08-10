<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Candidates</title>

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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/login.css"
	type="text/css"></link>

<script type="text/JavaScript"
	src="${pageContext.request.contextPath}/Bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/JavaScript"
	src="${pageContext.request.contextPath}/Bootstrap/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>

<%
	String url = "jdbc:mysql://localhost:3306/hackers?useSSL=false&serverTimezone=UTC";
	String user = "root";
	String pass = "root";
	Connection con = null;
	String nameEdit=null;
	String ageEdit=null;
	String townEdit=null;
	String id=null;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(url, user, pass);
		//System.out.println("Connection Successful");

		Statement statement3 = con.createStatement();
		id=(String)request.getSession().getAttribute("id5");
		ResultSet rs1 = statement3.executeQuery("SELECT * FROM hackers.hackerr_detail where id="+id);

		while (rs1.next()) {
				nameEdit=rs1.getString("name");
				ageEdit= rs1.getString("age");
				townEdit= rs1.getString("Town");

			}
		

	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</head>
<body>

	<div class="container">
	   <div class="row">
	     <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
	       <div class="card card-signin my-5">
	         <div class="card-body">
	           <h1 class="card-title text-center font-weight-bold text-primary">Edit Candidate</h1>
	           <p>Note: <i>Form is filled with current details of the candidate.</i></p>
	           <form class="form-signin" action="update5" method="post">
	             <div class="form-label-group">
	               <input type="text" name="uname" id="editPerson" class="form-control edit" value="<%=nameEdit%>" required autofocus>
	               <label for="editPerson" class="edit">Hacker's Name</label>
	             </div>
	             <div class="form-label-group">
	               <input type="text" name="age" id="editAge" class="form-control edit" value="<%=ageEdit%>" required autofocus>
	               <label for="editPerson" class="edit">Hacker's Age</label>
	             </div>
	             <div class="form-label-group">
	               <input type="text" name="town" id="editTown" class="form-control edit" value="<%=townEdit%>" required autofocus>
	               <label for="editTown" class="edit">Hacker's Town</label>
	             </div>
	
	             <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" name="<%=id%>">Update Details</button>
	             <hr class="my-2">
	           </form>
	           
	           <form action="logout" method="get">
		       		<button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" name="add" >Logout</button>       
		          	<hr class="my-2">
		          </form>
	         </div>
	       </div>
	     </div>
	   </div>
	 </div>
		
</body>
</html>
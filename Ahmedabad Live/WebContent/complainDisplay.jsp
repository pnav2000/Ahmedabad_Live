<%@page import="com.pnv.dbconnection.ComplainManagement"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.pnv.module.User" %>
     <%@page import="com.pnv.module.Complain" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Complain Display	</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">

    <link href="css/custom.css" rel="stylesheet">

</head>
<body>
 <% response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
 HttpSession sessionObj = request.getSession(false);
	User user = new User();
	 List<Complain> complainList = new ArrayList<>();
	if(sessionObj.getAttribute("userdata") == null){
		response.sendRedirect(request.getContextPath()+"/signin.jsp");
	}else{
		user = (User)sessionObj.getAttribute("userdata");
		complainList = new ComplainManagement().findAllComplainByUserId(user.getId());

	}
%> 

 <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Logo and responsive toggle -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="welcome.jsp">
                	<span class="glyphicon glyphicon-fire"></span> 
                	Ahmedabad Live
                </a>
            </div>
            <!-- Navbar links -->
            <div class="collapse navbar-collapse" id="navbar">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="complainRegister.jsp">COMPLAIN REGISTER</a>
                    </li>
                    <li  class="active">
                        <a href="complainDisplay.jsp">COMPLAIN DISPLAY</a>
                    </li>
                    <li>
                        <a href="profile.jsp">PROFILE</a>
                    </li>
                    <li>
                        <a href="feedback.jsp">FEEDBACK</a>
                    </li>
                    <li style="padding-left:500px;">
                        <a href="<%= request.getContextPath()%>/signout">Log Out</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

	<div class="jumbotron feature">
		<div class="container" style="color:black;">
			<h1 ><span class="glyphicon glyphicon-equalizer"></span> Ahmedabad Live</h1>
			<p>Using Java and Apache Technology</p>
			<p>At Brainy Beam Pvt. Lmt. </p>
		</div>
	</div>
<h1 style="padding-left:200px; border: 3px solid black;"><b>Your Complain:-</b></h1><br><br>
    <!-- Content -->
    <div class="container" style="color:black;">
		

    </div>
    <!-- /.container -->
	
	<table border='1' cellpadding='10' cellspacing='10' width='50%' align='center' style="color:black;padding:0px,50%,0px,50%;">
		<tr style="text-align:center">
			<th>ID</th>
			<th>Name</th>
			<th>Email</th>
			<th>Address</th>
			<th>Contact</th>
			<th>Title</th>
			<th>Desccription</th>
			<th>Update</th>
			<th>Delete</th>
		</tr>
		
		<% int count=1; %>
		<c:forEach var="complain" items="<%=complainList %>">
			<tr>
				<td><c:out value="<%= count++ %>"/></td>
				<td>${complain.name}</td>
				<td>${complain.email}</td>
				<td>${complain.address}</td>
				<td>${complain.contact}</td>
				<td><c:out value="${complain.title}"/></td>
				<td><c:out value="${complain.discription}"/></td>
				<td><a href="<%= request.getContextPath() %>/complainServlet?id=${complain.id }&action=update">Update</a></td>
				<td><a href="<%= request.getContextPath() %>/complainServlet?id=${complain.id }&action=delete">Delete</a></td>
			</tr>
		</c:forEach>
	</table>

	
    <!-- jQuery -->
    <script src="js/jquery-1.11.3.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
	
	<!-- IE10 viewport bug workaround -->
	<script src="js/ie10-viewport-bug-workaround.js"></script>
	
	<!-- Placeholder Images -->
	<script src="js/holder.min.js"></script>
</body>
</html>
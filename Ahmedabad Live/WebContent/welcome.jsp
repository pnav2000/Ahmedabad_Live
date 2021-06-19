<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.pnv.module.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Welcome Page	</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">

    <link href="css/custom.css" rel="stylesheet">

</head>
<body>
 <% response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); %>
<% HttpSession sessionObj = request.getSession(false);
User user = new User();
if(sessionObj.getAttribute("userdata") != null){
	user = (User)sessionObj.getAttribute("userdata");
}else{
	response.sendRedirect(request.getContextPath()+"/signin.jsp");
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
                    <li>
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
	</div><br><br>
	
	

    <center> <h1>Well Come <u><%= user.getName() %></u></h1> </center>
	
	
	
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.pnv.module.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit Profile	</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/custom.css" rel="stylesheet">
    <style>
    label{
    	width:200px;
    }
    </style>

</head>
<body>
 <% response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
 HttpSession sessionObj = request.getSession(false);
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
                    <li class="active">
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
<h1 style="padding-left:200px; border: 3px solid black;"><b>Your Data:-</b></h1>
    <!-- Content -->
    <h1 style="padding-left:200px;"><u><b>Edit Profile</b></u></h1>
    <!-- Content -->
    <div class="container">
		<form name="myForm" action="userServlet" onsubmit="return validateForm()" method="post">
  			<h3><div class="middle"><br>
		  		<label>Name : </label><br>
		  		<input type="text" name="name" placeholder="Enter Your Name" size="30" value="<%=user.getName() %>" required><br><br>
		
				<label> Enter E-mail : </label><br>
				<input type="text" name="email" placeholder="Enter Your E-mail" size="30" value="<%=user.getEmail() %>" required><br><br>
				
				<label> Enter Contact : </label><br>
				<input type="tel" name="contact" placeholder="Enter Your Contact" size="30" value="<%=user.getContact() %>" required><br><br>
				
				<label> Enter Date Of Birth: </label><br>
				<input type="date" name="dob"  placeholder="Enter Your Dateofbirth" value="<%=user.getDob() %>"><br><br>	
				
				<label> Select Gender :</label><br>
				<input type="radio" name="gender" value="Male" checked="checked">Male
				<input type="radio" name="gender" value="Female">Female
				<input type="radio" name="gender" value="Other">Other <br><br>
				
				<label> Enter College Name :</label><br>
				<input type="text" name="college" placeholder="Enter College Name" value="<%=user.getCollege() %>" size="30" required><br><br>
				
				<label> Enter Address :</label><br>
				<textarea name="address" style="padding:0.6em;margin:1em 0;" placeholder="Enter Address" rows="4" cols="30" required><%=user.getAddress() %></textarea><br>
				

				
		  		<span><input type="submit" value="Submit" class="button" style="vertical-align:middle"></span>
		  		<br><br>
		  		</div>
  		</h3>
</form>
    <!-- /.container -->
	
	

	
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.pnv.module.User" %>
     <%@page import="com.pnv.module.Complain" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Complain Page	</title>

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
                    <li class="active">
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
	</div>
	<% if(request.getAttribute("complain") == null){ %>
			
	
<h1 style="padding-left:200px;"><u><b>Complain Detials</b></u></h1>
    <!-- Content -->
    <div class="container">
		<form name="myForm" action=complainServlet onsubmit="return validateForm()" method="post">
  			<h3><div class="middle"><br>
		  		<label>Name : </label><br>
		  		<input type="text" name="complainerName" placeholder="Enter Your Name" size="30" required><br><br>
		
				<label> Enter E-mail : </label><br>
				<input type="text" name="complainerEmail" placeholder="Enter Your E-mail" size="30" required><br><br>
				
				<label> Enter Address :</label><br>
				<textarea name="complainerAddress" style="padding:0.6em;margin:1em 0;" placeholder="Enter Your Address" rows="4" cols="30" required> </textarea><br>	
				
				<label> Enter Contact Number : </label><br>
				<input type="tel" name="complainerContact" placeholder="Enter Your Contact Number" size="30" required><br><br>
				
				<label> Enter Title of Complain :</label><br>
				<input type="text" name="complainerTitle" placeholder="Enter Title of Complain" size="30" required><br><br>
				
				<label> Enter Discription of Complain :</label><br>
				<textarea name="complainerDiscription" style="padding:0.6em;margin:1em 0;" placeholder="Enter Description of Complain" rows="4" cols="30" required></textarea><br>			
		
		  		<span><input type="submit" value="Submit" class="button" style="vertical-align:middle"></span>
		  		<br><br>
		  		</div>
  		</h3>
</form>
<%  } else {
		Complain complain = (Complain) request.getAttribute("complain");
	%>
		<h1 style="padding-left:200px;"><u><b>Edit Complain Detials</b></u></h1>
    <!-- Content -->
    <div class="container">
		<form name="myForm" action=complainServlet onsubmit="return validateForm()" method="post">
  			<h3><div class="middle"><br>
		  		<label>Name : </label><br>
		  		<input type="text" name="complainerName" placeholder="Enter Your Name" size="30" value="<%=complain.getName() %>" required><br><br>
		
				<label> Enter E-mail : </label><br>
				<input type="text" name="complainerEmail" placeholder="Enter Your E-mail" size="30" value="<%=complain.getEmail() %>" required><br><br>
				
				<label> Enter Address :</label><br>
				<textarea name="complainerAddress" style="padding:0.6em;margin:1em 0;" placeholder="Enter Your Address" rows="4" cols="30" required><%=complain.getAddress() %> </textarea><br>	
				
				<label> Enter Contact Number : </label><br>
				<input type="tel" name="complainerContact" placeholder="Enter Your Contact Number" value="<%=complain.getContact()%>" size="30" required><br><br>
				
				<label> Enter Title of Complain :</label><br>
				<input type="text" name="complainerTitle" placeholder="Enter Title of Complain" value="<%=complain.getTitle() %>" size="30" required><br><br>
				
				<label> Enter Discription of Complain :</label><br>
				<textarea name="complainerDiscription" style="padding:0.6em;margin:1em 0;" placeholder="Enter Description of Complain" rows="4" cols="30" required><%=complain.getDiscription() %></textarea><br>			
		
				<input type="hidden" name="id" value="<%=complain.getId() %>">
				
		  		<span><input type="submit" value="Submit" class="button" style="vertical-align:middle"></span>
		  		<br><br>
		  		</div>
  		</h3>
</form>
<% }  %>
        <!-- Heading -->
        

    </div>
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
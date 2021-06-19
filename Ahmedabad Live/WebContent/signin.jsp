<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign In Page</title>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="css/bootstrap.min.css" rel="stylesheet">

    <link href="css/custom.css" rel="stylesheet">
<style>
	p,label,form{
	color:black;
	font-size:30px;
	}
	.center{
	display:flex;
	justify-content:center;
	align-content:center;
	}
</style>
</head>
<body>
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
                <a class="navbar-brand" href="index.jsp">
                	<span class="glyphicon glyphicon-fire"></span> 
                	Ahmedabad Live
                </a>
            </div>
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

<center><h1 style="border-bottom: 2px solid grey;margin-bottom:20px;"><b>Sign In Details</b></h1></center>
	<form action="SignIn" method="post" class="center">  
        <div class="container">   
            <label>Email : </label><br>   
            <input type="text" placeholder="Enter Username" name="email" required><br><br>
              
            <label>Password : </label><br>   
            <input type="password" placeholder="Enter Password" name="password" required><br><br>  
            
            <button type="submit">Login</button>   
       <p>New User? <a href="signup.jsp" style="color:blue;">Sign Up Now</a></p>
        </div>   
    </form>
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
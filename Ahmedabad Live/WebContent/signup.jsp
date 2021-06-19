<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Register Page</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="css/bootstrap.min.css" rel="stylesheet">

    <link href="css/custom.css" rel="stylesheet">
	<script type="text/javascript" src="js/script.js"></script>
	<style>
	p{
	font-size:30px;
	}
	label{
		width:300px;
		}

center{
	border-bottom: 2px solid grey;
	margin-bottom: 3px;
}

form{
	margin-top: 5px;
	padding-left:10%;
}
.button {
  display: inline-block;
  border-radius: 4px;
  background-color: greenyellow;
  border: none;
  color: black;
  text-align: center;
  font-size: 28px;
  width: 200px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
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
	<center><h1><b>Registration Details</b></h1></center>
	<form name="myForm" action="SignUp" onsubmit="return validateForm()" method="post">
  			<h3><div class="middle"><br>
		  		<label>Name: </label>
		  		<input type="text" name="name" placeholder="Enter Your Name" size="30"><br><br>
		
				<label> Enter Contact No:</label>				
				<input type="tel" name="contact" maxlength="10" placeholder="Enter Your Mobile" size="30"><br><br>
							
				<label> Enter E-mail: </label>
				<input type="text" name="email" placeholder="Enter Your E-mail" size="30"><br><br>
					
				<label> Enter Password:</label>
				<input type="password" name="password" placeholder="Enter Your Password" size="30"><br><br>
							
				<label> Enter Confirm Password:</label>
				<input type="password" name="re-password" placeholder="Enter Your Confirm Password" size="30"><br><br>
							
				<label> Enter Date Of Birth: </label>
				<input type="date" name="dateofbirth"  placeholder="Enter Your Dateofbirth"><br><br>
							
				<label> Select Gender :</label>
				<input type="radio" name="gender" value="Male" checked="checked">Male
				<input type="radio" name="gender" value="Female">Female
				<input type="radio" name="gender" value="Other">Other <br><br>
							
				<label> Enter College Name :</label>
				<input type="text" name="college" placeholder="Enter Your College Name" size="30"><br><br>
						
				<label> Enter Address:</label><br>
				<textarea name="address" style="padding:0.6em;margin:1em 0;" placeholder="Enter Your Address" rows="4" cols="30"></textarea><br>	
							
				<!-- <label> Select Profile Image:</label>
				<input type="file" name="file"><br><br> -->
		
		  		<span><input type="submit" value="Submit" class="button" style="vertical-align:middle"></span>
		  		&nbsp
		  		<p>Already have account? <a href="signin.jsp" style="color:blue">Sign In</a></p>
		  		</div>
  		</h3>
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

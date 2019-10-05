<%-- 
    Document   : register
    Created on : 20.May.2018, 18:02:31
    Author     : Hicran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
  <style>
   .jumbotron {
      background-color: #9400D3;
      color: #eeeeee;
      padding: 100px 25px;
  }
  .bg-grey {
      background-color: #cccccc;
  }
  .container-fluid {
      padding: 60px 50px;
  }
  .form-container{
	
	align-content: center;
	
}
.title{
	font-family: 'Pacifico', cursive;
	text-align:center;
}
  </style>
    <title>Registration</title>
    
</head>
<body>
    <div class="container-fluid bg text-center">
    <div class="jumbotron text-center">
        <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-12">
    <form action="Login" class="form-container" method="POST">
	<h1 class="title">Registration</h1>
					   	
        <input type="text" name="userName2" class="form-control" placeholder="Enter your name"></br>
  						
        <input type="password" name="password2" class="form-control"  placeholder="Enter the password"></br>
  
  	<button type="submit" name="submit"  class="btn btn btn-warning btn-block btn-danger" value="register">Register</button>
    </form>
                 </div>
                      <img src="img/logo1.jpg" alt="Trulli" width="500" height="333">
           
    </div>
    </div>
    </div>
</body>
</html>

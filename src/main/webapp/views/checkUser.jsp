<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<style>
html{
height: 100%;
}
body {
  background-image: url("https://media.istockphoto.com/id/1216828053/photo/shopping-basket-with-fresh-food-grocery-supermarket-food-and-eats-online-buying-and-delivery.jpg?s=612x612&w=0&k=20&c=Chd527v9-ho7a-S5k24kcWWfB92Pj3Vh2eM0erk74AU=");
	background-repeat: no-repeat;
   
    
  background-size: 100% 100%;
}
h1 {
text-shadow: 6px 6px 6px  #123456, 1px 1px 1px #0AFFFF;
  font-family: 'Passion One';
	color: black;
  text-align: center;
  font-weight: bold;
;
}
.container{
	left:2%;
  position: relative;
  width: 100%;
  height: 400px;
  margin-bottom: 5%;
  border-radius: 20px;
  padding: 40px;
  box-sizing: border-box;
  background: rgb(160, 150, 110);
  font-weight: bold;
  box-shadow: 14px 14px 20px #cbced1, -14px -14px 20px white;
}
.btn-back{
font-size: 18px !important;
  
    font-weight: 600;
    padding: 20px 20px;
	background-color: rgb(219, 161, 64);
	left: 50%;
	
}
.btn-blue{
font-size: 18px !important;
  margin-top:2%;
    font-weight: 600;
    padding: 20px 20px;
	background-color: #cdc7b2;
	
	
}
label{
	font-weight: bold;
	font-size: 30px !important;
	margin-bottom:2%;
	margin-top:2%;
}

</style>
</head>
<body>

	<div align="center" class="container">
		
		<div> <h1>Welcome ${uname }</h1> </div>
			
			<div> <h3> Confirm User </h3> </div>
			
			<div> <h4>${msg }</h4> </div>
		<form action="checkUser" method="post">
			<div class="form-group">
			
			
				<label for="exampleInputEmail1">Password</label> 
				<input type="password" style="width:50%;"
					class="form-control }"
					id="exampleInputEmail1" name="password" min="0" max="100" step="0.1"
					aria-describedby="emailHelp" placeholder="ex:Name@123" required="required" />

			</div>
			<input type="text" name="name" value="${name },${uname }"
				placeholder="${name }" hidden="true" />

			<button type="submit" class="btn-blue">Submit</button>
		</form>
	</div>

	<div align="center">
		<a href="back?name=${name }"><button class="btn-back"> Back to Welcome Page </button></a>
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>
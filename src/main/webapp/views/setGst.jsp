<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Set Gst</title>
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
  background-image: url("https://img1.cgtrader.com/items/2209985/2f8a8a1c31/food-market-or-grocery-store-or-supermarket-3d-model-max.jpg");
	background-repeat: no-repeat;
   
    
  background-size: 100% 200%;
}
@import url(https://fonts.googleapis.com/css?family=Bungee);
h1 {
  text-shadow: 4px 4px 4px #ffcf0f, 2px 2px 1px white;
  font-family: 'Bungee';
  font-weight: bold;
}
.btn-back{
font-size: 18px !important;
  
    font-weight: 600;
    padding: 20px 20px;
	background-color: rgb(219, 161, 64);
	left: 50%;
	
}
.container{
margin-top:2%;
	left:2%;
  position: relative;
  width: 100%;
  height: 350px;
  margin-bottom: 5%;
  border-radius: 20px;
  padding: 40px;
  box-sizing: border-box;
  background: rgb(160, 150, 110);
  font-weight: bold;
  box-shadow: 14px 14px 20px #cbced1, -14px -14px 20px white;
}
.btn-blue{
font-size: 18px !important;
  margin-top:2%;
    font-weight: 600;
    padding: 20px 20px;
	background-color: #cdc7b2;
	
	
}
</style>
</head>
<body>
	<div align="center" class="container">
		<h1>Set GST and Discount</h1>
		<form action="saveGstDiscount" method="post">
			<div style="width: 50%;">
				<label for="exampleInputEmail1">Set Gst</label> <input type="number"
					class="form-control ${l2.size() > 0 ? 'is-invalid':'' }"
					id="exampleInputEmail1" name="gst" min="0" max="100" step="0.1"
					aria-describedby="emailHelp" placeholder="${gd.gst }%" required="required"/>
				<c:forEach var="e" items="${l2 }">
					<div id="validationServer03Feedback" class="invalid-feedback">
						${e }</div>
				</c:forEach>

			</div>
			<div class="form-group" style="width: 50%;">
				<label  for="exampleInputPassword1">Set Discount</label> <input
					type="number"
					class="form-control ${l3.size() > 0 ? 'is-invalid':'' }"
					id="exampleInputPassword1" name="discount" min="0" max="100"
					step="0.1" placeholder="${gd.discount }%" required="required"/>
					
				<c:forEach var="e" items="${l3 }">
					<div id="validationServer03Feedback" class="invalid-feedback">
						${e }</div>
				</c:forEach>
			</div>
			<input type="text" name="shop_name" value="${shop_name }"
				placeholder="${shop_name }" hidden="true" />

			<button type="submit" class="btn-blue">Submit</button>
		</form>
	</div>

	<div align="center">
		<a href="back?name=${name }"><button class="btn-back">Back to Welcome Page </button></a>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>
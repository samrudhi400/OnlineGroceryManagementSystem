<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
crossorigin="anonymous">
<style>
html{
height: 100%;
}
body {
  background-image: url("https://img.freepik.com/premium-photo/blurred-background-blur-grocery-supermarket-shopping-mall-background_7190-2719.jpg?w=2000");
	background-repeat: no-repeat;
   
    
  background-size: 100% 200%;
}
@import url(https://fonts.googleapis.com/css?family=Bungee);
h1 {
  text-shadow: 4px 4px 4px #ffcf0f, 2px 2px 1px white;
  font-family: 'Bungee';
  font-weight: bold;
}
table { 
	width: 900px; 
	border-collapse: collapse; 
	
	margin-left: 20%;
	}

/* Zebra striping */
tr:nth-of-type(odd) { 
	background: #98AFC7; 
	}
tr:nth-of-type(even) { 
	background: #838996; 
	}
th { 
	background: black; 
	color: white; 
	font-weight: bold; 
	}

td, th { 
	padding: 10px; 
	border: 1px solid #ccc; 
	text-align: center; 
	font-size: 18px;
	}

/* 
Max width before this PARTICULAR table gets nasty
This query will take effect for any screen smaller than 760px
and also iPads specifically.
*/
@media 
only screen and (max-width: 760px),
(min-device-width: 768px) and (max-device-width: 1024px)  {

	table { 
	margin-top: 10%;
	  	width: 100%; 
	  	
	}

	/* Force table to not be like tables anymore */
	table, thead, tbody, th, td, tr { 
		display: block; 
		
	}
	
	/* Hide table headers (but not display: none;, for accessibility) */
	thead tr { 
		position: absolute;
		top: -9999px;
		left: -9999px;
	}
	
	tr { border: 1px solid #ccc; }
	
	td { 
		/* Behave  like a "row" */
		border: none;
		border-bottom: 1px solid #eee; 
		position: relative;
		padding-left: 50%; 
	}

	td:before { 
		/* Now like a table header */
		position: relative;
		/* Top/left values mimic padding */
		top: 6px;
		left: 6px;
		width: 45%; 
		padding-right: 10px; 
		white-space: nowrap;
		/* Label the data */
		content: attr(data-column);
font-family: 'Ubuntu';
		color: #000;
		font-weight: bold;
	}

}

.btn-blue{
font-size: 18px !important;
  margin-top:15%;
    font-weight: 600;
    padding: 20px 20px;
	background-color: #cdc7b2;
	
	
}
.btn-back{
font-size: 18px !important;
  
    font-weight: 600;
    padding: 20px 20px;
	background-color: rgb(219, 161, 64);
	left: 50%;
	margin-top: 5%;
}
.container{
	left:2%;
  position: relative;
  width: 100%;
  height: 150px;
  margin-bottom: 5%;
  border-radius: 20px;
  padding: 40px;
  box-sizing: border-box;
  background: rgb(160, 150, 110);
  font-weight: bold;
  box-shadow: 14px 14px 20px #cbced1, -14px -14px 20px white;
}
</style>
</head>
<body>
<div>
	<div style="display: flex; justify-content: space-around; margin-bottom: 30px">
		<h1>Welcome ${uname }</h1>
		<h1>Add Your Product Here</h1>
	</div>
	<h4 style="color: green;" align="center">${msg }</h4>
	<div class="container" align="center">
		<form action="addItems" method="post">
			<div style="display: flex; justify-content: space-around;">
				<div>
					Product Id: 
					<input type="number"name="id" class="form-control ${l1.size() > 0 ? 'is-invalid':'' }" required="required"/>
					<c:forEach var="e" items="${l1 }">
						<div style="color: red;" id="validationServer03Feedback" class="invalid-feedback">
							${e }</div>
					</c:forEach>
				</div>
			<div>
				Items Name: <input type="text" name="name"
				class="form-control ${l2.size() > 0 ? 'is-invalid':'' }" required="required" 
				 />
				<c:forEach var="e" items="${l2 }">
							<div style="color: red;" id="validationServer03Feedback" class="invalid-feedback">
								${e }</div>
				</c:forEach>
			</div>
			<div>
				Quantity: <input type="number" name="qty"
							class="form-control ${l3.size() > 0 ? 'is-invalid':'' }"  required="required"
							 min="0" />
				<c:forEach var="e" items="${l3 }">
					<div style="color: red;" id="validationServer03Feedback" class="invalid-feedback">
					${e }</div>
				</c:forEach>
			</div>
			<div>
						Price: <input type="number" name="price"
							class="form-control ${l4.size() > 0 ? 'is-invalid':'' }" required="required" step="any" min="0" />
						<c:forEach var="e" items="${l4 }">
							<div style="color: red;" id="validationServer03Feedback" class="invalid-feedback">
								${e }</div>
						</c:forEach>
			</div>
			<div>
						<input type="text" name="shop_name" value="${shop_name }"
							placeholder="${shop_name }" hidden="true" required="required" />
			</div>
			<div>
						<input type="submit" value="SAVE" class="btn-blue">
			</div>
		</div>
	</form>
</div>

<div>
	<table>
		<thead>
			<tr>
						<th style="padding-right: 50px;">Product Id</th>
						<th style="padding-right: 50px;">Items Name</th>
						<th style="padding-right: 50px;">Quantity</th>
						<th style="padding-right: 50px;">Price</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="prd" items="${p}">
						<tr>
							<td style="padding-right: 100px;">${prd.id}</td>
							<td style="padding-right: 100px;">${prd.name }</td>
							<td style="padding-right: 100px;">${prd.qty }</td>
							<td style="padding-right: auto;">${prd.price }</td>
						</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div align="center" >
			
				<a href="back?name=${name } "><button class="btn-back">Back To Home Page</button></a>
			
</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
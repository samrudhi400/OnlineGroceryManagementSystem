<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update or Delete Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<style>
<<<<<<< HEAD
html{
height: 100%;
}
body {
  background-image: url("https://i.pinimg.com/736x/d1/fb/cb/d1fbcb7f3772e8f17a24fa8e586df6ca.jpg");
	background-repeat: no-repeat;
   
    
  background-size: 100% 200%;
}
@import url(https://fonts.googleapis.com/css?family=Bungee);
h1 {
  text-shadow: 4px 4px 4px orange, 2px 2px 1px white;
  font-family: 'Bungee';
  font-weight: bold;
}
table { 
	width: 900px; 
	border-collapse: collapse; 
	text-align='center';
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
=======
html {
	height: 100%;
}

body {
	background-image:
		url("https://i.pinimg.com/736x/d1/fb/cb/d1fbcb7f3772e8f17a24fa8e586df6ca.jpg");
	background-repeat: no-repeat;
	background-size: 100% 200%;
}

@import url(https://fonts.googleapis.com/css?family=Bungee);

h1 {
	text-shadow: 4px 4px 4px orange, 2px 2px 1px white;
	font-family: 'Bungee';
	font-weight: bold;
}

table {
	width: 900px;
	border-collapse: collapse; text-align ='center';
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
>>>>>>> 52dce04bc68cc567731e792fee31c1d35d71101b

/* 
Max width before this PARTICULAR table gets nasty
This query will take effect for any screen smaller than 760px
and also iPads specifically.
*/
<<<<<<< HEAD
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
=======
@media only screen and (max-width: 760px) , ( min-device-width : 768px)
	and (max-device-width: 1024px) {
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
>>>>>>> 52dce04bc68cc567731e792fee31c1d35d71101b
		position: absolute;
		top: -9999px;
		left: -9999px;
	}
<<<<<<< HEAD
	
	tr { border: 1px solid #ccc; }
	
	td { 
		/* Behave  like a "row" */
		border: none;
		border-bottom: 1px solid #eee; 
		position: relative;
		padding-left: 50%; 
	}

	td:before { 
=======
	tr {
		border: 1px solid #ccc;
	}
	td {
		/* Behave  like a "row" */
		border: none;
		border-bottom: 1px solid #eee;
		position: relative;
		padding-left: 50%;
	}
	td:before {
>>>>>>> 52dce04bc68cc567731e792fee31c1d35d71101b
		/* Now like a table header */
		position: relative;
		/* Top/left values mimic padding */
		top: 6px;
		left: 6px;
<<<<<<< HEAD
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
  margin-top:1%;
    font-weight: 600;
    padding: 20px 20px;
	background-color: #cdc7b2;
	
	
}
.btn-back{
font-size: 18px !important;
  
    font-weight: 600;
    padding: 20px 20px;
=======
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

.btn-blue {
	font-size: 18px !important;
	margin-top: 1%;
	font-weight: 600;
	padding: 20px 20px;
	background-color: #cdc7b2;
}

.btn-back {
	font-size: 18px !important;
	font-weight: 600;
	padding: 20px 20px;
>>>>>>> 52dce04bc68cc567731e792fee31c1d35d71101b
	background-color: rgb(219, 161, 64);
	left: 50%;
	margin-top: 5%;
}
<<<<<<< HEAD
.container{
	left:2%;
  position: relative;
  width: 100%;
  height: 200px;
  margin-bottom: 5%;
  border-radius: 20px;
  padding: 40px;
  box-sizing: border-box;
  background: rgb(160, 150, 110);
  font-weight: bold;
  box-shadow: 14px 14px 20px #cbced1, -14px -14px 20px white;
}
.btn-danger{
border-radius: 3px !important;
font-size: 14px !important;
   
    font-weight: 500;
    padding: 6px 10px;
	background-color: #FF0000;
	color: #FFFFFF;
}
</style>

<body>
		<div
			style="display: flex; justify-content: space-around; margin-bottom: 30px">
				<h1>Welcome ${uname }</h1>
			
				<h1>Update or Delete Your Product Here</h1>
			
		</div>

			
		<div align="center" style="color: purple; margin-bottom: 20px"><h1>Edit
			the Product Here</h1></div>
			
			<h4 align="center">${msg }</h4>

		<div class="container">
			<form action="saveTheEdit" method="post">
				<div style="display: flex; justify-content: space-around;">
					<div style="color: green;">
						ID: <input type="number" name="id"
							placeholder="give the id(id constant)"
							class="form-control ${l1.size() > 0 ? 'is-invalid':'' }" />
						<c:forEach var="e" items="${l1 }">
							<div id="validationServer03Feedback" class="invalid-feedback">
								${e }</div>
						</c:forEach>
					</div>
					<div style="color: green;">
						NAME: <input type="text" name="name"
							class="form-control ${l2.size() > 0 ? 'is-invalid':'' }" />
						<c:forEach var="e" items="${l2 }">
							<div id="validationServer03Feedback" class="invalid-feedback">
								${e }</div>
						</c:forEach>
					</div>
					<div style="color: green;">
						QTY: <input type="number" name="qty"
							class="form-control ${l3.size() > 0 ? 'is-invalid':'' }" />
						<c:forEach var="e" items="${l3 }">
							<div id="validationServer03Feedback" class="invalid-feedback">
								${e }</div>
						</c:forEach>
					</div>
					<div style="color: green;">
						PRICE: <input type="number" name="price"
							class="form-control ${l4.size() > 0 ? 'is-invalid':'' }" />
						<c:forEach var="e" items="${l4 }">
							<div id="validationServer03Feedback" class="invalid-feedback">
								${e }</div>
						</c:forEach>
					</div>
					<input type="text" name="shop_name" value="${shop_name }"
						placeholder="${shop_name }" hidden="true" />
				</div>
				<div align="center" >
					<input type="submit" value="SAVE" class="btn-blue"
						style="align-self: center; color: black; background-color: #8BDE94; margin-left: 10px">
				</div>
			</form>
		</div>
<div>
				<table>
				<thead>
					<tr>
						<th style="padding-right: 45px; padding-left: 50px;">Product
							Id</th>
						<th style="padding-right: 45px;">Items Name</th>
						<th style="padding-right: 45px;">Quantity</th>
						<th style="padding-right: 55px;">Price</th>
						<th style="padding-right: 100px;">Delete</th>

					</tr>
				</thead>
			<tbody>
					<c:forEach var="prd" items="${p}">
						<tr>
							<td style="padding-right: 100px;">${prd.id}</td>
							<td style="padding-right: 100px;">${prd.name }</td>
							<td style="padding-right: 90px;">${prd.qty }</td>
							<td style="padding-right: 90px;">${prd.price }</td>
							<td><a
								href="delete?name=${prd.name },${shop_name },${name }"><button class="btn-danger">
									Delete</button></a></td>

						</tr>

					</c:forEach>
					</tbody>
				</table>
			</div>
		

		<div align="center" style="color: green; margin-top: 5%">
			
				<a href="back?name=${name } "><button class="btn-back"> Back to Home Page</button></a>
			
		</div>
=======

.container {
	left: 2%;
	position: relative;
	width: 100%;
	height: 200px;
	margin-bottom: 5%;
	border-radius: 20px;
	padding: 40px;
	box-sizing: border-box;
	background: rgb(160, 150, 110);
	font-weight: bold;
	box-shadow: 14px 14px 20px #cbced1, -14px -14px 20px white;
}

.btn-danger {
	border-radius: 3px !important;
	font-size: 14px !important;
	font-weight: 500;
	padding: 6px 10px;
	background-color: #FF0000;
	color: #FFFFFF;
}



/* From uiverse.io */
button {
 width: 150px;
 height: 50px;
 cursor: pointer;
 display: flex;
 align-items: center;
 background: red;
 border: none;
 border-radius: 5px;
 box-shadow: 1px 1px 3px rgba(0,0,0,0.15);
 background: #e62222;
}

button, button span {
 transition: 200ms;
}

button .text {
 transform: translateX(35px);
 color: white;
 font-weight: bold;
}

button .icon {
 position: absolute;
 border-left: 1px solid #c41b1b;
 transform: translateX(110px);
 height: 40px;
 width: 40px;
 display: flex;
 align-items: center;
 justify-content: center;
}

button svg {
 width: 15px;
 fill: #eee;
}

button:hover {
 background: #ff3636;
}

button:hover .text {
 color: transparent;
}

button:hover .icon {
 width: 150px;
 border-left: none;
 transform: translateX(0);
}

button:focus {
 outline: none;
}

button:active .icon svg {
 transform: scale(0.8);
}


</style>

<body>
	<div
		style="display: flex; justify-content: space-around; margin-bottom: 30px">
		<h1>Welcome ${uname }</h1>

		<h1>Update or Delete Your Product Here</h1>

	</div>


	<div align="center" style="color: purple; margin-bottom: 20px">
		<h1>Edit the Product Here</h1>
	</div>

	<h4 align="center">${msg }</h4>

	<div class="container">
		<form action="saveTheEdit" method="post">
			<div style="display: flex; justify-content: space-around;">
				<div style="color: green;">
					ID: <input type="number" name="id"
						placeholder="give the id(id constant)"
						class="form-control ${l1.size() > 0 ? 'is-invalid':'' }" />
					<c:forEach var="e" items="${l1 }">
						<div id="validationServer03Feedback" class="invalid-feedback">
							${e }</div>
					</c:forEach>
				</div>
				<div style="color: green;">
					NAME: <input type="text" name="name"
						class="form-control ${l2.size() > 0 ? 'is-invalid':'' }" />
					<c:forEach var="e" items="${l2 }">
						<div id="validationServer03Feedback" class="invalid-feedback">
							${e }</div>
					</c:forEach>
				</div>
				<div style="color: green;">
					QTY: <input type="number" name="qty"
						class="form-control ${l3.size() > 0 ? 'is-invalid':'' }" />
					<c:forEach var="e" items="${l3 }">
						<div id="validationServer03Feedback" class="invalid-feedback">
							${e }</div>
					</c:forEach>
				</div>
				<div style="color: green;">
					PRICE: <input type="number" name="price"
						class="form-control ${l4.size() > 0 ? 'is-invalid':'' }" />
					<c:forEach var="e" items="${l4 }">
						<div id="validationServer03Feedback" class="invalid-feedback">
							${e }</div>
					</c:forEach>
				</div>
				<input type="text" name="shop_name" value="${shop_name }"
					placeholder="${shop_name }" hidden="true" />
			</div>
			<div align="center">
				<input type="submit" value="SAVE" class="btn-blue"
					style="align-self: center; color: black; background-color: #8BDE94; margin-left: 10px">
			</div>
		</form>
	</div>
	<div>
		<table>
			<thead>
				<tr>
					<th style="padding-right: 45px; padding-left: 50px;">Product
						Id</th>
					<th style="padding-right: 45px;">Items Name</th>
					<th style="padding-right: 45px;">Quantity</th>
					<th style="padding-right: 55px;">Price</th>
					<th style="padding-right: 100px;">Delete</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="prd" items="${p}">
					<tr>
						<td style="padding-right: 100px;">${prd.id}</td>
						<td style="padding-right: 100px;">${prd.name }</td>
						<td style="padding-right: 90px;">${prd.qty }</td>
						<td style="padding-right: 90px;">${prd.price }</td>
						<td><a href="delete?name=${prd.name },${shop_name },${name }">
								<!-- 		<button class="btn-danger"> Delete</button> -->

								<button class="noselect">
									<span class="text">Delete</span><span class="icon"><svg
											xmlns="http://www.w3.org/2000/svg" width="24" height="24"
											viewBox="0 0 24 24">
											<path
												d="M24 20.188l-8.315-8.209 8.2-8.282-3.697-3.697-8.212 8.318-8.31-8.203-3.666 3.666 8.321 8.24-8.206 8.313 3.666 3.666 8.237-8.318 8.285 8.203z"></path></svg></span>
								</button>


						</a></td>

					</tr>

				</c:forEach>
			</tbody>
		</table>
	</div>


	<div align="center" style="color: green; margin-top: 5%">

		<a href="back?name=${name } "><button class="btn-back">
				Back to Home Page</button></a>

	</div>
>>>>>>> 52dce04bc68cc567731e792fee31c1d35d71101b
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>
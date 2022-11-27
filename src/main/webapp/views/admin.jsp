<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<style>
/*Bringing visual appeal to our responsive 'navbar' project*/
body {
	background-image:
		url("https://imageio.forbes.com/specials-images/imageserve/6150c256fa3d9c7c51f6ae3e/0x0.jpg?format=jpg&width=1200");
	background-repeat: no-repeat;
	background-size: cover;
}

@import url(https://fonts.googleapis.com/css?family=Passion+One);
/*Centering our h1*/
h1 {
	text-shadow: 6px 6px 6px #123456, 1px 1px 1px #0AFFFF;
	font-family: 'Passion One';
	color: black;
	text-align: center;
	font-weight: bold;
	;
}
/*Attaching the flex-box to our listed items, giving the links space within that box, and centering the text*/
ul {
	display: flex;
	list-style-type: none;
	margin: 40px 100px;
	font: 17px helvetica;
	text-align: center;
}
/*Giving our li a background and height-space*/
li {
	flex: 1;
	height: 66px;
	background: #123456;
}
/*Making the li's inside of our navbar interactive with color change and padding/margin*/
li:hover {
	flex: 1.1;
	transition: all .2s ease;
	background: #333333;
}
/*Styling and sizing our link/letters while giving them a block-level, 'click' ability*/
a {
	display: block;
	position: relative;
	text-decoration: none;
	color: white;
	padding: 23px;
}
/*Giving the middle, border-lines a color and size*/
.navigation li:not(:first-child) {
	border-left: 2px solid #ecf0f1;
}

table {
	width: 900px;
	border-collapse: collapse;
}

/* Zebra striping */
tr:nth-of-type(odd) {
	background: #eee;
}

th {
	background: black;
	color: white;
	font-weight: bold;
}

td,th{
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
		position: absolute;
		top: -9999px;
		left: -9999px;
	}
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
		color: #000;
		font-weight: bold;
	}
}


</style>
</head>
<body>

	<div>

		<h1 align="center">Admin Dashboard</h1>
		<h2 align="center" style="margin-bottom:20px;">Welcome Back!</h2>

		<u style="color: green; ">
			<h3 align="center" style="color: green;">Admin Data</h3>
		</u>

		<div align="center">
			<div>
				<table style="margin-bottom:20px;">
					<thead>
						<tr>
							<th>SL.NO</th>
							<th>Name</th>
							<th>Password</th>
							<th>Phone Number</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="l" items="${list}" varStatus="counter">
							<tr>
								<td>${counter.count}</td>
								<td>${l.name }</td>
								<td>${l.password }</td>
								<td>${l.ph_number }</td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<u style="color: green;">
				<h3 align="center" style="color: green;">User Data</h3>
			</u>

			<div>
				<table>
					<thead>
						<tr>
							<th>SL.NO</th>
							<th>Name</th>
							<th>Password</th>
							<th>Phone Number</th>
							<th>Shop Name</th>
							<th>Delete User</th>
							<th>View Product</th>
						</tr>
					</thead>
					<tbody style="height: 10px;">
						<c:forEach var="list" items="${l }" varStatus="counter">

							<tr >
								<td>${counter.count}</td>
								<td>${list.user_name }</td>
								<td>${list.password }</td>
								<td>${list.ph_number }</td>
								<td>${list.shop_name }</td>
								<td style="background-color:red;"><a 
									href="deteleUser?user_name=${list.user_name },${list.shop_name }">Delete</a>
								</td>
								<td style="background-color:green;"><a 
									href="viewUserProduct?user_name=${list.user_name },${list.shop_name }">
										View Product </a></td>

							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
			
				<u style="color: green;">
				<h3 align="center" style="color: green; margin-top: 40px;">${shop_name }
					Product Details</h3>
			</u>

			<div>
				<table>
					<thead>
						<tr>
							<th>SL.NO</th>
							<th>Product Id</th>
							<th>Product Name</th>
							<th>Product Quantity</th>
							<th>Product Price</th>
							<th>Shop Name</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="listp" items="${listPrd }" varStatus="counter">
							<tr>
								<td>${counter.count}</td>
								<td>${listp.id}</td>
								<td>${listp.name }</td>
								<td>${listp.qty}</td>
								<td>${listp.price }</td>
								<td>${listp.shop_name }</td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		
			

		</div>


		<h3 style="background-color: white; width: 9%; margin-left: 2%;"> <a style="color: blue;" href="login">  Logout</a> </h3>  

	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>
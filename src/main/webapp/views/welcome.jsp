<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
	<style>
  /*Bringing visual appeal to our responsive 'navbar' project*/
html{
height:100%;
}
body {
  background-image: url("https://imageio.forbes.com/specials-images/imageserve/6150c256fa3d9c7c51f6ae3e/0x0.jpg?format=jpg&width=1200");
	background-repeat: no-repeat;
    background-size: cover;
}
@import url(https://fonts.googleapis.com/css?family=Passion+One);
/*Centering our h1*/
h1 {
text-shadow: 6px 6px 6px  #123456, 1px 1px 1px #0AFFFF;
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
  flex:1.1;
  transition:all .2s ease;
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
.navigation li:not(:first-child){
	border-left: 2px solid #ecf0f1;
	}
table { 
	width: 900px; 
	border-collapse: collapse; 
	
	margin-left: 20%;
	}

/* Zebra striping */
tr:nth-of-type(odd) { 
	background: #eee; 
	}
tr:nth-of-type(even){
background: #fff;}
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

		color: #000;
		font-weight: bold;
	}

}

.btn-blue{
font-size: 18px !important;
  
    font-weight: 600;
    padding: 10px 10px;
	background-color: #00FFFF;
	
	
}
  </style>
	
</head>


<body>

	<div 			style="display: flex; justify-content: space-around; margin-bottom: 30px">
				<h1>Welcome ${uname }</h1>
		
				<h1>${shop_name } Shop</h1>
		</div>	
			<nav>
    <ul class="navigation">
      <li><a href="billpage?shop_name=${shop_name }"> Billing Page</a></li>
      <li><a href="addProduct?name=${name },${shop_name }">Add Product </a></li>
      <li><a href="update?name=${name },${shop_name }">Update Product Details</a></li>
      <li><a href="setGst?shop_name=${shop_name}">Set gst and discount</a>	</li>
      <li><a href="editUserInfo?name=${name },${uname }">Edit Your Info</a></li>
            <li><a href="showCustomerHistory?shop_name=${shop_name }">show billing history</a></li>
      <li><a href="login">Log out</a></li>
     
    </ul>
    </nav>
			<h1>Product Details</h1>
		
		<div>			<table>
					<thead>
						<tr>
							<th>Product Id</th>
							<th>Items Name</th>
							<th>Quantity</th>
							<th>Price</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="prd" items="${p}">
							<tr>
								<td>${prd.id}</td>
								<td>${prd.name }</td>
								<td>${prd.qty }</td>
								<td>${prd.price }</td>
							</tr>

						</c:forEach>
					</table>
			
			</div>
		

		

	

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>
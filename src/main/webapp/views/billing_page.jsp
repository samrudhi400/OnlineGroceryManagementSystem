<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Billing Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<style>
html {
	height: 100%;
	width: 100%;
}

body {
	background-image:
		url("https://imageio.forbes.com/specials-images/imageserve/1141999659/0x0.jpg?format=jpg&width=1200");
	background-repeat: no-repeat;
	background-size: 100%;
}

.containers {
	left: 2%;
	position: relative;
	width: 600px;
	height: 350px;
	border-radius: 20px;
	padding: 40px;
	box-sizing: border-box;
	background: rgb(160, 150, 110);
	box-shadow: 14px 14px 20px #cbced1, -14px -14px 20px white;
}

.btn {
	left: 50%;
	border-radius: 3px !important;
}

.bttn {
	position: relative;
	font-size: 18px !important;
	margin-top: 15px !important;
	font-weight: 600;
	padding: 20px 20px;
	margin-left: 35%;
	text-align: left;
	width: 20%;
}

.btn-success {
	font-size: 18px !important;
	margin-top: 15px !important;
	font-weight: 600;
	padding: 10px 50px;
	background-color: #D3C9A1;
}

.btn-blue {
	font-size: 20px !important;
	font-weight: bold;
	padding: 10px 90px;
	background-color: #00FFFF;
}

.btn-green {
	font-size: 18px !important;
	font-weight: bold;
	padding: 10px 10px;
	background-color: #04ba04;
}

.btn-danger {
	border-radius: 3px !important;
	font-size: 14px !important;
	margin-top: 0px !important;
	font-weight: 500;
	padding: 5px 10px;
	background-color: #FF0000;
	color: #FFFFFF;
}

@import url(https://fonts.googleapis.com/css?family=Bungee);

h1 {
	text-shadow: 4px 4px 4px #ffcf0f, 2px 2px 1px white;
	font-family: 'Bungee';
	font-weight: bold;
}

.container {
	position: relative;
	margin-top: 5%;
	left: 3%;
}

.contain {
	position: relative;
	top: 10%;
	right: 3%;
}

table {
	width: 600px;
	border-collapse: collapse;
	overflow: auto;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	text-align: center;
	margin-top: 5%;
}

th {
	padding: 15px;
	background-color: rgb(153, 153, 153);
	color: black;
}

td {
	padding: 15px;
	background-color: #dbd7d7;
	color: #0a0a0a;
}

th {
	text-align: left;
}

thead {th { background-color:#55608f;
	
}
}
</style>

</head>
<body>

	<div align="center" style="color: green;">${msg }</div>

	<div align="center" style="color: green;">
		<h1>Billing</h1>
	</div>

	<div style="display: flex; justify-content: space-between;">
		<div class="containers">
			<form action="addToBill" method="post">
				<div style="display: flex;">
					<div style="margin-right: 160px; color: green">Item id</div>
					<div style="color: green">Quantity</div>
				</div>
				<br> <input type="number" name="id" style="margin-bottom: 10px"
					required="required" min="1"> 
					<input type="number" min="0" value="0"
					name="quantity" style="margin-bottom: 10px" required="required">
				<br>
				<div style="display: flex;">
					<div style="margin-right: 20px; color: green">Price</div>
					<div style="color: green;">
						<input type="number" name="price" min="0" value="0"
							required="required">

						<div class="btn-group" role="group" 
							aria-label="Basic checkbox toggle button group">
							<input type="checkbox" class="btn-check" id="btncheck1"
								autocomplete="off" value="free" name="free" onclick="free()" >
								 <label class="btn btn-outline-primary" for="btncheck1" style="background-color: #075F41;">
								 free</label>
						</div>
								 <input type="submit" class="btn-green"
								style="background: #33FF96; margin-left: 40px;">
						</div>
					</div>
			</form>



			<%-- <input type="text" name="shop_name"  value="${shop_name }" placeholder="${shop_name }" hidden="true" /> --%>
			<br>
			<div style="display: flex; margin-top: 10px;">
				<div style="margin-right: 75px; color: green">Customer name</div>
				<div style="margin-right: 75px; color: green">Phone Number</div>
				<div style="color: green">
					<label for="PM">Payment Methods</label>
				</div>
			</div>

			<br> <input type="text" name="c_name" id="c_name"
				required="required" /> <input id="phn" type="number" name="phn"
				style="margin-bottom: 10px;" required="required" /> <select id="PM"
				name="PM" style="margin-bottom: 10px; width: 100px;">
				<option value="Card">Card</option>
				<option value="Cash">Cash</option>
				<option value="Upi">Upi</option>
			</select> <br>


			<div align="left"
				style="color: green; display: flex; justify-content: space-around;">
				<div>
					<h5>Gst: ${gd.gst }%</h5>
				</div>
				<div>
					<h5>Discount: ${gd.discount }%</h5>
				</div>
			</div>

		</div>


		<div style="margin-right: 3%;">

			<table id="Table">
				<thead>
					<tr>
						<th>SL.NO</th>
						<th>Items</th>
						<th>Price</th>
						<th>Qty</th>
						<th>Total</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody id="body">
					<c:forEach var="prd" items="${p}" varStatus="counter">
						<tr>
							<td>${counter.count}</td>
							<td>${prd.name }</td>
							<td>${prd.price }</td>
							<td>${prd.qty }</td>
							<td>${total.get(counter.count -1) }</td>
							<td><a href="deleteFromList?count=${counter.count }"><button
										class="btn btn-danger">Delete</button></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>



	</div>
	<div style="display: flex; justify-content: space-between;">
		<div style="margin-left: 3%;">

			<table>
				<thead>
					<tr>
						<th>Product Id</th>
						<th>Product Name</th>
						<th>Product Price</th>
						<th>Product Qty</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="l" items="${list }">
						<tr>
							<td>${l.id }</td>
							<td>${l.name }</td>
							<td>${l.price }</td>
							<td>${l.qty }</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>

		</div>


		<div style="margin-right: 70px">
			<h3 class="btn btn-success">Grand Total : Rs ${res }</h3>
			<h3 onmouseenter="a()">
				<a id="print" href="print?shop_name=${list.get(0).getShop_name() }">
					<button class="btn btn-blue">Print</button>
				</a>
			</h3>
		</div>


	</div>

	<div style="margin-right: 70px; margin-top: 20px;" align="right">

		<a href="login"><button class="btn btn-green"
				style="padding: 10px 70px;">Log out</button></a>
	</div>


	<script type="text/javascript">
		let s = document.getElementById("print");
		let h = s.href;
		function a() {

			let c_name = document.getElementById("c_name").value;
			let phn = document.getElementById("phn").value;

			let x = false;
			if (c_name.length == 0 || c_name.length > 15
					|| phn.toString().length > 10 || phn.toString().length < 10) {
				console.log("1");
				alert("Please check the Customer name or Phone Number(Customer name < 15 characters or can't be empty, Phone number will be 10 digits)")
			}

			else if (document.querySelectorAll("#Table tr").length <= 1) {
				console.log("2");
				document.getElementsByTagName('a')[0].removeAttribute('href');
			}

			else {
				let PM = document.getElementById("PM").value;
				console.log(c_name);

				s.href = h + "-" + c_name + "-" + phn + "-" + PM;
			}
			
			// for free button
			let flag = false
			function free(){
				flag = true;
			}

		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
		
	</script>
</body>
</html>
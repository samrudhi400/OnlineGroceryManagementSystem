<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit User</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<style>
@import url(https://fonts.googleapis.com/css?family=Passion+One);

body {
	background-image:
		url("https://imageio.forbes.com/specials-images/imageserve/6150c256fa3d9c7c51f6ae3e/0x0.jpg?format=jpg&width=1200");
	background-repeat: no-repeat;
	background-size: cover;
}
<<<<<<< HEAD
.btn-back{
font-size: 18px !important;
  
    font-weight: 600;
    padding: 20px 20px;
	background-color: rgb(219, 161, 64);
	left: 50%;
	margin-top: 1%;
}
=======

>>>>>>> 52dce04bc68cc567731e792fee31c1d35d71101b
input[type="text"], input[type="number"], input[type="email"] {
	height: 45px;
	border: 1px solid #ddd;
	font-size: 16px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
	background-color: rgba(255, 255, 255, 0.07);
}

input:hover, input:focus {
	outline: none;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
	border-color: #ccc;
}

::placeholder {
	color: #bfbfbf !important;
}

.btn-submit {
	background-color: #fff;
	width: 20%;
	outline: none;
	color: black;
	font-size: 14px;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #1CB94A;
<<<<<<< HEAD
	
=======
	align: center;
>>>>>>> 52dce04bc68cc567731e792fee31c1d35d71101b
}

.btn-submit:hover, .btn-submit:focus {
	color: #fff !important;
	background-color: #1CB94A !important;
	border-color: #fff !important;
}
</style>
</head>
<body>
	<u style="color: green;"><h1 align="center"
			style="color: green; bottom-margin: 20px;">Edit Details</h1></u>
	<div class="container"
		style="background-color: rgba(0, 0, 0, 0.55); border-radius: 5px;">

		<div align="center" style="color: white;">${msg }</div>

		<div style="color: green;">
			<form action="updateUserInfo" method="post">
				<div>
					USER NAME: <input type="text"
						class="form-control ${l1.size() > 0 ? 'is-invalid':'' }"
						id="exampleInputEmail1" name="user_name"
						value="${user.user_name }" aria-describedby="emailHelp"
						placeholder="ex:Sai" />
					<c:forEach var="e" items="${l1 }">
						<div id="validationServer03Feedback" class="invalid-feedback">
							${e }</div>
					</c:forEach>
				</div>

				<div>
					NAME: <input type="text"
						class="form-control ${l2.size() > 0 ? 'is-invalid':'' }"
						id="exampleInputEmail1" name="u_name" value="${user.u_name }"
						aria-describedby="emailHelp" placeholder="ex:Sai Pal" />
					<c:forEach var="e" items="${l2 }">
						<div id="validationServer03Feedback" class="invalid-feedback">
							${e }</div>
					</c:forEach>
				</div>

				<div>
					EMAIL: <input type="email"
						class="form-control ${l3.size() > 0 ? 'is-invalid':'' }"
						id="exampleInputEmail1" name="email" value="${user.email }"
						aria-describedby="emailHelp" placeholder="ex:sai123@gmail.com" />
					<c:forEach var="e" items="${l3 }">
						<div id="validationServer03Feedback" class="invalid-feedback">
							${e }</div>
					</c:forEach>
				</div>

				<div>
					Phone Number: <input type="number" value="${user.ph_number }"
						class="form-control ${l4.size() > 0 ? 'is-invalid':'' }"
						id="exampleInputEmail1" name="ph_number"
						aria-describedby="emailHelp" placeholder="ex:6292618162" />
					<c:forEach var="e" items="${l4 }">
						<div id="validationServer03Feedback" class="invalid-feedback">
							${e }</div>
					</c:forEach>
				</div>

				<div>
					SHOP NAME <input type="text"
						class="form-control ${l5.size() > 0 ? 'is-invalid':'' }"
						value="${user.shop_name }" id="exampleInputEmail1"
						name="shop_name" aria-describedby="emailHelp" placeholder="ex:XYZ" />
					<c:forEach var="e" items="${l5 }">
						<div id="validationServer03Feedback" class="invalid-feedback">
							${e }</div>
					</c:forEach>
				</div>

				<div>
					PASSWORD <input type="text"
						class="form-control ${l6.size() > 0 ? 'is-invalid':'' }"
						id="exampleInputEmail1" name="password" value="${user.password }"
						aria-describedby="emailHelp" placeholder="ex:Sai@123" />
					<c:forEach var="e" items="${l6 }">
						<div id="validationServer03Feedback" class="invalid-feedback">
							${e }</div>
					</c:forEach>
				</div>
				<br>
<<<<<<< HEAD
				<div align="center">
=======
				<div class=" row px-5" >
>>>>>>> 52dce04bc68cc567731e792fee31c1d35d71101b
					
						<input  class="btn-submit" type="submit" value="Update" />
					
				</div>

			</form>
		</div>

<<<<<<< HEAD
		<div align="center" style="color: green; border: thin;">
=======
		<div align="left" style="color: green; border: thin;">
>>>>>>> 52dce04bc68cc567731e792fee31c1d35d71101b
			<h4>
				<a href="back?name=${user.user_name } "><button class="btn-back">Back To Home Page</button></a>
			</h4>
		</div>

	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>
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
.container{
margin-top:2%;
	left:2%;
  position: relative;
  width: 100%;
  height: 500px;
  margin-bottom: 5%;
  border-radius: 20px;
  padding: 40px;
  box-sizing: border-box;
  background: rgb(160, 150, 110);
  font-weight: bold;
  box-shadow: 14px 14px 20px #cbced1, -14px -14px 20px white;
	
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
	align: center;
}

.btn-submit:hover, .btn-submit:focus {
	color: #fff !important;
	background-color: #1CB94A !important;
	border-color: #fff !important;
	align: center;
}
h1 {
text-shadow: 6px 6px 6px  #123456, 1px 1px 1px #0AFFFF;
  font-family: 'Passion One';
	color: white;
  text-align: center;
  
;
}
.widali{
	text-align:center;
	width: 50%;
}

</style>
</head>
<body>
	<u style="color: green;"><h1>Edit Details</h1></u>
	<div align="center" style="color: white;">${msg }</div>
	<div class="container">
		
			<div class="widali">
				<form action="updateUserInfo" method="post">
					<div>
						USER NAME:
						<input type="text" class="form-control ${l1.size() > 0 ? 'is-invalid':'' }"
							id="exampleInputEmail1" name="user_name"
							value="${user.user_name }" aria-describedby="emailHelp"
							placeholder="ex:Sai" required="required" />
							<c:forEach var="e" items="${l1 }">
							<div id="validationServer03Feedback" class="invalid-feedback">
							${e }</div>
							</c:forEach>
					</div>

					<div>
						NAME: 
						<input type="text" class="form-control ${l2.size() > 0 ? 'is-invalid':'' }"
							id="exampleInputEmail1" name="u_name" value="${user.u_name }"
							aria-describedby="emailHelp" placeholder="ex:Sai Pal" required="required"/>
							<c:forEach var="e" items="${l2 }">
							<div id="validationServer03Feedback" class="invalid-feedback">
							${e }</div>
							</c:forEach>
					</div>

					<div>
						EMAIL: 
						<input type="email"
							class="form-control ${l3.size() > 0 ? 'is-invalid':'' }"
							id="exampleInputEmail1" name="email" value="${user.email }"
							aria-describedby="emailHelp" placeholder="ex:sai123@gmail.com" required="required"/>
							<c:forEach var="e" items="${l3 }">
							<div id="validationServer03Feedback" class="invalid-feedback">
							${e }</div>
							</c:forEach>
					</div>

					<div>
						Phone Number: <input type="number" value="${user.ph_number }"
							class="form-control ${l4.size() > 0 ? 'is-invalid':'' }"
							id="exampleInputEmail1" name="ph_number"
							aria-describedby="emailHelp" placeholder="ex:6292618162" required="required"/>
							<c:forEach var="e" items="${l4 }">
							<div id="validationServer03Feedback" class="invalid-feedback">
							${e }</div>
							</c:forEach>
					</div>
	
					<div>
						SHOP NAME <input type="text"
							class="form-control ${l5.size() > 0 ? 'is-invalid':'' }"
							value="${user.shop_name }" id="exampleInputEmail1"
							name="shop_name" aria-describedby="emailHelp" placeholder="ex:XYZ" required="required"/>
							<c:forEach var="e" items="${l5 }">
							<div id="validationServer03Feedback" class="invalid-feedback">
							${e }</div>
							</c:forEach>
					</div>

					<div>
						PASSWORD
							 <input align=center type="text"
							class="form-control ${l6.size() > 0 ? 'is-invalid':'' }"
							id="exampleInputEmail1" name="password" value="${user.password }"
							aria-describedby="emailHelp" placeholder="ex:Sai@123" required="required"/>
							<c:forEach var="e" items="${l6 }">
							<div id="validationServer03Feedback" class="invalid-feedback">
							${e }</div>
							</c:forEach>
					</div>
				<br>
				<div align="center">
					<input  class="btn-submit" type="submit" value="Update" />
				</div>
			</form>
		</div>

		<div align="center">
				<a  href="back?name=${user.user_name } "><button class="btn-submit">Back To Home Page</button></a>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>
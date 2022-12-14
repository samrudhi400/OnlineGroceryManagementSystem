<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
	crossorigin="anonymous">

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<style type="text/css">
::placeholder {
	color: #bfbfbf !important;
}

body {
	padding-top: 90px;
	background-image: url("grocerybg.jpg");
	background-repeat: no-repeat;
	background-size: cover;
}

.panel-login {
	border-color: #ccc;
	box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
	background-color: rgba(255, 255, 255, 0.23);
}

.panel-login>.panel-heading {
	color: #00415d;
	background-color: rgba(255, 255, 255, 0.55);
	border-color: #fff;
	text-align: center;
}

.panel-login>.panel-heading a {
	text-decoration: none;
	color: #666;
	font-weight: bold;
	font-size: 15px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}

.panel-login>.panel-heading a.active {
	color: #029f5b;
	font-size: 18px;
}

.panel-login>.panel-heading hr {
	margin-top: 10px;
	margin-bottom: 0px;
	clear: both;
	border: 0;
	height: 1px;
	background-image: -webkit-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
	background-image: -moz-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
	background-image: -ms-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
	background-image: -o-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
}

.panel-login input[type="text"], .panel-login input[type="number"],
	.panel-login input[type="email"], .panel-login input[type="password"] {
	height: 45px;
	border: 1px solid #ddd;
	font-size: 16px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
	background-color: rgba(255, 255, 255, 0.07);
}

.panel-login input:hover, .panel-login input:focus {
	outline: none;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
	border-color: #ccc;
}

.btn-login {
	color: black;
	outline: none;
	background-color: #fff;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #59B2E6;
}

.btn-login:hover, .btn-login:focus {
	border-color: #fff !important;
	background-color: #59B2E6 !important;
	color: #fff !important;
}

.btn-register {
	background-color: #fff;
	outline: none;
	color: black;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #1CB94A;
}

.btn-register:hover, .btn-register:focus {
	color: #fff !important;
	background-color: #1CB94A !important;
	border-color: #fff !important;
}

.forgot-password {
	background-color: rgba(255, 255, 255, 0.24);
	border-color: rgba(255, 255, 255, 0);
	color: black;
}

/*  */

</style>

</head>
<body>
	<!-- <form action="add" method="post">
	ID: <input type="text" name="id" /> <br>
	Name: <input type="text" name="name" />
	<input type="submit" >
</form> -->
<body>

	<c:if test="${fn:length(msg)==0}"></c:if>
	<c:if test="${fn:length(msg)>0}">
		<h4 align="center" class="alert alert-primary ">${msg }</h4>
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" class="active" id="login-form-link"
									style="color: #478eb8;">Login</a>
							</div>
							<div class="col-xs-6">
								<a href="#" id="register-form-link" style="color: green;">Register</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form id="login-form" action="loginUser" method="post"
									role="form" style="display: block;">


									<div class="form-group">
										<input type="text" name="name" id="username" tabindex="1"
											class="form-control" placeholder="UserName"
											value="${user.user_name }">
									</div>
									<div class="form-group">
										<input type="password" name="password"  id="password"
											tabindex="2" class="form-control" placeholder="Password">
											<input type="checkbox" onclick="myFunction()">Show Password
									</div>

									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit"
													tabindex="4" class="form-control btn btn-login"
													value="Log In">
											</div>
										</div>
									</div>

								</form>
								<form id="register-form" action="register" method="post"
									role="form" style="display: none;">
									<div class="form-group">
										<input type="text" name="user_name" id="username" tabindex="1"
											class="form-control ${l1.size() > 0 ? 'is-invalid':'' }"
											placeholder="UserName(ex:name123)" value="${user.user_name }" />

										<c:forEach var="e" items="${l1 }">
											<div id="validationServer03Feedback" class="invalid-feedback" style="font-weight: bold; font-size:15px; color:black">
												${e }</div>
										</c:forEach>

									</div>

									<div class="form-group">
										<input type="text" name="u_name" id="u_name" tabindex="1"
											class="form-control ${l2.size() > 0 ? 'is-invalid':'' }"
											placeholder="Name(ex:sai pal)" value="${user.u_name }" />

										<c:forEach var="e" items="${l2 }">
											<div id="validationServer03Feedback" class="invalid-feedback" style="font-weight: bold; font-size:15px; color:black">
												${e }</div>
										</c:forEach>
									</div>

									<div class="form-group">
										<input type="email" name="email" id="email" tabindex="1"
											class="form-control ${l3.size() > 0 ? 'is-invalid':'' }"
											placeholder="Email(ex:abc@gmail.com)" value="${user.email }" />

										<c:forEach var="e" items="${l3 }">
											<div id="validationServer03Feedback" class="invalid-feedback" style="font-weight: bold; font-size:15px; color:black">
												${e }</div>
										</c:forEach>
									</div>


									<div class="form-group">
										<input type="number" name="ph_number" id="phnumber"
											tabindex="1"
											class="form-control ${l4.size() > 0 ? 'is-invalid':'' }"
											placeholder="PhoneNumber(ex:6370628207)"
											value="${user.ph_number }" />

										<c:forEach var="e" items="${l4 }">
											<div id="validationServer03Feedback" class="invalid-feedback" style="font-weight: bold; font-size:15px; color:black">
												${e }</div>
										</c:forEach>
									</div>

									<div class="form-group">
										<input type="text" name="shop_name" id="shopname" tabindex="1"
											class="form-control ${l5.size() > 0 ? 'is-invalid':'' }"
											placeholder="Shop Name(ex:XYZ)" value="${user.shop_name }" />

										<c:forEach var="e" items="${l5 }">
											<div id="validationServer03Feedback" class="invalid-feedback" style="font-weight: bold; font-size:15px; color:black">
												${e }</div>
										</c:forEach>
									</div>

									<div class="form-group">
										<input type="password" name="password" id="password"
											tabindex="2"
											class="form-control ${l6.size() > 0 ? 'is-invalid':'' }"
											placeholder="Password(ex:Sai@122)" />

										<c:forEach var="e" items="${l6 }">
											<div id="validationServer03Feedback" class="invalid-feedback" style="font-weight: bold; font-size:15px; color:black">
												${e }</div>
										</c:forEach>
									</div>

									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="register-submit"
													id="register-submit" tabindex="4"
													class="form-control btn btn-register" value="Register Now">
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<script type="text/javascript">
		$(function() {

			$('#login-form-link').click(function(e) {
				$("#login-form").delay(100).fadeIn(100);
				$("#register-form").fadeOut(100);
				$('#register-form-link').removeClass('active');
				$(this).addClass('active');
				e.preventDefault();
			});
			$('#register-form-link').click(function(e) {
				$("#register-form").delay(100).fadeIn(100);
				$("#login-form").fadeOut(100);
				$('#login-form-link').removeClass('active');
				$(this).addClass('active');
				e.preventDefault();
			});

		});
		
		function myFunction() {
			  var x = document.getElementById("password");
			  if (x.type === "password") {
			    x.type = "text";
			  } else {
			    x.type = "password";
			  }
			}
	</script>

</body>

</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login  Reg</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	<div class="container d-flex flex-column justify-content-center gap-3 align-content-center p-5 margin-2">
		<h1 class="text-primary">Welcome!</h1>
		<p class="h5">Join our growing community.</p>
		<div class="d-flex justify-content-between gap-3">
		
			<div class="card bg-dark text-light text-left col-5 d-flex flex-column justify-content-between gap-3 align-content-center p-5 margin-2">
				<h1 class="text-primary text-center">Register</h1>
	
				<form:form action="/register" method="POST"
					modelAttribute="newUser">
					<div class="d-flex justify-content-between gap-1">
						<form:label class="text-left text-nowrap" path="userName">Username</form:label>
						<form:input class="" type="text" path="userName" />
					</div>
						<form:errors class="text-danger fw-bold fst-italic" path="userName" />
					<div class="d-flex justify-content-between gap-1">
						<form:label class="text-nowrap" path="email">Email</form:label>
						<form:input class="" type="text" path="email" />
					</div>
						<form:errors class="text-danger fw-bold fst-italic" path="email" />
					<div class="d-flex justify-content-between gap-1">
						<form:label class="text-nowrap" path="password">Password</form:label>
						<form:input class="" type="password" path="password" />
					</div>
						<form:errors class="text-danger fw-bold fst-italic" path="password" />
					<div class="d-flex justify-content-between gap-1">
						<form:label class="text-nowrap" path="confirm">Confirm Password</form:label>
						<form:input class="" type="password" path="confirm" />
					</div>
						<form:errors class="text-danger fw-bold fst-italic" path="confirm" />
					<div class="text-end my-2">
						<button class="btn btn-success" type="submit">Submit</button>
					</div>
				</form:form>
			</div>
			<div class="card bg-dark text-light text-left col-5 d-flex flex-column justify-content-start gap-3 align-content-center p-5 margin-2">
				<h1 class="text-primary text-center">Login</h1>
	
				<form:form action="/login" method="POST"
					modelAttribute="newLogin">
					<div class="d-flex justify-content-between gap-1">
						<form:label path="email">Email</form:label>
						<form:input class="" type="text" path="email" />
					</div>
						<form:errors class="text-danger fw-bold fst-italic" path="email" />
					<div class="d-flex justify-content-between gap-1">
						<form:label path="password">Password</form:label>
						<form:input class="" type="password" path="password" />
					</div>
						<form:errors class="text-danger fw-bold fst-italic" path="password" />
					<div class="text-end my-2">
						<button class="btn btn-success" type="submit">Submit</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>

	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
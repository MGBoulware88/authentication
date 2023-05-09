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
		<h1 class="text-primary">Welcome! <c:out value="${user.userName}" /></h1>
		<p>This is your dashboard. Nothing to see here yet.</p>
		<div class="text-start">
			<a class="btn btn-success" href="/logout">logout</a>		
		</div>
	</div>

	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
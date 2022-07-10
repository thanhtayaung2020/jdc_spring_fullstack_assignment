<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Registration</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"
rel="stylesheet">	
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container mt-4">
		<h1>Using Ioc Containers</h1>
		<h3>Add New Registration for ${openClass.course.name }(${openClass.startDate }) </h3>
		<div class="row">
			<div class="col-4">
				<c:url var="save" value="/registration-edit"></c:url>
				<form action="${save }" method="post">
					<input type="hidden" value="${openClass.id }" name="openClassId">
					<div>
						<label for="student" class="form-label">Student</label>
						<input type="text" class="form-control" placeholder="Enter student name" 
							name="student" required="required"/>
					</div>
					<div>
						<label for="email" class="form-label">Email</label>
						<input type="text" class="form-control" placeholder="Enter email" 
							name="email" required="required"/>
					</div>
					<div>
						<label for="phone" class="form-label">Phone</label>
						<input type="text" class="form-control" placeholder="Enter phone number" 
							name="phone" required="required"/>
					</div>
					
					<input type="submit" class="btn btn-primary mt-2" value="Save"> 
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Course</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container mt-4">
		<h1>Using Ioc Containers</h1>
		<h3>Add New Course</h3>
		<div class="row">
			<div class="col-4">
			<c:url var="save" value="/courses"></c:url>
				<form action="${save }" method="post">
					<div>
						<label for="name" class="form-label">Name</label>
						<input type="text" class="form-control" placeholder="Enter Course Name" 
							name="name"/>
					</div>
					
					<div class="mt-3">
						<label for="duration" class="form-label">Duration</label>
						<input type="number" class="form-control" placeholder="Enter Duration" required="required"
							name="duration"/>
					</div>
					
					<div class="mt-3">
						<label for="fees" class="form-label">Fees</label>
						<input type="number" class="form-control" placeholder="Enter fees" required="required"
							name="fees"/>
					</div>
					
					<div class="my-3">
						<label for="description" class="form-label">Description</label>
						<textarea rows="4" cols="40" class="form-control" name="description"></textarea>
					</div>
					
					<input type="submit" class="btn btn-primary" value="Save Course"> 
					
				</form>
			</div>
		</div>
	</div>
</body>
</html>
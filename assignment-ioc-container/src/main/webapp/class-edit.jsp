<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Class</title>
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
		<h3>Add New Class for ${course.name }</h3>
		<div class="row">
			<div class="col-4">
				<c:url var="save" value="/class-edit"></c:url>
				<form action="${save }" method="post">
					<input type="hidden" value="${course.id }" name="courseId">
					<div>
						<label for="name" class="form-label">Name</label>
						<input type="text" class="form-control" placeholder="Enter teacher name" 
							name="teacher" required="required"/>
					</div>
					<div class="mt-2">
						<label for="name" class="form-label">Start Date</label>
						   <input type="text" value ="" class="form-control" id="datepicker" name="startDate" required="required"/>
					</div>
					<input type="submit" class="btn btn-primary mt-2" value="Save Class"> 
				</form>
			</div>
		</div>
	</div>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
	<script>
		$('#datepicker').datepicker({
		    format: 'dd/mm/yyyy',
		});
	</script>
</body>
</html>

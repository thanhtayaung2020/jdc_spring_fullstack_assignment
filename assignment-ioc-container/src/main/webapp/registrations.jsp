<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registrations</title>
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
		<h3>Registrations for ${openClass.course.name }(${openClass.startDate }) </h3>
		<div>
			<c:url value="/registration-edit" var="addNew">
				<c:param name="openClassId" value="${openClass.id }"></c:param>
			</c:url>
			<a class="btn btn-primary" href="${addNew }">Add New Registration</a>
		</div> 
		<div class="row">
			<div class="col-12">
				
				<c:choose>
					<c:when test="${empty registrations }">
						<div class="mt-3 alert alert-warning">
							There is no registration for ${openClass.course.name }(${openClass.startDate })
						</div>
						
					</c:when>
					<c:otherwise>
							<table class="table table-striped">
								<thead>
									<tr>
										<th>Id</th>
										<th>Teacher</th>
										<th>Start Date</th>
										<th>Student</th>
										<th>Email</th>
										<th>Phone</th>
										
									</tr>
								</thead>
								<tbody>
									<c:forEach var="row" items="${registrations }">
									<tr>
										<td>${row.id }</td>
										<td>${row.openClass.teacher }</td>
										<td>${row.openClass.startDate }</td>
										<td>${row.student }</td>
										<td>${row.email }</td>
										<td>${row.phone }</td>
										
									</td>
									</tr>	
									</c:forEach>
								</tbody>
							</table>
						</c:otherwise>
				</c:choose>
				
			</div>
		</div>
	</div>
</body>
</html>
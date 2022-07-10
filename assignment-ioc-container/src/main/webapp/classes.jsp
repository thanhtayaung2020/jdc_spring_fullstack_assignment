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
		<h3>Classes for ${course.name}</h3>
		<div>
			<c:url value="/class-edit" var="addNew">
				<c:param name="courseId" value="${course.id }"></c:param>
			</c:url>
			<a class="btn btn-primary" href="${addNew }">Add New Class</a>
		</div>
		<div class="row">
			<div class="col-12">
				
				<c:choose>
					<c:when test="${empty classes }">
						<div class="mt-3 alert alert-warning">
							There is no class for ${course.name }. Please create new class.
						</div>
						
					</c:when>
					<c:otherwise>
							<table class="table table-striped">
								<thead>
									<tr>
										<th>Id</th>
										<th>Course</th>
										<th>Teacher</th>
										<th>Start Date</th>
										<th>Fees</th>
										<th>Duration</th>
										<th>Description</th>
										<th></th>
										
									</tr>
								</thead>
								<tbody>
									<c:forEach var="row" items="${classes }">
									<tr>
										<td>${row.id }</td>
										<td>${row.course.name }</td>
										<td>${row.teacher }</td>
										<td>${row.startDate }</td>
										<td>${row.course.fees }</td>
										<td>${row.course.duration }</td>
										<td>${row.course.description}</td>
										<td>
										<c:url value="/registrations" var="registrations">
											<c:param name="openClassId" value="${row.id }"></c:param>
										</c:url>
										<a href="${registrations}">Registrations</a>
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
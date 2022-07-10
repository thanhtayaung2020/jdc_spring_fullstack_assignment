<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Using IOC Container</title>
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
	<div class="container mt-3">
		<h1>Using IOC Container</h1>
		<h5>Courses</h5>
		<a href="course-edit" class="btn btn-primary">Add New Course</a>

		<div class="mt-4">
		
			<c:choose>
				<c:when test="${empty courses }">
					<div class="alert alert-warning">
						There is no course. Please create new course.
					</div>
				</c:when>
				<c:otherwise>
					<table class="table-striped table">
						<thead>
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Fees</th>
								<th>Duration</th>
								<th>Description</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="row" items="${courses }">
								<tr>
									<td>${row.id }</td>
									<td>${row.name }</td>
									<td>${row.fees } </td>
									<td>${row.duration }Months</td>
									<td>${row.description }</td>
									<td>
										<c:url value="/classes" var="openClasses">
											<c:param name="courseId" value="${row.id }"></c:param>
										</c:url>
										<a href="${openClasses }">Open Classes</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
			
		</div>

	</div>
</body>
</html>
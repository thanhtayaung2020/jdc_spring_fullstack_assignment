package com.jdc.assignment.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdc.assignment.domain.Course;
import com.jdc.assignment.domain.OpenClass;
import com.jdc.assignment.model.CourseModel;
import com.jdc.assignment.model.OpenClassModel;

@WebServlet(urlPatterns = { "/classes", "/class-edit" })
public class OpenClassServlet extends AbstractBeanFactoryServlet {

	private static final long serialVersionUID = 2263563162156943944L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		var courseId = req.getParameter("courseId");
		// Find Course
		var courseModel = getBean("courseModel", CourseModel.class);

		var course = courseModel.findById(Integer.parseInt(courseId));

		req.setAttribute("course", course);

		System.out.println(req.getServletContext());

		var page = switch (req.getServletPath()) {
		case "/classes" -> {
			var model = getBean("openClassModel", OpenClassModel.class);
			req.setAttribute("classes", model.findByCouse(Integer.parseInt(courseId)));
			yield "classes";
		}
		default -> "class-edit";

		};

		getServletContext().getRequestDispatcher("/%s.jsp".formatted(page)).forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		var courseId = req.getParameter("courseId");

		var startDate = req.getParameter("startDate");

		var teacher = req.getParameter("teacher");

		OpenClass openClass = new OpenClass();

		if (courseId != null) {
			Course course = new Course();
			course.setId(Integer.valueOf(courseId));
			openClass.setCourse(course);
		}

		openClass.setTeacher(teacher);

		if (startDate != null) {

			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
			LocalDate localDate = LocalDate.parse(startDate, dtf);
			openClass.setStartDate(localDate);

		}

		// save to database
		var model = getBean("openClassModel", OpenClassModel.class);

		model.create(openClass);

		// redirect to top page
		resp.sendRedirect("/classes?courseId=" + courseId);

	}

}

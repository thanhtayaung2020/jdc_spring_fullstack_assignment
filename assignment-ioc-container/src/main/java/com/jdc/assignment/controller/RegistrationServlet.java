package com.jdc.assignment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdc.assignment.domain.OpenClass;
import com.jdc.assignment.domain.Registration;
import com.jdc.assignment.model.OpenClassModel;
import com.jdc.assignment.model.RegistrationModel;

@WebServlet(urlPatterns = { "/registrations", "/registration-edit" })
public class RegistrationServlet extends AbstractBeanFactoryServlet {

	private static final long serialVersionUID = -8260033787242605803L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		var openClassId = req.getParameter("openClassId");

		var openClassModel = getBean("openClassModel", OpenClassModel.class);

		req.setAttribute("openClass", openClassModel.findById(Integer.valueOf(openClassId)));

		var page = switch (req.getServletPath()) {
		case "/registrations" -> {
			var model = getBean("registrationModel", RegistrationModel.class);
			req.setAttribute("registrations", model.getRegistrationListByClassId(Integer.valueOf(openClassId)));
			yield "registrations";
		}
		default -> "registration-edit";

		};

		getServletContext().getRequestDispatcher("/%s.jsp".formatted(page)).forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		var openClassId = req.getParameter("openClassId");
		var student = req.getParameter("student");
		var email = req.getParameter("email");
		var phone = req.getParameter("phone");

		Registration registration = new Registration();

		OpenClass openClass = new OpenClass();
		openClass.setId(Integer.valueOf(openClassId));
		registration.setOpenClass(openClass);
		registration.setStudent(student);
		registration.setEmail(email);
		registration.setPhone(phone);

		var registrationModel = getBean("registrationModel", RegistrationModel.class);

		registrationModel.save(registration);

		// redirect to top page
		resp.sendRedirect("/registrations?openClassId=" + openClassId);

	}

}

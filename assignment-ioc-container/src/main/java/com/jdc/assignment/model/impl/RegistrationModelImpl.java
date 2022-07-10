package com.jdc.assignment.model.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.jdc.assignment.domain.OpenClass;
import com.jdc.assignment.domain.Registration;
import com.jdc.assignment.model.RegistrationModel;

public class RegistrationModelImpl implements RegistrationModel {

	private static final String GET_Registration_By_Class_Id = """
			SELECT r.id AS id,r.student,r.phone,r.email,oc.teacher,oc.start_date
			FROM registration r
			INNER JOIN open_class oc ON oc.Id = r.open_class
			where oc.id = ?
			""";

	private static final String INSERT = " insert into registration(open_class,student,phone,email) values (?,?,?,?) ";

	private DataSource dataSource;

	public RegistrationModelImpl(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}

	@Override
	public List<Registration> getRegistrationListByClassId(int openClassId) {

		List<Registration> registrations = new ArrayList<Registration>();

		try (var conn = dataSource.getConnection(); var stmt = conn.prepareStatement(GET_Registration_By_Class_Id)) {

			stmt.setInt(1, openClassId);

			var rs = stmt.executeQuery();

			while (rs.next()) {

				Registration registration = new Registration();
				registration.setId(rs.getInt("id"));

				registration.setStudent(rs.getString("student"));
				registration.setEmail(rs.getString("email"));
				registration.setPhone(rs.getString("phone"));

				var oc = new OpenClass();
				oc.setTeacher(rs.getString("teacher"));
				oc.setStartDate(rs.getDate("start_date").toLocalDate());

				registration.setOpenClass(oc);

				registrations.add(registration);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return registrations;
	}

	@Override
	public void save(Registration registration) {

		try (var conn = dataSource.getConnection(); var stmt = conn.prepareStatement(INSERT)) {
			stmt.setInt(1, registration.getOpenClass().getId());
			stmt.setString(2, registration.getStudent());
			stmt.setString(3, registration.getPhone());
			stmt.setString(4, registration.getEmail());

			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

package com.jdc.assignment.model.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.jdc.assignment.domain.Course;
import com.jdc.assignment.domain.OpenClass;
import com.jdc.assignment.model.OpenClassModel;

public class OpenClassModelImpl implements OpenClassModel {

	private static final String SELECT_SQL = """
			select oc.id, oc.start_date,
			oc.teacher,c.id courseId, c.name,
			c.fees, c.duration,c.description
			from open_class oc
			join course c on oc.course_id = c.id
			where c.id = ?
			""";

	private static final String FIND_BY_ID = """
			select oc.id, oc.start_date,
			oc.teacher,c.id courseId, c.name,
			c.fees, c.duration,c.description
			from open_class oc
			join course c on oc.course_id = c.id
			where oc.id = ?
			""";

	private static final String INSERT = " insert into open_class(course_id,start_date,teacher) values (?,?,?) ";

	private DataSource dataSource;

	public OpenClassModelImpl(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}

	@Override
	public List<OpenClass> findByCouse(int courseId) {

		List<OpenClass> list = new ArrayList<OpenClass>();

		try (var conn = dataSource.getConnection(); var stmt = conn.prepareStatement(SELECT_SQL)) {

			stmt.setInt(1, courseId);

			var rs = stmt.executeQuery();

			while (rs.next()) {
				var c = new Course();
				c.setId(rs.getInt("courseId"));
				c.setName(rs.getString("name"));
				c.setDescription(rs.getString("description"));
				c.setFees(rs.getInt("fees"));

				var oc = new OpenClass();

				oc.setCourse(c);
				oc.setId(rs.getInt("id"));
				oc.setTeacher("teacher");
				oc.setStartDate(rs.getDate("start_date").toLocalDate());

				list.add(oc);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public void create(OpenClass openClass) {

		try (var conn = dataSource.getConnection(); var stmt = conn.prepareStatement(INSERT)) {
			stmt.setInt(1, openClass.getCourse().getId());
			stmt.setDate(2, Date.valueOf(openClass.getStartDate()));
			stmt.setString(3, openClass.getTeacher());

			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public OpenClass findById(int id) {

		try (var conn = dataSource.getConnection(); var stmt = conn.prepareStatement(FIND_BY_ID)) {

			stmt.setInt(1, id);

			var rs = stmt.executeQuery();

			while (rs.next()) {
				var c = new Course();
				c.setId(rs.getInt("courseId"));
				c.setName(rs.getString("name"));
				c.setDescription(rs.getString("description"));
				c.setFees(rs.getInt("fees"));

				var oc = new OpenClass();

				oc.setCourse(c);
				oc.setId(rs.getInt("id"));
				oc.setTeacher("teacher");
				oc.setStartDate(rs.getDate("start_date").toLocalDate());

				return oc;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return new OpenClass();

	}

}

package com.jdc.assignment.model;

import java.util.List;

import com.jdc.assignment.domain.OpenClass;

public interface OpenClassModel {

	List<OpenClass> findByCouse(int courseId);

	void create(OpenClass openClass);

	OpenClass findById(int id);

}

package com.jdc.assignment.model;

import java.util.List;

import com.jdc.assignment.domain.Registration;

public interface RegistrationModel {

	List<Registration> getRegistrationListByClassId(int openClassId);

	void save(Registration registration);

}

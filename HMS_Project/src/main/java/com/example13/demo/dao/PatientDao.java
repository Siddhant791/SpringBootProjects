package com.example13.demo.dao;

import org.springframework.data.repository.CrudRepository;

import com.example13.demo.pojos.Patient;

public interface PatientDao extends CrudRepository<Patient,Integer> {
	
}

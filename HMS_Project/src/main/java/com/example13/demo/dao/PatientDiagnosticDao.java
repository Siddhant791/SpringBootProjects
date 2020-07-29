package com.example13.demo.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.example13.demo.pojos.PatientDiagnostics;

public interface PatientDiagnosticDao extends CrudRepository<PatientDiagnostics, Integer>{

	@Query(value = "SELECT *FROM patient_diagnostics WHERE pat_id=?1",nativeQuery = true)
	List<PatientDiagnostics> findBypatId(int patientId);
	
}

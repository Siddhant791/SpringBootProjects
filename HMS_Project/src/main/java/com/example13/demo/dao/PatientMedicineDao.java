package com.example13.demo.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.example13.demo.pojos.PatientMedicines;

public interface PatientMedicineDao  extends CrudRepository<PatientMedicines, Integer>{

	@Query(value = "SELECT *FROM patient_medicines WHERE pat_id=?1",nativeQuery = true)
	List<PatientMedicines> findBypatId(int patientId);
	
}

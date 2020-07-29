package com.example13.demo.dao;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.example13.demo.pojos.DiagnosticsMaster;
import com.example13.demo.pojos.Medicines;

public interface DiagnosticDao extends CrudRepository<DiagnosticsMaster,Integer>{

	

	@Query(value = "SELECT *FROM diagnostics_master WHERE test_name=?1",nativeQuery = true)
	DiagnosticsMaster findByMedicineName(String testName);
}

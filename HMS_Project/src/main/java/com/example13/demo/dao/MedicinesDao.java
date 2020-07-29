
package com.example13.demo.dao;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.example13.demo.pojos.Medicines;
import com.example13.demo.pojos.Patient;

public interface MedicinesDao extends CrudRepository<Medicines,Integer>{
	
	
	
	Medicines findBymedicineId(int id);

	@Query(value = "SELECT *FROM medicines WHERE medicine_name=?1",nativeQuery = true)
	Medicines findByMedicineName(String medicineName);
	
	//Medicines findByMedicineName(String medicineName);
	
	//Patient findByPatientId(int id);
	
	
}


//package com.example13.demo.dao;
//import java.util.List;
//
//import org.springframework.data.repository.CrudRepository;
//
//import com.example13.demo.pojos.Medicines;
//import com.example13.demo.pojos.Patient;
//
//public interface MedicinesDao extends CrudRepository<Medicines,Integer>{
//	
//
//	Medicines findBymedicineId(int id);
//	
//	List<Medicines> findByMedicineName(String medicineName);
//	
//	Patient findByPatientId(int id);
//	
//	
//}
//


package com.example13.demo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example13.demo.pojos.Medicines;
import com.example13.demo.pojos.PatientMedicines;
import com.example13.demo.dao.MedicinesDao;
import com.example13.demo.dao.PatientDao;

@Service
public class MedicinesService {
	@Autowired
	PatientDao dao;
	@Autowired
	MedicinesDao dao2;
	
	
	
	public void insertData(Medicines obj)
	{
		dao2.save(obj);
	}
	
	public Medicines findbyId(int id)
	{
		Medicines dataById=dao2.findById(id).orElse(null);
        return dataById;
	}
	
	
	/*
	 * public Patient findByPatientId(int id) { Patient
	 * dataById=dao2.findByPatientId(id); return dataById;
	 * 
	 * 
	 * }
	 */
	
	public Medicines findByMedicineName(String medicineName)
	{
		return dao2.findByMedicineName(medicineName);
	}
	
	
	

}

//package com.example13.demo.service;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.example13.demo.pojos.Medicines;
//import com.example13.demo.pojos.Patient;
//import com.example13.demo.dao.MedicinesDao;
//import com.example13.demo.dao.PatientDao;
//
//@Service
//public class MedicinesService {
//	@Autowired
//	PatientDao dao;
//	@Autowired
//	MedicinesDao dao2;
//	
//	public Medicines findbyId(int id)
//	{
//		Medicines dataById=dao2.findById(id).orElse(null);
//        return dataById;
//	}
//	
//	
//	  public Patient findByPatientId(int id) {
//		  Patient dataById=dao2.findByPatientId(id);
//		  return dataById;
//		  
//	  
//	  }
//	 
//	
//	
//	
//
//}

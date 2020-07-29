package com.example13.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example13.demo.dao.PatientMedicineDao;
import com.example13.demo.pojos.PatientMedicines;

@Service
public class PatientMedicineService {
	
	@Autowired
	private PatientMedicineDao dao;
	
	public void insertData(PatientMedicines obj)
	{
		dao.save(obj);
	}

	
	public List<PatientMedicines> findBypatId(int patientId)
	{
		return dao.findBypatId(patientId);
	}
	
	public void deleteByID(int Id) {
		dao.deleteById(Id);
	}
}

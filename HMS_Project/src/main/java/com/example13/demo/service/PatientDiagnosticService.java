package com.example13.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example13.demo.dao.PatientDiagnosticDao;
import com.example13.demo.pojos.PatientDiagnostics;

@Service
public class PatientDiagnosticService {
	
	@Autowired
	private PatientDiagnosticDao dao;
	
	public void insertData(PatientDiagnostics obj)
	{
		dao.save(obj);
	}

	
	public List<PatientDiagnostics> findBypatId(int patientId)
	{
		return dao.findBypatId(patientId);
	}
	
	public void deleteByID(int Id) {
		dao.deleteById(Id);
	}

}

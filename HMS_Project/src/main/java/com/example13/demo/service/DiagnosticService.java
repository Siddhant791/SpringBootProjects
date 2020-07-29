package com.example13.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example13.demo.dao.DiagnosticDao;
import com.example13.demo.pojos.DiagnosticsMaster;
import com.example13.demo.pojos.PatientMedicines;

@Service
public class DiagnosticService {

	@Autowired
	private DiagnosticDao dao;
	
	public void insertData(DiagnosticsMaster obj)
	{
		dao.save(obj);
	}
	
	
	
	
	public DiagnosticsMaster findbyId(int id)
	{
		DiagnosticsMaster dataById=dao.findById(id).orElse(null);
        return dataById;
	}
	
	
	public DiagnosticsMaster findByMedicineName(String testName)
	{
		return dao.findByMedicineName(testName);
	}
	
	
	public List<DiagnosticsMaster> getAllDiagnosticMaster()
	{
		List<DiagnosticsMaster> list=(List<DiagnosticsMaster>) dao.findAll();
		return list;
	}
	
}

package com.example13.demo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example13.demo.dao.PatientDao;
import com.example13.demo.pojos.Patient;

@Service
public class PatientService {
	
	@Autowired
	private PatientDao dao;
	
	public void insertData(Patient obj)
	{
		dao.save(obj);
	}
	
	
	  public Patient findbyId(int id) 
	  { 
		  Patient dataById=dao.findById(id).orElse(null);
		  return dataById; 
	  }
	 
	
	public void deleteById(int id) 
	{
        dao.deleteById(id);
	}
	
	public List<Patient> patientList()
	{
		var it = dao.findAll();

        var patients = new ArrayList<Patient>();
        it.forEach(e -> patients.add(e));

        return patients;
	}
	
	
}

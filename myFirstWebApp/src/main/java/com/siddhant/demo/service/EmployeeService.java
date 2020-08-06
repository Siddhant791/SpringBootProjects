package com.siddhant.demo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.siddhant.demo.dao.EmployeeDao;
import com.siddhant.demo.pojos.Employee;

//@Component("Emp")
@Service
public class EmployeeService {

	@Autowired
	private EmployeeDao d;
	
	public void insertData(Employee employee) {
		d.save(employee);
	}
	public void deleteAll() {
		d.deleteAll();
	}
	public List<Employee> nameSearch(String name){
		List<Employee> list= new ArrayList<>();
		list=d.findByName(name);
		return list;
	}
	public List<Employee> findByStartingWithGivenName(String name){
		List<Employee> list= new ArrayList<>();
		list=d.findByStartingWith(name);
		return list;
	}
}

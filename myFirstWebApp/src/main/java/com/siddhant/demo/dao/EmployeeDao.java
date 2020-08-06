package com.siddhant.demo.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Component;

import com.siddhant.demo.pojos.Employee;

//@Component
public interface EmployeeDao extends CrudRepository<Employee,Integer> {
	
	@Query(value = "Select * from employee where name like ?%",nativeQuery=true)
	List<Employee> findByStartingWith(String name);
	
	//@Query(value = "SELECT * FROM employee WHERE name=?1",nativeQuery=true)
	List<Employee> findByName(String name);
}

package com.example8.demo.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example8.demo.Dao.CustomerDao;
import com.example8.demo.pojos.Customer;
import java.util.*;
//import antlr.collections.List;

@Service
public class ServiceClass {
	
	@Autowired
	private CustomerDao dao;
	
	
	public void insertData(Customer obj)
	{
		dao.save(obj);
	}
	
	public List<Customer> customerList()
	{
		var it = dao.findAll();

        var customers = new ArrayList<Customer>();
        it.forEach(e -> customers.add(e));

        return customers;
	}

	public Customer findByID(int id)
	{
		
		Customer dataById=dao.findById(id).orElse(null);
        return dataById;
	}

	public void deleteByID(int id) 
	{
        dao.deleteById(id);
	}
	
	public Customer findByCustomerID(int id)
	{	
        return dao.findByCustomerId(id);
	}
	
}

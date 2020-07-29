package com.tcs.ascend.CustomerManagement_CT20192673351;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerService {
	@Autowired
	private CustomerRepo dao;
	
	
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

package com.example8.demo.Dao;

import org.springframework.data.repository.CrudRepository;

import com.example8.demo.pojos.Customer;


public interface CustomerDao extends CrudRepository<Customer, Integer> {
	Customer findByCustomerId(int id);
}

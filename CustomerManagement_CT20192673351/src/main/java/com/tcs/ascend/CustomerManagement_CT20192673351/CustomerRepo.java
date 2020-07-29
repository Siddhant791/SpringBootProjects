package com.tcs.ascend.CustomerManagement_CT20192673351;

import org.springframework.data.repository.CrudRepository;


public interface CustomerRepo extends CrudRepository<Customer, Integer> {
	Customer findByCustomerId(int id);
}

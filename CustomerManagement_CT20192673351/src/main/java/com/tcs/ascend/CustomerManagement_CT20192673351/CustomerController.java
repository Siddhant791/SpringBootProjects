package com.tcs.ascend.CustomerManagement_CT20192673351;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CustomerController {
	
	@Autowired
	private CustomerService s;
	
	@CrossOrigin
	@ResponseBody
	@PostMapping("/893registerCustomer")
	public String registerCustomer(@RequestBody Customer customerStatus) {
		s.insertData(customerStatus);
		return "Customer with ssnid: "+customerStatus.getSsnId()+" is registered successfully";
	}
	@CrossOrigin
	@ResponseBody
	@RequestMapping("/893viewAllCustomers")
	public List<Customer> viewAllCustomer(Customer customerStatus) {
		List<Customer> mylist=s.customerList();
		return mylist;
	}

}

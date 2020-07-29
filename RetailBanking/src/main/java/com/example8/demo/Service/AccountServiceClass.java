package com.example8.demo.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example8.demo.Dao.AccountDao;
import com.example8.demo.pojos.Account;
import com.example8.demo.pojos.Customer;


@Service
public class AccountServiceClass {

	@Autowired
	private AccountDao dao;
	
	public void insertData(Account obj)
	{
		dao.save(obj);
	}
	public Account findByCustomerID(int id)
	{	
        return dao.findByCustomerId(id);
	}
	public Account findByAccountID(int id)
	{	
        return dao.findByAccountId(id);
	}
}

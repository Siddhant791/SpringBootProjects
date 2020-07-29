package com.example8.demo.Dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.example8.demo.pojos.Account;
import com.example8.demo.pojos.Customer;

public interface AccountDao extends CrudRepository<Account, Integer> {
	Account findByCustomerId(int id);
	Account findByAccountId(int id);
}

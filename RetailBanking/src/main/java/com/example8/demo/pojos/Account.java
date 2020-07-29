package com.example8.demo.pojos;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Account {
	
	@Id
	private int customerId;
	private int accountId;
	private String accountType;
	private int balance;
	private static int accountCount=200000000;
	
	public Account() {
		super();
		this.accountId = accountCount++;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getAccountType() {
		return accountType;
	}
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int depositAmount) {
		this.balance = depositAmount;
	}
	public int getAccountId() {
		return accountId;
	}
	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}
	
	@Override
	public String toString() {
		return "Account [customerId=" + customerId + ", accountId=" + accountId + ", accountType=" + accountType
				+ ", depositAmount=" + balance + "]";
	}

}

package com.example8.demo.pojos;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Customer {
	
	@Id
	private int customerSSN;
	private static int count=100000000;
	private int customerId;
	private String name;
	private String address;
	private int age;
	private String state;
	private String city;
	/*
	 * private String city; private String state;
	 */	
	
	
	
	public int getCustomerSSN() {
		return customerSSN;
	}
	public Customer() {
		super();
		this.customerId=count++;
		
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public void setCustomerSSN(int customerSSN) {
		this.customerSSN = customerSSN;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	@Override
	public String toString() {
		return "CustomerStatus [customerSSN=" + customerSSN + ", customerId=" + customerId + ", name=" + name
				+ ", address=" + address + ", age=" + age + ", state=" + state + ", city=" + city + "]";
	}
	
	
	
	
	
	/*
	 * public String getCity() { return city; } public void setCity(String city) {
	 * this.city = city; } public String getState() { return state; } public void
	 * setState(String state) { this.state = state; }
	 */

}

package com.example13.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example13.demo.pojos.LoginUser;

public interface LoginRepository extends JpaRepository<LoginUser, Long> {

	public LoginUser findByUsername(String username);

}
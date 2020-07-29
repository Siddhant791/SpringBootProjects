package com.example13.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example13.demo.dao.LoginRepository;
import com.example13.demo.pojos.LoginUser;

@Service
public class LoginService implements UserDetailsService {

	@Autowired
	private LoginRepository repo;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		
		LoginUser user=repo.findByUsername(username);
		if(user==null)
		{
			throw new UsernameNotFoundException("User 404");
		}
		
		return new LoginUserPrincipal(user);
	}

}
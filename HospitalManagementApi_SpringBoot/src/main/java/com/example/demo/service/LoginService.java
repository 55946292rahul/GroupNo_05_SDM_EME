package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.Login;
import com.example.demo.repository.LoginRepository;

@Service
public class LoginService {

	
	@Autowired
	LoginRepository loginrepo;
	
	
	public List<Login> getAllLogins(){
		return loginrepo.findAll();
	}
}

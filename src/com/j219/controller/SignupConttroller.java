package com.j219.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.j219.dao.SignupDao;

@Controller
public class SignupConttroller {
	
	@Autowired
	private SignupDao signupDao;
	
	@RequestMapping("/signup")
	public String signup(String account,String username,String password){
		
		return null;
	}
}

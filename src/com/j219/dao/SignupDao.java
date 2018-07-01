package com.j219.dao;

import com.j219.model.Signup;

public interface SignupDao {

	public Signup hasAccount(String account);
	public Signup hasUsername(String username);
		
}

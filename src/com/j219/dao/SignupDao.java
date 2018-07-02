package com.j219.dao;

import org.apache.ibatis.annotations.Param;

import com.j219.model.Signup;

public interface SignupDao {

	public Signup hasAccount(String account);
	public Signup hasUsername(String username);
	public int newSignup(@Param("username") String username,@Param("account")String account,@Param("password")String password);
		
}

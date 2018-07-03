package com.j219.dao;

import org.apache.ibatis.annotations.Param;

import com.j219.model.Login;

public interface LoginDao {
	
	public Login getUsernameByAccountAndpassword(@Param("account") String account,@Param("password") String password);
	
}

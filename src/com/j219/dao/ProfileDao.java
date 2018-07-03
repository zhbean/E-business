package com.j219.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.j219.model.Profile;

public interface ProfileDao {

	public List<Profile> findProfile(String account);
	
	public void setProfile(@Param("username") String myusernmame,@Param("sex") String sex,@Param("account") String account);
}

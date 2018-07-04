package com.j219.dao;

import java.util.List;

import com.j219.model.Myorders;

public interface MyordersDao {

	public List<Myorders> findMyorders(String account);
	
	public void delMyorder(String order_no);

}

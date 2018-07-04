package com.j219.dao;

import java.util.List;

import com.j219.model.MyorderDetails;

public interface MyorderDetailsDao {
	
	public List<MyorderDetails> findMyorderdetails(String order_no);
}

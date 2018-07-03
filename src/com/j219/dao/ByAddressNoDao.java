package com.j219.dao;

import java.util.List;

import com.j219.model.MyAddress;

public interface ByAddressNoDao {
	
	public List<MyAddress> findMyAddressByNo(String address_no);

}

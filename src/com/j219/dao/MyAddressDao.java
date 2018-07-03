package com.j219.dao;

import java.util.List;

import com.j219.model.MyAddress;

public interface MyAddressDao {

	public List<MyAddress> findMyAddress(String account);
}

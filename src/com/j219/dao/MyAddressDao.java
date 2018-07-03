package com.j219.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.j219.model.MyAddress;

public interface MyAddressDao {

	public List<MyAddress> findMyAddress(String account);
	
	public int updateAddress(@Param("address_no") String address_no,@Param("address_detail") String address_detail,@Param("area") String area,@Param("buyer_name") String buyer_name,@Param("phone_number") String phone_number);
}

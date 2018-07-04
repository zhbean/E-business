package com.j219.dao;

import org.apache.ibatis.annotations.Param;

public interface MaintainOrdersMapper {
	public void changeStatus(@Param("order_no") String order_no,@Param("order_status") Integer order_status);
}

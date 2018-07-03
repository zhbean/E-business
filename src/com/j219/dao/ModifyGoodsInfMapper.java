package com.j219.dao;

import org.apache.ibatis.annotations.Param;

public interface ModifyGoodsInfMapper {
	public void modifyGoodsInf(@Param("spec_no") String spec_no,@Param("price") Float price,@Param("sku") Integer sku);
}

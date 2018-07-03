package com.j219.dao;

import org.apache.ibatis.annotations.Param;

public interface DeleteGoodsBySpeconMapper {
	public void deleteGoodsG(@Param("goods_no") String goods_no);
	public void deleteGoodsS(@Param("spec_no") String spec_no);
	public void deleteGoodsGd(@Param("spec_no") String spec_no);
}

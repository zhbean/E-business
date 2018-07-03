package com.j219.dao;

import org.apache.ibatis.annotations.Param;

public interface AddNewGoodsMapper {
//	public void addNewGoods(@Param("goods_no") String goods_no,@Param("goods_name") String goods_name,@Param("goods_discount") Float goods_discount,@Param("goods_status") Integer goods_status
//			,@Param("sort_no") String sort_no,@Param("brand_no") String brand_no,@Param("spec_no") String spec_no,@Param("spec_type") String spec_type
//			,@Param("price") Float price,@Param("sku") Integer sku);
	
	public void addNewGoodsTableGoods(@Param("goods_no") String goods_no,@Param("goods_name") String goods_name,@Param("goods_discount") Float goods_discount,@Param("goods_status") Integer goods_status
			,@Param("sort_no") String sort_no,@Param("brand_no") String brand_no) ;
	public void addNewGoodsTableSpec(@Param("spec_no") String spec_no,@Param("spec_type") String spec_type,@Param("goods_no") String goods_no);
	public void addNewGoodsTableGoodsDetails(@Param("spec_no") String spec_no,@Param("price") Float price,@Param("sku") Integer sku);
}

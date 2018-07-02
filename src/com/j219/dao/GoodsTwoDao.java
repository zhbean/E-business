package com.j219.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.j219.model.GoodsTwo;

public interface GoodsTwoDao {
	public List<GoodsTwo> getGoodsname(@Param("goodsname") String goodsname);
}

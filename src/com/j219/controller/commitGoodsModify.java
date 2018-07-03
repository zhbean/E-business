package com.j219.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.j219.dao.AddNewGoodsMapper;
import com.j219.dao.ModifyGoodsInfMapper;

@Controller
public class commitGoodsModify {

	@Autowired
	private ModifyGoodsInfMapper modifyGoodsInfMapper;
	@Autowired
	private AddNewGoodsMapper addNewGoodsMapper;
	
	@RequestMapping("/ModifyGoodsSpec")
	public void ModifyGoodsSpec(HttpServletRequest req,HttpServletResponse res,String spec_no,Float price,Integer sku){
		System.out.println("调用ModifyGoodsSpec");
		PrintWriter out;
		try {
			modifyGoodsInfMapper.modifyGoodsInf(spec_no,price,sku);
			System.out.println("修改执行完毕");
			res.setContentType("text/json;charset=UTF-8");
			out = res.getWriter();
			out.write(JSON.toJSONString(1));
			System.out.print(JSON.toJSONString(1));
			out.flush();
			out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("修改值不被允许");
		}
	}
	
	@RequestMapping("/AddNewGoods")
	public void AddNewGoods(HttpServletRequest req,HttpServletResponse res,String goods_no,String goods_name,Float goods_discount,Integer
			goods_status,String sort_no,String brand_no,String spec_no,String spec_type,Float price,Integer sku){
		System.out.println("调用AddNewGoods");
		System.out.println(goods_no);
		PrintWriter out;
		try {
			addNewGoodsMapper.addNewGoodsTableGoods(goods_no, goods_name, goods_discount, goods_status, sort_no, brand_no);
			addNewGoodsMapper.addNewGoodsTableSpec(spec_no, spec_type, goods_no);
			addNewGoodsMapper.addNewGoodsTableGoodsDetails(spec_no, price, sku);
			System.out.println("添加商品执行完成");
			res.setContentType("text/json;charset=UTF-8");
			out = res.getWriter();
			out.write(JSON.toJSONString(1));
			System.out.print(JSON.toJSONString(1));
			out.flush();
			out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("添加商品失败");
		}
	}
}

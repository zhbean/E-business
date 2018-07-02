package com.j219.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.j219.dao.ModifyGoodsInfMapper;

@Controller
public class commitGoodsModify {

	@Autowired
	private ModifyGoodsInfMapper modifyGoodsInfMapper;
	
	@RequestMapping("/ModifyGoodsSpec")
	public void test(HttpServletRequest req,HttpServletResponse res,String spec_no,Float price,Integer sku){
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
}

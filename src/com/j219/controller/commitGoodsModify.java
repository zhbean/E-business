package com.j219.controller;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.j219.dao.ModifyGoodsInfMapper;

@Controller
public class commitGoodsModify {

	@Autowired
	private ModifyGoodsInfMapper modifyGoodsInfMapper;
	
	@RequestMapping("/ModifyGoodsSpec")
	public void test(HttpServletRequest req,HttpServletResponse res,String spec_no,Float price,Integer sku){
		System.out.println("调用ModifyGoodsSpec");
		if(sku > 0) {
			modifyGoodsInfMapper.modifyGoodsInf(spec_no,price,sku);
			System.out.println("修改执行完毕");
		}
		else {
			System.out.println("修改值不被允许");
		}
	}
}

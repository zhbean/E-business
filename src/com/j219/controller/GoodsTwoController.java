package com.j219.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.j219.dao.GoodsTwoDao;
import com.j219.model.GoodsTwo;

@Controller
public class GoodsTwoController {

	@Autowired
	private GoodsTwoDao goodsTwoDao;
	
	@RequestMapping("/goods")
	public void goodslistJson(HttpServletRequest req,HttpServletResponse res,String goodsname) throws IOException{

		System.out.print(goodsname);
		System.out.println("����controller");
		List<GoodsTwo> goodslist = new ArrayList<GoodsTwo>();
		goodslist = goodsTwoDao.getGoodsname(goodsname);
		
		PrintWriter out;
		try {
			res.setContentType("text/json;charset=UTF-8");
			out = res.getWriter();
			//ajax���յ���Ʒ����
			out.write(JSON.toJSONString(goodslist));
			System.out.print(JSON.toJSONString(goodslist));
			System.out.print("JSON�����");
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

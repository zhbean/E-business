package com.j219.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.j219.dao.MyordersDao;
import com.j219.model.MyorderDetails;
import com.j219.model.Myorders;
import com.j219.dao.MyorderDetailsDao;


@Controller
public class MyordersController {

	@Autowired
	private MyordersDao myordersDao;
	@Autowired
	private MyorderDetailsDao myorderdetailsDao;

	@RequestMapping(value = "/myorders",produces="text/html;charset=UTF-8")
	public void myorder(String account, HttpServletRequest request, HttpServletResponse response) throws IOException {
//		request.setCharacterEncoding("UTF-8");
//		response.setHeader("Content-Type", "text/html;charset=UTF-8");

		System.out.println(account);

		try {
			response.setContentType("text/json;charset=UTF-8");
			PrintWriter out = response.getWriter();
			List<Myorders> myorders = myordersDao.findMyorders(account);
				
			System.out.println(JSON.toJSONString(myorders));
			out.print(JSON.toJSONString(myorders));
			out.flush();
			out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/myorderdetails")
	public void myorderdetail(String order_no, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		response.setContentType("text/json;charset=UTF-8");

		System.out.println(order_no);

		try {
			PrintWriter out = response.getWriter();
			request.setCharacterEncoding("UTF-8");
			List<MyorderDetails> myorders = myorderdetailsDao.findMyorderdetails(order_no);
			System.out.println(JSON.toJSONString(myorders));
			out.print(JSON.toJSONString(myorders));
			out.flush();
			out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

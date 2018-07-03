package com.j219.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.j219.dao.ByAddressNoDao;
import com.j219.dao.MyAddressDao;
import com.j219.model.MyAddress;

@Controller
public class MyAddressController {

	
	@Autowired
	public MyAddressDao myAddressDao;
	
	@Autowired
	public ByAddressNoDao ByAddressNoDao;
	
	
	@RequestMapping(value="/myaddress")
	public void myaddress(String account, HttpServletRequest request, HttpServletResponse response) throws IOException {

		System.out.println(account);

		try {
			response.setContentType("text/json;charset=UTF-8");
			PrintWriter out = response.getWriter();
			List<MyAddress> myaddress = myAddressDao.findMyAddress(account);
				
			System.out.println(JSON.toJSONString(myaddress));
			out.print(JSON.toJSONString(myaddress));
			out.flush();
			out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/byaddressno")
	public void addressno(String address_no, HttpServletRequest request, HttpServletResponse response) throws IOException {

		System.out.println(address_no);

		try {
			response.setContentType("text/json;charset=UTF-8");
			PrintWriter out = response.getWriter();
			List<MyAddress> byaddressno = ByAddressNoDao.findMyAddressByNo(address_no);
				
			System.out.println(JSON.toJSONString(byaddressno));
			out.print(JSON.toJSONString(byaddressno));
			out.flush();
			out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/updateaddress")
	public ModelAndView updateaddress(String address_no,String address_detail,String area, String buyer_name,String phone_number, HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println(address_no);
		System.out.println(address_detail);
		System.out.println(area);
		System.out.println(buyer_name);
		System.out.println(phone_number);
		try {
			myAddressDao.updateAddress(address_no,address_detail,area,buyer_name, phone_number);
			System.out.println("修改成功");
			ModelAndView mv = new ModelAndView();
			mv.setViewName("myaddress");
			mv.addObject("upsuccess",true);

			return mv;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new ModelAndView("redirect:/jsp/myaddress.jsp");
		}
	}
	
	
	@RequestMapping(value="/addaddress")
	public ModelAndView addaddress(String account,String address_detail,String area, String buyer_name,String phone_number, HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("账号"+account);
		System.out.println(address_detail);
		System.out.println(area);
		System.out.println(buyer_name);
		System.out.println(phone_number);
		try {
			myAddressDao.addAddress(account,address_detail,area,buyer_name, phone_number);
			System.out.println("创建成功");
			return new ModelAndView("redirect:/jsp/myaddress.jsp");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new ModelAndView("redirect:/jsp/myaddress.jsp");
		}
	}
}

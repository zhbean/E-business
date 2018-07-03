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
import com.j219.dao.ByAddressNoDao;
import com.j219.dao.MyAddressDao;
import com.j219.model.MyAddress;
import com.j219.model.Myorders;

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
}

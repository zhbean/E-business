package com.j219.controller;

import java.io.PrintWriter;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.j219.dao.*;
import com.j219.model.GoodsDetail;
import com.j219.model.OrdersDetail;
import com.j219.model.User;

@Controller
public class FindListController {

	@Autowired
	private FindGoodsListMapper findGoodsListMapper;
	@Autowired
	private FindUserListMapper findUserListMapper;
	@Autowired
	private FindOrdersListMapper findOrdersListMapper;

	@RequestMapping("/goodslist")
	public ModelAndView goodslist() {
		System.out.println("����controllerForGoodsList");
		List<GoodsDetail> goodslist = new ArrayList<GoodsDetail>();
		goodslist = findGoodsListMapper.getGoodsList();// ���������Ʒ�б�
		ModelAndView mv = new ModelAndView();
		mv.setViewName("GoodslistTest");
		mv.addObject("goodslist", goodslist);
		return mv;
	}

	@RequestMapping("/JSONGoodsList")
	public void goodslistJson(HttpServletRequest req,HttpServletResponse res) {
		System.out.println("����controllerForGoodsListForJSON");
		List<GoodsDetail> goodslist = new ArrayList<GoodsDetail>();
		goodslist = findGoodsListMapper.getGoodsList();// ���������Ʒ�б�
		// ��ajax��������
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
	
	@RequestMapping("/JSONUserList")
	public void userslistJson(HttpServletRequest req,HttpServletResponse res) {
		System.out.println("����controllerForUsersListForJSON");
		List<User> userslist = new ArrayList<User>();
		userslist = findUserListMapper.getUsersList();  //��������û��б�
		// ��ajax��������
		PrintWriter out;
		try {
			res.setContentType("text/json;charset=UTF-8");
			out = res.getWriter();
			//ajax���յ��û�����
			out.write(JSON.toJSONString(userslist));
			System.out.print(JSON.toJSONString(userslist));
			System.out.print("JSON�û�");
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/JSONOrdersList")
	public void ordersslistJson(HttpServletRequest req,HttpServletResponse res) {
		System.out.println("����ForOrdersListForJSON");
		List<OrdersDetail> ordersDetails = new ArrayList<OrdersDetail>();
		ordersDetails = findOrdersListMapper.getOrdersList();    //������ж����б�
		// ��ajax��������
		PrintWriter out;
		try {
			res.setContentType("text/json;charset=UTF-8");
			out = res.getWriter();
			//ajax���յ��û�����
			out.write(JSON.toJSONString(ordersDetails));
			System.out.print(JSON.toJSONString(ordersDetails));
			System.out.print("JSON����");
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

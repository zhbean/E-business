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
import com.j219.dao.FindGoodsListMapper;
import com.j219.dao.FindUserListMapper;
import com.j219.model.Goods;
import com.j219.model.User;

@Controller
public class FindListController {

	@Autowired
	private FindGoodsListMapper findGoodsListMapper;
	@Autowired
	private FindUserListMapper findUserListMapper;

	@RequestMapping("/goodslist")
	public ModelAndView goodslist() {
		System.out.println("调用controllerForGoodsList");
		List<Goods> goodslist = new ArrayList<Goods>();
		goodslist = findGoodsListMapper.getGoodsList();// 获得所有商品列表
		ModelAndView mv = new ModelAndView();
		mv.setViewName("GoodslistTest");
		mv.addObject("goodslist", goodslist);
		return mv;
	}

	@RequestMapping("/JSONGoodsList")
	public void goodslistJson(HttpServletRequest req,HttpServletResponse res) {
		System.out.println("调用controllerForGoodsListForJSON");
		List<Goods> goodslist = new ArrayList<Goods>();
		goodslist = findGoodsListMapper.getGoodsList();// 获得所有商品列表
		// 向ajax发送数据
		PrintWriter out;
		try {
			res.setContentType("text/json;charset=UTF-8");
			out = res.getWriter();
			//ajax接收到商品数组
			out.write(JSON.toJSONString(goodslist));
			System.out.print(JSON.toJSONString(goodslist));
			System.out.print("JSON后输出");
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/JSONUserList")
	public void userslistJson(HttpServletRequest req,HttpServletResponse res) {
		System.out.println("调用controllerForUsersListForJSON");
		List<User> userslist = new ArrayList<User>();
		userslist = findUserListMapper.getUsersList();
		// 向ajax发送数据
		PrintWriter out;
		try {
			res.setContentType("text/json;charset=UTF-8");
			out = res.getWriter();
			//ajax接收到商品数组
			out.write(JSON.toJSONString(userslist));
			System.out.print(JSON.toJSONString(userslist));
			System.out.print("JSON用户");
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

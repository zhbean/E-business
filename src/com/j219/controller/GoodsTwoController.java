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
		System.out.println("调用controller");
		List<GoodsTwo> goodslist = new ArrayList<GoodsTwo>();
		goodslist = goodsTwoDao.getGoodsname(goodsname);
		
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
	
	@RequestMapping("/orderscount")
	public void getorderscount(HttpServletRequest req,HttpServletResponse res,String account) throws IOException{

		System.out.println("调用controller");
		GoodsTwo count =goodsTwoDao.getOrdersCountByAccount(account);
		GoodsTwo tcount =goodsTwoDao.getTOrdersCountByAccount(account);
		List<Integer> coulist=new ArrayList<Integer>();
		coulist.add(count.getOrdersCount());
		coulist.add(tcount.getTorderCount());
		
		PrintWriter out;
		try {
			res.setContentType("text/json;charset=UTF-8");
			out = res.getWriter();
			//ajax接收到商品数组
			out.write(JSON.toJSONString(coulist));
			System.out.print(JSON.toJSONString(coulist));
			System.out.print("JSON后输出");
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("/bulletintitle")
	public void bulletintitle(HttpServletRequest req,HttpServletResponse res) throws IOException{

		System.out.println("调用controller");
		List<GoodsTwo> bulletintitlelist = new ArrayList<GoodsTwo>();
		bulletintitlelist = goodsTwoDao.getbulltinstitle();
		
		PrintWriter out;
		try {
			res.setContentType("text/json;charset=UTF-8");
			out = res.getWriter();
			//ajax接收到商品数组
			out.write(JSON.toJSONString(bulletintitlelist));
			System.out.print(JSON.toJSONString(bulletintitlelist));
			System.out.print("JSON后输出");
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("/bulletin")
	public void getbulletin(HttpServletRequest req,HttpServletResponse res,String bulletinstit) throws IOException{

		System.out.println("调用troller");
		List<GoodsTwo> bulletinslist = new ArrayList<GoodsTwo>();
		bulletinslist = goodsTwoDao.getbulltins(bulletinstit);
		
		PrintWriter out;
		try {
			res.setContentType("text/json;charset=UTF-8");
			out = res.getWriter();
			//ajax接收到商品数组
			out.write(JSON.toJSONString(bulletinslist));
			System.out.print(JSON.toJSONString(bulletinslist));
			System.out.print("JSON后输出");
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("/CartCount")
	public void getCartCount(HttpServletRequest req,HttpServletResponse res,String account) throws IOException{

		System.out.println("调用oller");
		GoodsTwo cartcount =goodsTwoDao.getCartCountByAccount(account);
		List<GoodsTwo> cartlist = new ArrayList<GoodsTwo>();
		try {
			res.setContentType("text/json;charset=UTF-8");
			PrintWriter out;
			out = res.getWriter();
			//ajax接收到商品数组
			out.write(JSON.toJSONString(cartcount.getCartCount()));
			System.out.print(JSON.toJSONString(cartcount.getCartCount()));
			System.out.print("JSON后输出");
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("/goodsdetails")
	public void getGoodsDetails(HttpServletRequest req,HttpServletResponse res,String account) throws IOException{

		System.out.println("调用controller");
		 List<GoodsTwo> goodsDetailslist=new ArrayList<GoodsTwo>();
		 goodsDetailslist=goodsTwoDao.getGoodDetails();
		
		
		PrintWriter out;
		try {
			res.setContentType("text/json;charset=UTF-8");
			out = res.getWriter();
			//ajax接收到商品数组
			out.write(JSON.toJSONString(goodsDetailslist));
			System.out.print(JSON.toJSONString(goodsDetailslist));
			System.out.print("JSON后输出");
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("/getgoods")
	public void getGoodsbygoodsname(HttpServletRequest req,HttpServletResponse res,String goodsname) throws IOException{

		System.out.println("调用controller");
		 List<GoodsTwo> goodslist=new ArrayList<GoodsTwo>();
		 goodslist=goodsTwoDao.getGoodDetailsBygoodsname(goodsname);
		
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
	@RequestMapping("/getprice")
	public void getPrice(HttpServletRequest req,HttpServletResponse res,String specno) throws IOException{

		System.out.println("调用controller");
		 List<GoodsTwo> pricelist=new ArrayList<GoodsTwo>();
		 pricelist=goodsTwoDao.getGoodsPrice(specno);
		
		PrintWriter out;
		try {
			res.setContentType("text/json;charset=UTF-8");
			out = res.getWriter();
			//ajax接收到商品数组
			out.write(JSON.toJSONString(pricelist));
			System.out.print(JSON.toJSONString(pricelist));
			System.out.print("JSON后输出");
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("/getaddress")
	public void getAddress(HttpServletRequest req,HttpServletResponse res,String account) throws IOException{

		System.out.println("调用controller");
		 List<GoodsTwo> aderslist=new ArrayList<GoodsTwo>();
		 aderslist=goodsTwoDao.getaddress(account);
		
		PrintWriter out;
		try {
			res.setContentType("text/json;charset=UTF-8");
			out = res.getWriter();
			//ajax接收到商品数组
			out.write(JSON.toJSONString(aderslist));
			System.out.print(JSON.toJSONString(aderslist));
			System.out.print("JSON后输出");
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("/getcartgoods")
	public void getCartGoods(HttpServletRequest req,HttpServletResponse res,String account) throws IOException{

		System.out.println("调用controller");
		 List<GoodsTwo> cartlist=new ArrayList<GoodsTwo>();
		 cartlist=goodsTwoDao.getCartGoods(account);
		
		PrintWriter out;
		try {
			res.setContentType("text/json;charset=UTF-8");
			out = res.getWriter();
			//ajax接收到商品数组
			out.write(JSON.toJSONString(cartlist));
			System.out.print(JSON.toJSONString(cartlist));
			System.out.print("JSON后输出");
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}



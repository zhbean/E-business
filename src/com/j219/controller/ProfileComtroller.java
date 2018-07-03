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
import com.j219.dao.ProfileDao;
import com.j219.model.Profile;

@Controller
public class ProfileComtroller {

	@Autowired
	private ProfileDao profileDao;

	@RequestMapping(value="/myprofile")
	public void myprofile(String account, HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/json;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		response.setHeader("Content-Type", "text/html;charset=utf-8");
		
		System.out.println(account);

		try {
			List<Profile> profile = profileDao.findProfile(account);
			out.write(JSON.toJSONString(profile));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/setprofile")
	public ModelAndView signup(String myaccount,String myusername, String sex) {

		System.out.println(myusername);
		System.out.println(sex);
		
		ModelAndView mv = new ModelAndView();
		
		if("option1".equals(sex)) {sex = "ƒ–";}
		else if("option2".equals(sex)) {sex = "≈Æ";}
		else {sex = "±£√‹";}
		
		if (myusername!=null && sex!=null) {
			try {
				profileDao.setProfile(myusername,sex,myaccount);
				return new ModelAndView("redirect:/jsp/profile.jsp?account="+myaccount);
			} catch (Exception e) {
				System.out.println(e);
				System.out.println("≤Â»Î ß∞‹");
				mv.setViewName("profile.jsp?account="+myaccount);
				return mv;
			}
		}
		else {
			System.out.println("◊¢≤· ß∞‹");
			mv.setViewName("profile.jsp?account="+myaccount);
			return mv;
		}
	}
	
	
}

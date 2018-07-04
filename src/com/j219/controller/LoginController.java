package com.j219.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.j219.dao.LoginDao;
import com.j219.model.Login;


@Controller
public class LoginController {

	@Autowired
	private LoginDao loginDao;

	/*@RequestMapping("/LoginCheck")
	public ModelAndView LoginCheck(String account, String password) {
		System.out.println("调用controller");
		Login login = loginDao.getUsernameByAccountAndpassword(account, password);
		
		ModelAndView mv = new ModelAndView();
		if (login != null) {

			mv.setViewName("redirect:/StoreProscenium.jsp");
			mv.addObject("username", login.getUsername());
			mv.addObject("account",account);
			

		} else {

			mv.setViewName("redirect:/Login.jsp");
			mv.addObject("LoginError", "账号或密码错误");

		}
		return mv;
	}*/
	@RequestMapping("/LoginCheck")
	public ModelAndView doGet(HttpServletRequest request, HttpServletResponse response,String account, String password) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		System.out.println("调用controller");
		Login login = loginDao.getUsernameByAccountAndpassword(account, password);
		if("admin".equals(account) && "123".equals(password)) {
			mv.setViewName("redirect:/ManagerShopIndex.jsp");
		}
		
		else if (login != null) {

			mv.setViewName("redirect:/StoreProscenium.jsp");
			mv.addObject("username", login.getUsername());
			mv.addObject("account",account);
			session.setAttribute("username", login.getUsername());
			session.setAttribute("account", account);

		} else {

			mv.setViewName("redirect:/Login.jsp");
			mv.addObject("LoginError", "账号或密码错误");

		}
		return mv;
		
	}
}

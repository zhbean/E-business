package com.j219.controller;

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

	@RequestMapping("/LoginCheck")
	public ModelAndView LoginCheck(String account, String password) {
		System.out.println("µ˜”√controller");
		System.out.println(account);
		System.out.println(password);
		Login login = loginDao.getUsernameByAccountAndpassword(account, password);
		Login count = loginDao.getOrdersCountByAccount(account);
		Login tcount = loginDao.getTOrdersCountByAccount(account);
		System.out.println(count.getOrdersCount());
		ModelAndView mv = new ModelAndView();
		if (login != null) {

			mv.setViewName("redirect:/StoreProscenium.jsp");
			mv.addObject("username", login.getUsername());
			mv.addObject("account",account);
			mv.addObject("count",count.getOrdersCount());
			mv.addObject("tcount",tcount.getTorderCount());

		} else {

			mv.setViewName("redirect:/Login.jsp");
			mv.addObject("LoginError", "’À∫≈ªÚ√‹¬Î¥ÌŒÛ");

		}
		return mv;
	}
}

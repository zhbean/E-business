package com.j219.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.j219.dao.SignupDao;

@Controller
public class SignupConttroller {

	@Autowired
	private SignupDao signupDao;

	@RequestMapping("/signup")
	public ModelAndView signup(String account, String username, String password) {
		boolean hasAccount = false;
		boolean hasUsername = false;

		System.out.println(account);
		System.out.println(username);
		System.out.println(password);
		
		if (signupDao.hasAccount(account)!=null) {
			hasAccount = true;
			System.out.println("���˺�");
		}
		if (signupDao.hasUsername(username)!=null) {
			hasUsername = true;
			System.out.println("���û���");
		}

		ModelAndView mv = new ModelAndView();
		
		if (!hasAccount && !hasUsername) {
			try {
				signupDao.newSignup(username, account, password);
				System.out.println("ע��ɹ�");
				return new ModelAndView("redirect:/Login.jsp");
			} catch (Exception e) {
				System.out.println(e);
				System.out.println("����ʧ��");
				mv.setViewName("signup");
				return mv;
			}
		}
		else {
			System.out.println("ע��ʧ��");
			mv.setViewName("signup");
			mv.addObject("hasAccount",hasAccount);
			mv.addObject("hasUsername",hasUsername);
			return mv;
		}
	}
}

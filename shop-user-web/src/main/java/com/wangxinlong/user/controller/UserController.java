package com.wangxinlong.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("user")
@Controller
public class UserController {
	
	
	@RequestMapping("toLogin")
	public String toLogin() {
		return "user/login";
	}
	
	@RequestMapping("toRegister")
	public String toRegister() {
		
		return "user/register";
	}
}

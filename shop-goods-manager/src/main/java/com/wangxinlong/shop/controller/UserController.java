package com.wangxinlong.shop.controller;

import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.test.web.servlet.result.JsonPathResultMatchers;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wangxinlong.shop.common.JsonResult;
import com.wangxinlong.shop.service.UserService;

@Controller
public class UserController {
	
	@Reference
	private UserService userService;
	
	/**
	 * 	跳转到登陆页面
	 * @return
	 */
	@RequestMapping("toLogin")
	public String toLogin() {
		
		return "login";
	}
	
	@ResponseBody
	@RequestMapping("login")
	public Object login(String username,String password) {
		boolean bool = userService.adminLogin(username, password);
		if(bool) {
			
			return JsonResult.successResult();
		}else {
			return JsonResult.failResult(400, "账号或密码不正确!");
		}
	}
	
	
}

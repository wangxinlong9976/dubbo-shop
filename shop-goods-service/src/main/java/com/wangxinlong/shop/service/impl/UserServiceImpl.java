package com.wangxinlong.shop.service.impl;

import org.apache.dubbo.config.annotation.Service;

import com.wangxinlong.shop.service.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Override
	public boolean adminLogin(String username, String password) {
		// TODO Auto-generated method stub
		return username.equals("admin") && password.equals("admin");
	}
	
	
}

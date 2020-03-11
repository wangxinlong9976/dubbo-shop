package com.wangxinlong.shop.service.impl;

import javax.annotation.Resource;

import org.apache.dubbo.config.annotation.Service;

import com.wangxinlong.shop.config.AdminProperties;
import com.wangxinlong.shop.service.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Resource
	private AdminProperties adminProperties;
	
	@Override
	public boolean adminLogin(String username, String password) {
		// TODO Auto-generated method stub
		return adminProperties.getUsername().equals(username) &&adminProperties.getPassword().equals(password);
	}
	
	
}

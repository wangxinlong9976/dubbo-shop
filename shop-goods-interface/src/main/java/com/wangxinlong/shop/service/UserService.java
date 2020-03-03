package com.wangxinlong.shop.service;

public interface UserService {
	
	/**
	 * 	管理员登陆方法
	 * @param username
	 * @param password
	 * @return
	 */
	public boolean adminLogin(String username,String password);
}
 
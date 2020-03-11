package com.wangxinlong.user.service;

import com.wangxinlong.user.common.JsonResult;
import com.wangxinlong.user.pojo.User;

public interface UserService {
	
	/**
	 * 	用户登陆 
	 * @param user
	 * @return json对象
	 */
	public JsonResult userLogin(User user);
	
	/**
	 * 	用户注册
	 * @param user
	 * @return	json对象
	 */
	public JsonResult userRegister(User user);
}

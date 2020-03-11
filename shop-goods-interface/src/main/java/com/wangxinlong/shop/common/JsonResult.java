package com.wangxinlong.shop.common;

public class JsonResult {
	 
	private boolean result;
	private Integer statuCode;
	private String message;
	public boolean isResult() {
		return result;
	}
	public void setResult(boolean result) {
		this.result = result;
	}
	public Integer getStatuCode() {
		return statuCode;
	}
	public void setStatuCode(Integer statuCode) {
		this.statuCode = statuCode;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public JsonResult(boolean result, Integer statuCode, String message) {
		super();
		this.result = result;
		this.statuCode = statuCode;
		this.message = message;
	}
	public JsonResult() {
		super();
	}
	@Override
	public String toString() {
		return "JsonResult [result=" + result + ", statuCode=" + statuCode + ", message=" + message + "]";
	}
	
	/**
	 * 	成功时响应的result
	 * @return
	 */
	public static JsonResult successResult() {
		
		return new JsonResult(true,200,null);
	}
	
	/**
	 * 	失败时响应的result
	 * @param statusCode
	 * @param message
	 * @return
	 */
	public static JsonResult failResult(Integer statusCode,String message) {
		
		return new JsonResult(false,statusCode,message);
	}
}

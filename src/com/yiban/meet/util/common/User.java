package com.yiban.meet.util.common;

import cn.yiban.util.HTTPSimple;
import net.sf.json.JSONObject;

 /**
 * @author Vanilla
 * 调用易班用户接口
 */
public class User {
	
	private final String YIBAN_OPEN_URL		= "https://openapi.yiban.cn/";
	
	private final String YIBAN_USER_REALME	= "user/real_me";
	private final String YIBAN_USER_VERIFYME = "user/verify_me";
	/*private final String YIBAN_USER_WX = "pay/yb_wx";*/
	
	
	private String token;
	
	
	public User(String token)
	{
		this.token =token;
	}
	
	
	public String realme()
	{
		String query = YIBAN_OPEN_URL;
		query += YIBAN_USER_REALME;
		query += "?access_token=";
		query += token;
		System.out.println("query："+query);
		return HTTPSimple.GET(query);
	}

	public String verifyme()
	{
		String query = YIBAN_OPEN_URL;
		query += YIBAN_USER_VERIFYME;
		query += "?access_token=";
		query += token;
		return HTTPSimple.GET(query);
	}
	
	/*public String wx(int award)
	{
		String query = YIBAN_OPEN_URL;
		query += YIBAN_USER_WX;
		query += "?access_token=";
		query += token;
		query += "&pay=";
		query += String.valueOf(award);
		return HTTPSimple.GET(query);
	}*/
	
	
}

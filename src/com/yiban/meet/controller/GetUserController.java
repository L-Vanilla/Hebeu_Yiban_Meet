package com.yiban.meet.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yiban.meet.domain.UserInfo;
import com.yiban.meet.service.ActivityService;
import com.yiban.meet.service.UserinfoService;
import com.yiban.meet.util.common.MeetConstants;
import com.yiban.meet.util.common.User;
import cn.yiban.open.Authorize;
import net.sf.json.JSONObject;


@Controller
public class GetUserController {
	/**
	 * 自动注入UserinfoService
	 * */
	@Autowired
	@Qualifier("userinfoService")
	private UserinfoService userinfoService;
	//登陆授权
	@RequestMapping(value="/welcome")
	 public String Welcome(){
		System.out.println("selectDept -->>");
		Authorize au = new Authorize(MeetConstants.APPID,MeetConstants.APPSECRET);
		String url = au.forwardurl(MeetConstants.BACKURL, "null", Authorize.DISPLAY_TAG_T.WEB);
		System.out.println("url"+Authorize.DISPLAY_TAG_T.WEB);
		System.out.println("url:"+url);
		/*mv.setViewName("redirect:"+url);*/
		return "redirect:"+url;
	}
	
	/**
	 * 获取用户信息
	 * */
	@RequestMapping(value="/getuser" )
	 public String getuser(HttpServletRequest request,HttpServletRequest response,HttpSession session){
		System.out.println("selectDept -->>");
		//** 编码  *//*
		String code = request.getParameter("code");
		System.out.println("code:"+code);
		Authorize au = new Authorize(MeetConstants.APPID,MeetConstants.APPSECRET);
		JSONObject json = JSONObject.fromObject(au.querytoken(code, MeetConstants.BACKURL));
		String accessToken = json.getString("access_token");
		request.getSession().setAttribute("accessToken", accessToken);
		System.out.println("accessToken:"+accessToken);
		/*if(accessToken.equals("")||accessToken==null) {
			return "redirect:welcome";
		}
		else {*/
		//Obtain user authentication information from the API
		User user = new User(accessToken);
		JSONObject userInfo1 = JSONObject.fromObject(user.verifyme()).getJSONObject("info");
		JSONObject userInfo2 = JSONObject.fromObject(user.realme()).getJSONObject("info");
	/*	JSONObject userInfo3 = JSONObject.fromObject(user.wx(5)).getJSONObject("info");
		System.out.println("写入网薪userInfo3"+userInfo3);*/
		/*if(userInfo1!=null) {
			System.out.println("不为空！");
			System.out.println("用户id"+userInfo1.getString("yb_userid"));
			return "/add_activity";
		}*/
		//获取用户信息
		UserInfo userInfo = new UserInfo();
		System.out.println("用户id"+userInfo1.getString("yb_userid"));
		userInfo.setUser_id(userInfo1.getString("yb_userid"));
		userInfo.setUser_sex(userInfo2.getString("yb_sex"));
		userInfo.setUser_name(userInfo1.getString("yb_realname"));
		userInfo.setUser_class(userInfo1.getString("yb_classname"));
		userInfo.setUser_head(userInfo2.getString("yb_userhead"));
		userInfo.setUser_money(userInfo2.getInt("yb_money"));
		
		//通过user_id查找用户是否存在
		UserInfo userinfo_byid=userinfoService.findUser_Byid(userInfo1.getString("yb_userid"));
		if(userinfo_byid==null) {
			userinfoService.addUser(userInfo);
			UserInfo userinfo_byid1=userinfoService.findUser_Byid(userInfo1.getString("yb_userid"));
			session.setAttribute(MeetConstants.USERINFO_SESSION, userinfo_byid1);	
		}
		else {
			System.out.println("网薪："+userInfo2.getInt("yb_money"));
			session.setAttribute(MeetConstants.USERINFO_SESSION, userInfo);	
		}
		return "redirect:home";
	//	}
	}
}

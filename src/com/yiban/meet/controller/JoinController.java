package com.yiban.meet.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yiban.meet.dao.IntegralDao;
import com.yiban.meet.dao.provider.IntegralDaoDynaSqlProvider;
import com.yiban.meet.domain.Activity;
import com.yiban.meet.domain.Join;
import com.yiban.meet.domain.UserInfo;
import com.yiban.meet.service.ActivityService;
import com.yiban.meet.service.JoinService;
import com.yiban.meet.service.UserinfoService;
import com.yiban.meet.util.common.MeetConstants;
import com.yiban.meet.util.common.UUIDUtils;

@Controller
public class JoinController {
	
	@Autowired
	@Qualifier("joinService")
	private JoinService joinService;
	/**
	 * 自动注入UserinfoService
	 * */
	@Autowired
	@Qualifier("userinfoService")
	private UserinfoService userinfoService;
	
	/*1.执行添加操作
	 * 0.跳到添加页面
	*/
	@RequestMapping(value="/add_join")
	 public ModelAndView addJoin(
			 String flag,String activity_id,
			 @ModelAttribute Join join,
			 ModelAndView mv,HttpSession session) throws IllegalStateException, IOException{
			System.out.println("flag:"+flag);
			if(flag.equals("1")) {
			// 执行添加操作
			System.out.println("ddd");
			UserInfo userinfo=(UserInfo) session.getAttribute(MeetConstants.USERINFO_SESSION);
			//自动生成UUID
			join.setId(UUIDUtils.getUUID());
			join.setActivity_id(activity_id);
			join.setJoinuser_id(userinfo.getUser_id());
			join.setJoin_name(userinfo.getUser_name());
			join.setJoin_sex(userinfo.getUser_sex());
			join.setJoin_class(userinfo.getUser_class());
			join.setJoin_head(userinfo.getUser_head());
			session.setAttribute("join_id",join.getId() );
			System.out.println("join_id"+join.getId());
			System.out.println("活动id:"+activity_id);
			System.out.println("用户id："+userinfo.getUser_id());
			System.out.println("用户名："+userinfo.getUser_name());
			System.out.println("留言:"+join.getWords());
			joinService.addJoin(join);
			UserInfo userinfo1=userinfoService.findUser_Byid(userinfo.getUser_id());
			if(userinfo1.getCredit_today()<2000) {
				IntegralDao integralDao=new IntegralDaoDynaSqlProvider();
				int i=integralDao.addIntegralByYbid(userinfo.getUser_id(), 50);
				System.out.println("申请活动》》》》"+i);
				userinfoService.update_credit_join(userinfo.getUser_id());
			}
			System.out.println("add_activity!");
			mv.setViewName("redirect:/join_sucess?join_mess="+"1");
			// 设置客户端跳转到查询请求
			}
			else {
				System.out.println("activity_id"+activity_id);
				return new ModelAndView("add_join","activity_id",activity_id);
			}
		// 返回
		return mv;
	}
	/*申请成功*/
	@RequestMapping(value="/join_sucess")
	 public String Join_sucess(HttpSession session,String join_mess, Model model){
		
		System.out.println("join_sucess>>>>");
		String join_id=(String) session.getAttribute("join_id");
		System.out.println("活动id；"+join_id);
		Join join=joinService.findJoinById(join_id);
		model.addAttribute("join", join);
		model.addAttribute("join_mess", join_mess);
		System.out.println("join_mess>>"+join_mess);
		System.out.println("参加活动id："+join.getId());
		return "add_join";
		}
	/*我参加的活动
	 * 1-正在申请
	 * 2-同意
	 * 3-拒绝
	 * */
	@RequestMapping(value="/my_join")
	 public String My_join(Model model,HttpSession session){
		System.out.println("members>>>>");
		UserInfo userinfo = (UserInfo) session.getAttribute(MeetConstants.USERINFO_SESSION);
		
		/*1-正在申请*/
		Join join1=new Join();
		join1.setJoinuser_id(userinfo.getUser_id());
		join1.setJoin_state(1);
		List<Join> joins1=joinService.findJoinByUser_Id(join1);
		model.addAttribute("joins1", joins1);
		
		/*2-同意*/
		Join join2=new Join();
		join2.setJoinuser_id(userinfo.getUser_id());
		join2.setJoin_state(2);
		List<Join> joins2=joinService.findJoinByUser_Id(join2);
		model.addAttribute("joins2", joins2);
		
		/*1-拒绝*/
		Join join3=new Join();
		join3.setJoinuser_id(userinfo.getUser_id());
		join3.setJoin_state(3);
		List<Join> joins3=joinService.findJoinByUser_Id(join3);
		model.addAttribute("joins3", joins3);
		return "my_join";
		}
}

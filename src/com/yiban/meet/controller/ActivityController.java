package com.yiban.meet.controller;

import java.io.File;
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

import net.coobird.thumbnailator.Thumbnails;

/**
 * @author Vanilla
 *	活动控制器
 */
@Controller
public class ActivityController {
	/**
	 * 自动注入ActivityService
	 * */
	@Autowired
	@Qualifier("activityService")
	private ActivityService activityService;
	
	/**
	 * 自动注入UserinfoService
	 * */
	@Autowired
	@Qualifier("userinfoService")
	private UserinfoService userinfoService;
	
	@Autowired
	@Qualifier("joinService")
	private JoinService joinService;
	
	/**
	 * 处理添加请求
	 * @param String flag 标记， 1表示跳转到添加页面，2表示执行添加操作
	 * 
	 * */
	@RequestMapping(value="/add_activity")
	 public ModelAndView addActivity(
			 String flag,
			 @ModelAttribute Activity activity,String sex_limit1,String type1,
			 ModelAndView mv,HttpSession session) throws IllegalStateException, IOException{
		System.out.println("add_activity>>>>");
		System.out.println("flag:"+flag);
		if (flag.equals("1")) {
			System.out.println("性别限制"+sex_limit1);
			/*判断性别 * */
			if(sex_limit1.equals("男女不限")) {
				activity.setSex_limit(0);
			}
			else if(sex_limit1.equals("男")) {
				activity.setSex_limit(1);
			}
			else {
				activity.setSex_limit(2);
			}
			/*判断类型
			 * * 0.约吃饭
			 * 1.跑步
			 * 2.逛街
			 * 3.学习
			 * 4.游戏
			 * 5.其他*/
			if(type1.equals("约吃饭")) {
				activity.setType(0);
			}
			else if(type1.equals("约跑步")) {
				activity.setType(1);
			}
			else if(type1.equals("约逛街")) {
				activity.setType(2);
			}
			else if(type1.equals("约学习")) {
				activity.setType(3);
			}
			else if(type1.equals("约游戏")) {
				activity.setType(4);
			}
			else {
				activity.setType(5);
			}
			// 执行添加操作
			System.out.println("ddd");
			//设置活动id
			activity.setId(UUIDUtils.getUUID());
			// 上传文件路径
			String path = session.getServletContext().getRealPath("/upload/");
			//上传文件的缓存路径
			String path_tmp = session.getServletContext().getRealPath("/upload_tmp/");
			String imgname = UUIDUtils.getUUID()+".jpg";
			System.out.println(path);
			activity.getFile().transferTo(new File(path_tmp + File.separator + imgname));
			// 上传文件名
			
			String imgsrc=path_tmp  + imgname;
			File srcfile = new File(imgsrc);
			System.out.println("原文件大小"+srcfile.length());
			System.out.println("文件原路经"+imgsrc);
			//目标路径
			String imgdist=path  + imgname;
			System.out.println("获取目标路径"+imgdist);
			
			if(srcfile.length()>30257 ) {
				Thumbnails.of(srcfile).scale(0.25f).toFile(imgdist);
			}else {
				Thumbnails.of(srcfile).scale(1f).toFile(imgdist);
			}
			File distfile = new File(imgdist);
			System.out.println("文件原路经"+distfile.length());

			/*// 执行添加操作
			System.out.println("ddd");
			// 上传文件路径
			String path = session.getServletContext().getRealPath("/upload/");
			System.out.println(path);
			// 上传文件名
			String imgname = UUIDUtils.getUUID() + activity.getFile().getOriginalFilename();
			// 将上传文件保存到一个目标文件当中
			activity.getFile().transferTo(new File(path + File.separator + imgname));*/
		
			// 设置fileName
			activity.setImg(imgname);
			UserInfo userinfo = (UserInfo) session.getAttribute(MeetConstants.USERINFO_SESSION);
			// 自动生成UUID
			
			System.out.println("用户id:" + userinfo.getUser_id());
			System.out.println("用户真实姓名：" + userinfo.getUser_name());
			System.out.println("用户头像：" + userinfo.getUser_head());
			activity.setUser_id(userinfo.getUser_id());
			activity.setUser_name(userinfo.getUser_name());
			activity.setUser_sex(userinfo.getUser_sex());
			activity.setUser_class(userinfo.getUser_class());
			activity.setUser_head(userinfo.getUser_head());
			//判断当天积分
	
			UserInfo userinfo1=userinfoService.findUser_Byid(userinfo.getUser_id());
			if(userinfo1.getCredit_today()<2000) {
				//添加用户积分，发布一个活动积5分
				IntegralDao integralDao=new IntegralDaoDynaSqlProvider();
				int i=integralDao.addIntegralByYbid(userinfo.getUser_id(), 500);
				System.out.println("发布活动》》》》"+i);
				userinfoService.update_credit(userinfo.getUser_id());
			}
			
	
			activityService.addActivity(activity);
			session.setAttribute("activity_id",activity.getId());
			System.out.println("add_activity!");
			mv.setViewName("redirect:/add_sucess?add_mess="+"1");
		}
		else {
			System.out.println("添加活动页面！");
			mv.setViewName("add_activity");
		}
		
		// 设置客户端跳转到查询请求
		// 返回
		return mv;
	}
	
	/*添加成功*/
	@RequestMapping(value="/add_sucess")
	 public String Add_sucess(HttpSession session,String add_mess, Model model){
		
		System.out.println("add_sucess>>>>");
		String activity_id=(String) session.getAttribute("activity_id");
		System.out.println("活动id；"+activity_id);
		Activity activity1=activityService.findActivityById(activity_id);
		model.addAttribute("activity1", activity1);
		model.addAttribute("add_mess", add_mess);
		System.out.println("add_mess>>"+add_mess);
		System.out.println("活动id："+activity1.getId());
		return "add_activity";
		}
	
	/**
	 * 查询活动信息
	 * 0.约吃饭
	 * 1.跑步
	 * 2.逛街
	 * 3.学习
	 * 4.游戏
	 * 5.其他
	 * */
	@RequestMapping(value="/home")
	 public String home(Model model,String flag,
			 @ModelAttribute Activity activity){
		
		System.out.println("home -->>");
		
			/** 查询用户信息(推荐）     */
		    activity.setDate_state(1);	
		    List<Activity> activitys = activityService.findActivityByDate(activity);
			System.out.println("活动数量："+activitys.size());
			model.addAttribute("activitys", activitys);
			
	        /** 查询用户信息(0约吃饭）     */
			Activity activity0 = new Activity();
			activity0.setType(0);
			activity0.setDate_state(1);	
			List<Activity> activitys0 = activityService.findActivityByType(activity0);
			System.out.println("0约吃饭活动数量："+activitys0.size());
			model.addAttribute("activitys0", activitys0);
			System.out.println("活动查询所有信息");
			
			/** 查询用户信息(1约跑步）     */
			Activity activity1 = new Activity();
			activity1.setType(1);
			activity1.setDate_state(1);	
			List<Activity> activitys1 = activityService.findActivityByType(activity1);
			System.out.println("1约跑步活动数量："+activitys1.size());
			model.addAttribute("activitys1", activitys1);
			System.out.println("活动查询所有信息");
			
			/** 查询用户信息(2约逛街）     */
			Activity activity2 = new Activity();
			activity2.setType(2);
			activity2.setDate_state(1);	
			List<Activity> activitys2 = activityService.findActivityByType(activity2);
			System.out.println("2约逛街活动数量："+activitys2.size());
			model.addAttribute("activitys2", activitys2);
			System.out.println("活动2");
			
			/** 查询用户信息(3约学习）     */
			Activity activity3 = new Activity();
			activity3.setType(3);
			activity3.setDate_state(1);	
			List<Activity> activitys3 = activityService.findActivityByType(activity3);
			System.out.println("3约学习活动数量："+activitys3.size());
			model.addAttribute("activitys3", activitys3);
			System.out.println("活动查询所有信息");
			
			/** 查询用户信息(4约游戏）     */
			Activity activity4 = new Activity();
			activity4.setType(4);
			 activity4.setDate_state(1);	
			List<Activity> activitys4 = activityService.findActivityByType(activity4);
			System.out.println("4约游戏活动数量："+activitys4.size());
			model.addAttribute("activitys4", activitys4);
			System.out.println("活动查询所有信息");
			
			/** 查询用户信息(5约其他）     */
			Activity activity5 = new Activity();
			activity5.setType(5);
			activity5.setDate_state(1);	
			List<Activity> activitys5 = activityService.findActivityByType(activity5);
			System.out.println("5约其他活动数量："+activitys5.size());
			model.addAttribute("activitys5", activitys5);
			System.out.println("活动查询所有信息");
			
			return "home";
		
	}
	
		/*显示用户详情*/
	@RequestMapping(value="/details")
	 public String Details(Model model,String flag,String id,@ModelAttribute Activity activity){
		
		System.out.println("details>>>>");
		System.out.println("活动id；"+id);
		Activity activity1=activityService.findActivityByJoin_State(id);
		model.addAttribute("activity1", activity1);
		System.out.println("活动id："+activity1.getId());
		return "details";
		}
	
	/*查看申请信息
	 * 2-同意
	 * 3-拒绝
	 * */
	@RequestMapping(value="/application")
	 public String Application(Model model,String flag,
			 String join_id,String activity_id){
		System.out.println("application>>>>");
		if(flag.equals("2")) {
			Join join=joinService.findJoinById(join_id);
			IntegralDao integralDao=new IntegralDaoDynaSqlProvider();
			int i=integralDao.addIntegralByYbid(join.getJoinuser_id(), 50);
			System.out.println("同意活动》》》》"+i);
			userinfoService.update_credit_join(join.getJoinuser_id());
			activityService.updateJoin_state(join_id,2);
		}
		else if(flag.equals("3")) {
			activityService.updateJoin_state(join_id,3);
		}
		/*else
			System.out.println("活动id；"+activity_id);*/
		Activity activity1=activityService.findActivityByJoin_State(activity_id);
		model.addAttribute("activity1", activity1);
		return "application";
		}
	
	/*查看成员信息*/
	@RequestMapping(value="/members")
	 public String Members(Model model,String activity_id){
		System.out.println("members>>>>");
		Activity activity1=activityService.findActivityById(activity_id);
		model.addAttribute("activity1", activity1);
		return "members";
		}
	
	/*我发布的活动*/
	@RequestMapping(value="/my_activity")
	 public String My_activity(Model model,HttpSession session){
		System.out.println("members>>>>");
		UserInfo userinfo = (UserInfo) session.getAttribute(MeetConstants.USERINFO_SESSION);
		Activity activity=new Activity();
		activity.setUser_id(userinfo.getUser_id());
		activity.setDate_state(2);
		List<Activity> activitys=activityService.findActivityByUser_Id(activity);
		model.addAttribute("activitys", activitys);
		return "my_activity";
		}
}

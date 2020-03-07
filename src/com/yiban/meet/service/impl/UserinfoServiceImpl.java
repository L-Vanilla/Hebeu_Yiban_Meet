package com.yiban.meet.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yiban.meet.dao.UserinfoDao;
import com.yiban.meet.domain.UserInfo;
import com.yiban.meet.service.UserinfoService;

@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service("userinfoService")
public class UserinfoServiceImpl implements UserinfoService {
	
	@Autowired
	private UserinfoDao userinfoDao;

	/*通过id查找用户是否存在*/
	@Override
	public UserInfo findUser_Byid(String user_id) {
		return userinfoDao.findUser_Byid(user_id);
	}

	/*添加用户*/
	@Override
	public void addUser(UserInfo userInfo) {
		userinfoDao.addUser(userInfo);
	}
	
	/*更新用户积分-发布活动*/
	@Override
	public void update_credit(String user_id) {
		UserInfo userinfo=userinfoDao.findUser_Byid(user_id);
		System.out.println("积分："+userinfo.getCredit());
		
		Integer credit=userinfo.getCredit()+500;
		Integer credit_tmp=userinfo.getCredit_today()+500;
		UserInfo userinfo1 = new UserInfo();
		System.out.println("userid"+user_id);
		userinfo1.setCredit(credit);
		userinfo1.setUser_id(user_id);
		userinfo1.setCredit_today(credit_tmp);
		userinfoDao.update_credit(userinfo1);
		
	}
	/*更新用户积分-申请参加*/
	@Override
	public void update_credit_join(String user_id) {
		UserInfo userinfo=userinfoDao.findUser_Byid(user_id);
	
		System.out.println("积分："+userinfo.getCredit());
		Integer credit=userinfo.getCredit()+50;
		Integer credit_tmp=userinfo.getCredit_today()+50;
		System.out.println("userid"+user_id);
		userinfo.setCredit(credit);
		userinfo.setUser_id(user_id);
		userinfo.setCredit_today(credit_tmp);

		userinfoDao.update_credit(userinfo);
	}

	
	
}

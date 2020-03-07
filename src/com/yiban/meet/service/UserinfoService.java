package com.yiban.meet.service;

import com.yiban.meet.domain.UserInfo;

public interface UserinfoService {
	
	/*通过id查找用户是否存在*/
	UserInfo findUser_Byid(String user_id);

	/*添加用户*/
	void addUser(UserInfo userInfo);

	/*更新用户积分-发布活动*/
	void update_credit(String user_id);

	/*更新用户积分-申请参加*/
	void update_credit_join(String user_id);

}

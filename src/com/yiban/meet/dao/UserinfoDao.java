package com.yiban.meet.dao;

import static com.yiban.meet.util.common.MeetConstants.USERINFOTABLE;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;

import com.yiban.meet.dao.provider.UserinfoDynaSqlProvider;
import com.yiban.meet.domain.UserInfo;

public interface UserinfoDao {

	/*通过id查找用户是否存在*/
	@Select("select * from " + USERINFOTABLE + " where user_id=#{user_id}")
	UserInfo findUser_Byid(String user_id);

	/*添加用户*/
	@SelectProvider(type = UserinfoDynaSqlProvider.class, method = "insertUser")
	void addUser(UserInfo userInfo);

	/*更新用户信息*/
	@SelectProvider(type = UserinfoDynaSqlProvider.class, method = "updateUser")
	void update_credit(UserInfo userinfo);

	

}

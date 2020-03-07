package com.yiban.meet.dao.provider;

import static com.yiban.meet.util.common.MeetConstants.USERINFOTABLE;

import org.apache.ibatis.jdbc.SQL;

import com.yiban.meet.domain.UserInfo;

public class UserinfoDynaSqlProvider {
	/*动态插入*/
	public String insertUser(UserInfo userinfo){
		
		return new SQL(){
			{
				INSERT_INTO(USERINFOTABLE);
				if(userinfo.getUser_id()!= null && !userinfo.getUser_id().equals("")){
					VALUES("user_id", "#{user_id}");
				}
				if(userinfo.getUser_name() != null && !userinfo.getUser_name().equals("")){
					VALUES("user_name", "#{user_name}");
				}
				if(userinfo.getUser_head() != null && !userinfo.getUser_head().equals("")){
					VALUES("user_head", "#{user_head}");
				}
				if(userinfo.getUser_class() != null && !userinfo.getUser_class().equals("")){
					VALUES("user_class", "#{user_class}");
				}
				if(userinfo.getUser_sex() != null && !userinfo.getUser_sex().equals("")){
					VALUES("user_sex", "#{user_sex}");
				}
				
			}
		}.toString();
	}
	
	// 动态更新
	public String updateUser(UserInfo userinfo){
		
		return new SQL(){
			{
				UPDATE(USERINFOTABLE);
				if(userinfo.getCredit() != null){
					SET(" credit = #{credit} ");
				}
				if(userinfo.getCredit_today() != null){
					SET("credit_today = #{credit_today}");
				}
				WHERE(" user_id = #{user_id} ");
			}
		}.toString();
	}
}

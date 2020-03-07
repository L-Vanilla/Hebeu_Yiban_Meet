package com.yiban.meet.dao.provider;


import org.apache.ibatis.jdbc.SQL;
import static com.yiban.meet.util.common.MeetConstants.ACTIVITYTABLE;

import com.yiban.meet.domain.Activity;

/**
 * @author Vanilla
 *动态SQL语句
 */
public class ActivityDynaSqlProvider {
		// 动态插入
		public String insertActivity(Activity activity){
			
			return new SQL(){
				{
					INSERT_INTO(ACTIVITYTABLE);
					if(activity.getId() != null && !activity.getId().equals("")){
						VALUES("id", "#{id}");
					}
					if(activity.getUser_id() != null && !activity.getUser_id().equals("")){
						VALUES("user_id", "#{user_id}");
					}
					if(activity.getUser_name() != null && !activity.getUser_name().equals("")){
						VALUES("user_name", "#{user_name}");
					}
					if(activity.getUser_sex() != null && !activity.getUser_sex().equals("")){
						VALUES("user_sex", "#{user_sex}");
					}
					if(activity.getUser_class() != null && !activity.getUser_class() .equals("")){
						VALUES("user_class", "#{user_class}");
					}
					if(activity.getUser_head() != null && !activity.getUser_head().equals("")){
						VALUES("user_head", "#{user_head}");
					}
					if(activity.getTitle() != null && !activity.getTitle().equals("")){
						VALUES("title", "#{title}");
					}
					if(activity.getType() != null && !activity.getType().equals("")){
						VALUES("type", "#{type}");
					}
					if(activity.getSex_limit() != null && !activity.getSex_limit().equals("")){
						VALUES("sex_limit", "#{sex_limit}");
					}
					if(activity.getPeople_limit() != null && !activity.getPeople_limit().equals("")){
						VALUES("people_limit", "#{people_limit}");
					}
					if(activity.getActivity_date() != null && !activity.getActivity_date().equals("")){
						VALUES("activity_date", "#{activity_date}");
					}
					if(activity.getActivity_place() != null && !activity.getActivity_place().equals("")){
						VALUES("activity_place", "#{activity_place}");
					}
					if(activity.getActivity_content() != null && !activity.getActivity_content().equals("")){
						VALUES("activity_content", "#{activity_content}");
					}
					if(activity.getImg() != null && !activity.getImg().equals("")){
						VALUES("img", "#{img}");
					}
					if(activity.getQq() != null && !activity.getQq().equals("")){
						VALUES("qq", "#{qq}");
					}
					if(activity.getPhone() != null && !activity.getPhone().equals("")){
						VALUES("phone", "#{phone}");
					}
					if(activity.getCreate_date()!=null) {
						VALUES("create_date","#{create_date}");
					}
				}
			}.toString();
		}
		/*动态查询*/
		public String selectActivity(Activity activity){
			String sql =  new SQL(){
				{
					SELECT("*");
					FROM(ACTIVITYTABLE);
					if(activity != null){
						if(activity.getType() != null ){
							WHERE(" type = #{type} ");
						}
						if(activity.getUser_id() != null&& !activity.getUser_id().equals("") ){
							WHERE(" user_id = #{user_id} ");
						}
						if(activity.getDate_state()==1&&activity.getDate_state() != null) {
							WHERE("activity_date > now()");
						}
						ORDER_BY("create_date DESC");
					}
					
				}
			}.toString();
			
			return sql;
		}	
		
		
}

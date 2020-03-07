package com.yiban.meet.dao.provider;

import static com.yiban.meet.util.common.MeetConstants.ACTIVITYTABLE;
import static com.yiban.meet.util.common.MeetConstants.JOINTABLE;



import org.apache.ibatis.jdbc.SQL;

import com.yiban.meet.domain.Activity;
import com.yiban.meet.domain.Join;

public class JoinDynaSqlProvider {
	/*动态插入*/
	public String insertJoin(Join join){
		
		return new SQL(){
			{
				INSERT_INTO(JOINTABLE);
				if(join.getId() != null && !join.getId().equals("")){
					VALUES("id", "#{id}");
				}
				if(join.getActivity_id() != null && !join.getActivity_id().equals("")){
					VALUES("activity_id", "#{activity_id}");
				}
				if(join.getJoinuser_id() != null && !join.getJoinuser_id().equals("")){
					VALUES("joinuser_id", "#{joinuser_id}");
				}
				if(join.getJoin_name() != null && !join.getJoin_name().equals("")){
					VALUES("join_name", "#{join_name}");
				}
				if(join.getJoin_sex() != null && !join.getJoin_sex().equals("")){
					VALUES("join_sex", "#{join_sex}");
				}
				if(join.getJoin_class() != null && !join.getJoin_class() .equals("")){
					VALUES("join_class", "#{join_class}");
				}
				if(join.getJoin_head() != null && !join.getJoin_head().equals("")){
					VALUES("join_head", "#{join_head}");
				}
				if(join.getWords()!= null && !join.getWords().equals("")){
					VALUES("words", "#{words}");
				}
				if(join.getJoin_qq() != null && !join.getJoin_qq().equals("")){
					VALUES("join_qq", "#{join_qq}");
				}
				if(join.getJoin_phone() != null && !join.getJoin_phone().equals("")){
					VALUES("join_phone", "#{join_phone}");
				}
				
			}
		}.toString();
	}
	/*动态查询所有活动
	public String selectJoin(Join join){
		String sql =  new SQL(){
			{
				SELECT("*");
				FROM(JOINTABLE);
				if(join != null){
					if(join.getJoin_state() != null ){
						WHERE(" join_state = #{join_state} ");
					}
				}
			}
		}.toString();
		
		return sql;
	}	*/
	/*动态查询*/
	public String selectJoin(Join join){
		String sql =  new SQL(){
			{
				SELECT("*");
				FROM(JOINTABLE);
				if(join != null){
					if(join.getJoinuser_id() != null&& !join.getJoinuser_id().equals("") ){
						WHERE(" joinuser_id = #{joinuser_id} ");
					}
					if(join.getJoin_state()!= null ){
						WHERE(" join_state = #{join_state} ");
					}
				}
				
			}
		}.toString();
		
		return sql;
	}	
	
}

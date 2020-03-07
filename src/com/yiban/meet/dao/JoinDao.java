package com.yiban.meet.dao;



import static com.yiban.meet.util.common.MeetConstants.JOINTABLE;

import java.util.List;

import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.mapping.FetchType;

import com.yiban.meet.dao.provider.ActivityDynaSqlProvider;
import com.yiban.meet.dao.provider.JoinDynaSqlProvider;
import com.yiban.meet.domain.Activity;
import com.yiban.meet.domain.Join;

public interface JoinDao {
	// 动态插入
	@SelectProvider(type = JoinDynaSqlProvider.class, method = "insertJoin")
	void add(Join join);

	// 根据id查询
	@Select("select * from " + JOINTABLE + " where id=#{id}")
	Join selectById(String id);
	
	/*根据活动id查询已同意的参加者信息*/
	@Select("select * from " + JOINTABLE + " where activity_id=#{acitivity_id} and join_state=2")
	List<Join> selectByActivity_Id(String acitivity_id);

	/* 统计参加已同意的人数 */
	@Select("select COUNT(*) from " + JOINTABLE + " where activity_id=#{acitivity_id} and join_state=2")
	Integer selectByCount(String acitivity_id);
	
	/*根据活动id查询参加者信息*/
	@Select("select * from " + JOINTABLE + " where activity_id=#{acitivity_id} ")
	List<Join> selectByActivity_Id2(String acitivity_id);

	/* 统计参加的人数 */
	@Select("select COUNT(*) from " + JOINTABLE + " where activity_id=#{acitivity_id} ")
	Integer selectByCount2(String acitivity_id);
	
	/*同意参加*/
	@Update("UPDATE "+JOINTABLE+" SET join_state='2' WHERE id=#{id}")
	void updateJoin_state2(String id);
	
	/*拒绝参加*/
	@Update("UPDATE "+JOINTABLE+" SET join_state='3' WHERE id=#{id}")
	void updateJoin_state3(String id);

	/*通过同意的用户查找参加的活动*/
	@SelectProvider(type=JoinDynaSqlProvider.class,method="selectJoin")
	@Results({@Result(id=true,column="id",property="id"),
		@Result(column="activity_id",property="activity",
		one=@One(select="com.yiban.meet.dao.ActivityDao.selectById2",fetchType=FetchType.EAGER)),
		@Result(column="activity_id",property="count",
		one=@One(select="com.yiban.meet.dao.JoinDao.selectByCount",fetchType=FetchType.EAGER)),
		@Result(column="activity_id",property="joins1",javaType=java.util.List.class,
		many=@Many(select="com.yiban.meet.dao.JoinDao.selectByActivity_Id",fetchType=FetchType.EAGER))
	})
	List<Join> select(Join join);
	
	
}

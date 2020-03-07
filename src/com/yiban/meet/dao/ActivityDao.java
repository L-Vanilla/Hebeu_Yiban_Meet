package com.yiban.meet.dao;


import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.mapping.FetchType;

import static com.yiban.meet.util.common.MeetConstants.ACTIVITYTABLE;

import java.util.List;

import com.yiban.meet.dao.provider.ActivityDynaSqlProvider;
import com.yiban.meet.domain.Activity;

/**
 * @author Vanilla
 *数据库操作接口
 */
public interface ActivityDao {

	// 动态添加活动
	@SelectProvider(type=ActivityDynaSqlProvider.class,method="insertActivity")
	@Results({@Result(column="create_date",property="create_date",javaType=java.util.Date.class),
			@Result(column="activity_date",property="activity_date",javaType=java.util.Date.class)})
	void add(Activity activity);
	
	
	/*动态查询，1对多的查询*/
	@SelectProvider(type=ActivityDynaSqlProvider.class,method="selectActivity")
	@Results({@Result(id=true,column="id",property="id"),
		@Result(column="id",property="count",
		one=@One(select="com.yiban.meet.dao.JoinDao.selectByCount",fetchType=FetchType.EAGER)),
		@Result(column="id",property="joins",javaType=java.util.List.class,
				many=@Many(select="com.yiban.meet.dao.JoinDao.selectByActivity_Id",fetchType=FetchType.EAGER))
	})
	List<Activity> select(Activity activity);

	//根据id查询,1对多的查询
	@Select("select * from "+ACTIVITYTABLE+" where id=#{id}")
	@Results({@Result(id=true,column="id",property="id"),
		@Result(column="id",property="count",
		one=@One(select="com.yiban.meet.dao.JoinDao.selectByCount",fetchType=FetchType.EAGER)),
		@Result(column="id",property="app_count",
		one=@One(select="com.yiban.meet.dao.JoinDao.selectByCount2",fetchType=FetchType.EAGER)),
		@Result(column="id",property="joins",javaType=java.util.List.class,
				many=@Many(select="com.yiban.meet.dao.JoinDao.selectByActivity_Id",fetchType=FetchType.EAGER))
	})
	Activity selectById(String id);
	
	//一对一查询
	@Select("select * from "+ACTIVITYTABLE+" where id=#{id}")
	Activity selectById2(String id);

	/*查询申请者信息*/
	@Select("select * from "+ACTIVITYTABLE+" where id=#{id}")
	@Results({@Result(id=true,column="id",property="id"),
		@Result(column="id",property="count",
		one=@One(select="com.yiban.meet.dao.JoinDao.selectByCount",fetchType=FetchType.EAGER)),
		@Result(column="id",property="app_count",
		one=@One(select="com.yiban.meet.dao.JoinDao.selectByCount2",fetchType=FetchType.EAGER)),
		@Result(column="id",property="joins",javaType=java.util.List.class,
		many=@Many(select="com.yiban.meet.dao.JoinDao.selectByActivity_Id2",fetchType=FetchType.EAGER))
	})
	Activity selctByJoin_State(String activity_id);


	
	
}

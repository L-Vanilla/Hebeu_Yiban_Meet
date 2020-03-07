package com.yiban.meet.service;

import java.util.List;

import com.yiban.meet.domain.Activity;

/**
 * @author Vanilla
 *	持久层接口
 */
public interface ActivityService {
	
	/*添加活动*/
	void addActivity(Activity activity);
	/*添加活动*/
	/*根据类型查询*/
	List<Activity> findActivityByType(Activity activity);
	
	/*根据时间查询*/
	List<Activity> findActivityByDate(Activity activity);
	
	/*根据id查询*/
	Activity findActivityById(String id);
	
	/*修改参与者参加状态*/
	void updateJoin_state(String id,Integer i);
	
	/*根据用户查询发布的活动*/
	List<Activity> findActivityByUser_Id(Activity activity);
	
	/*查询申请者信息*/
	Activity findActivityByJoin_State(String activity_id);
	
	

	
}
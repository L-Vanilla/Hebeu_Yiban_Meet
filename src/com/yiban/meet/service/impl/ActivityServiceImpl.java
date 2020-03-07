package com.yiban.meet.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yiban.meet.dao.ActivityDao;
import com.yiban.meet.dao.JoinDao;
import com.yiban.meet.domain.Activity;
import com.yiban.meet.domain.Join;
import com.yiban.meet.service.ActivityService;

/**
 * @author Vanilla
 * 持久层实现方法
 */

@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service("activityService")
public class ActivityServiceImpl implements ActivityService {
	/**
	 * 自动注入持久层Dao对象
	 * */
	@Autowired
	private ActivityDao activityDao;
	
	@Autowired
	private JoinDao joinDao;
	
	/*添加活动*/
	public void addActivity(Activity activity) {
		System.out.println("service_add");
		activityDao.add(activity);
		
	}
	/*查询所有活动信息*/
	/*public List<Activity> findActivity(Activity activity) {
		return activityDao.selectAll();
	}*/
	
	/*按照活动类型查询*/
	@Override
	public List<Activity> findActivityByType(Activity activity) {
		return activityDao.select(activity);
	}
	
	/*按照活动时间查询*/
	@Override
	public List<Activity> findActivityByDate(Activity activity) {
		return activityDao.select(activity);
	}
	
	/*按照活动id查询*/
	@Override
	public Activity findActivityById(String id) {
		return activityDao.selectById(id);
	}
	/*	修改参加者状态*/
	@Override
	public void updateJoin_state(String id,Integer i) {
		if(i==2) {
			joinDao.updateJoin_state2(id);
		}
		else
			joinDao.updateJoin_state3(id);
	}
	/*根据用户id查询发布的活动*/
	@Override
	public List<Activity> findActivityByUser_Id(Activity activity) {
		return activityDao.select(activity);
	}

	/*查询申请者信息*/
	@Override
	public Activity findActivityByJoin_State(String activity_id) {
		return activityDao.selctByJoin_State(activity_id);
	}


}

package com.yiban.meet.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yiban.meet.dao.JoinDao;
import com.yiban.meet.domain.Join;
import com.yiban.meet.service.JoinService;
@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service("joinService")
public class JoinServiceImpl implements JoinService {
	@Autowired
	private JoinDao joinDao;
	/*添加*/
	//@Override
	public void addJoin(Join join) {
		joinDao.add(join);
	}

	/*通过用户查找参加的活动*/
	public List<Join> findJoinByUser_Id(Join join) {
		return joinDao.select(join);
	}

	public Join findJoinById(String join_id) {
		// TODO Auto-generated method stub
		return joinDao.selectById(join_id);
	}
}

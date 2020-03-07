package com.yiban.meet.service;

import java.util.List;

import com.yiban.meet.domain.Join;

public interface JoinService {
	/*添加*/
	void addJoin(Join join);

	/*通过用户查找参加的活动*/
	List<Join> findJoinByUser_Id(Join join);

	/*通过id查找*/
	Join findJoinById(String join_id);

}

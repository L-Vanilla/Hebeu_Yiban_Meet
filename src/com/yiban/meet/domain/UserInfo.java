package com.yiban.meet.domain;

import java.io.Serializable;

public class UserInfo implements Serializable {
	private String user_id;       //用户编号
	private String user_name;      //用户姓名
	private String user_sex;       //用户性别f-女  m-男
	private String user_class;     //用户专业班级
	private String user_head;      //头像
	private int user_money;
	private Integer credit;            //积分
	private Integer credit_today;  //当天缓存积分
	
	public Integer getCredit_today() {
		return credit_today;
	}
	public void setCredit_today(Integer credit_today) {
		this.credit_today = credit_today;
	}
	public Integer getCredit() {
		return credit;
	}
	public void setCredit(Integer credit) {
		this.credit = credit;
	}
	public int getUser_money() {
		return user_money;
	}
	public void setUser_money(int user_money) {
		this.user_money = user_money;
	}
	public String getUser_class() {
		return user_class;
	}
	public void setUser_class(String user_class) {
		this.user_class = user_class;
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_sex() {
		return user_sex;
	}
	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}
	public String getUser_head() {
		return user_head;
	}
	public void setUser_head(String user_head) {
		this.user_head = user_head;
	}
	@Override
	public String toString() {
		return "UserInfo [user_id=" + user_id + ", user_name=" + user_name + ", user_sex=" + user_sex + ", user_class="
				+ user_class + ", user_head=" + user_head + ", user_money=" + user_money + ", credit=" + credit + "]";
	}
	
	
}

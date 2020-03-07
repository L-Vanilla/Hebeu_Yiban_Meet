package com.yiban.meet.domain;

import java.io.File;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class Activity implements Serializable {//标识一个类的对象可以被序列化
	private String id;		       //活动编号
	private String user_id;       //用户编号
	private String user_name;      //用户姓名
	private String user_sex;       //用户性别f-女  m-男
	private String user_class;     //用户专业班级
	private String user_head; 	//用户头像
	private String title;          //活动名称
	 /*活动类型0-约吃饭  1-约跑步
	  * 2-约逛街 3-约学习 4-约游戏
	  * 5-约其他
	  * */
	private Integer type; 
	private String type1; 
	private Integer sex_limit;	   //性别限制
	private String sex_limit1;	   //性别限制
	
	private Integer people_limit;  //人数限制
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date activity_date;		//活动日期
	private String activity_place;  //活动地点
	private String activity_content;//活动内容
	private String img;             // 图片路径
	private MultipartFile file;	
	private String qq;          	//qq
	/*public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}*/
	private String phone;           //联系方式
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	private Date create_date;		//创建时间
	private Integer apply_state;	//申请状态（0-正在申请，1-申请成功，2-申请失败）
	
	private Integer date_state;   //日期判断
	public Integer getDate_state() {
		return date_state;
	}
	public void setDate_state(Integer date_state) {
		this.date_state = date_state;
	}
	/*计同意人数*/
	private Integer count;
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	/*计申请人数*/
	private Integer app_count;
	
	public Integer getApp_count() {
		return app_count;
	}
	public void setApp_count(Integer app_count) {
		this.app_count = app_count;
	}
	/*-----------------*/
	/*关联其他类*/
	private Join join;
	
	private List<Join> joins;
	public Join getJoin() {
		return join;
	}
	public void setJoin(Join join) {
		this.join = join;
	}
	public List<Join> getJoins() {
		return joins;
	}
	public void setJoins(List<Join> joins) {
		this.joins = joins;
	}
	/*--------------*/
	public Integer getType() {
		return type;
	}
	public String getType1() {
		return type1;
	}
	public void setType1(String type1) {
		this.type1 = type1;
	}
	public String getSex_limit1() {
		return sex_limit1;
	}
	public void setSex_limit1(String sex_limit1) {
		this.sex_limit1 = sex_limit1;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getUser_head() {
		return user_head;
	}
	public void setUser_head(String user_head) {
		this.user_head = user_head;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getSex_limit() {
		return sex_limit;
	}
	public void setSex_limit(Integer sex_limit) {
		this.sex_limit = sex_limit;
	}
	public Integer getPeople_limit() {
		return people_limit;
	}
	public void setPeople_limit(Integer people_limit) {
		this.people_limit = people_limit;
	}
	public Date getActivity_date() {
		return activity_date;
	}
	public void setActivity_date(Date activity_date) {
		this.activity_date = activity_date;
	}
	public String getActivity_place() {
		return activity_place;
	}
	public void setActivity_place(String activity_place) {
		this.activity_place = activity_place;
	}
	public String getActivity_content() {
		return activity_content;
	}
	public void setActivity_content(String activity_content) {
		this.activity_content = activity_content;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public Integer getApply_state() {
		return apply_state;
	}
	public void setApply_state(Integer apply_state) {
		this.apply_state = apply_state;
	}
	public String getUser_class() {
		return user_class;
	}
	public void setUser_class(String user_class) {
		this.user_class = user_class;
	}
	@Override
	public String toString() {
		return "Activity [id=" + id + ", user_id=" + user_id + ", user_name=" + user_name + ", user_sex=" + user_sex
				+ ", user_class=" + user_class + ", user_head=" + user_head + ", title=" + title + ", type=" + type
				+ ", sex_limit=" + sex_limit + ", people_limit=" + people_limit + ", activity_date=" + activity_date
				+ ", activity_place=" + activity_place + ", activity_content=" + activity_content + ", img=" + img
				+ ", file=" + file + ", qq=" + qq + ", phone=" + phone + ", create_date=" + create_date
				+ ", apply_state=" + apply_state + "]";
	}
	
}

package com.yiban.meet.domain;

import java.io.Serializable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Join implements Serializable {//标识一个类的对象可以被序列化
	private String id;		       //参加编号
	private String activity_id;   //活动编号
	private Activity activity;		//Activity对象
	private String joinuser_id;       //用户编号
	private String join_name;      //用户姓名
	private String join_sex;       //用户性别f-女  m-男
	private String join_class;     //用户专业班级
	private String join_head;      //头像
	private MultipartFile file;	
	private String words; 		//留言
	private String join_qq;         //qq
	private String join_phone;      //联系方式
	private Integer join_state;//参加状态0-未参加（默认）1-申请参加（等待状态） 2-同意 3-拒绝
	private Integer count;			//计数
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	List<Join> joins1;
	
	public List<Join> getJoins1() {
		return joins1;
	}
	public void setJoins1(List<Join> joins1) {
		this.joins1 = joins1;
	}
	public String getWords() {
		return words;
	}
	public void setWords(String words) {
		this.words = words;
	}
	public Activity getActivity() {
		return activity;
	}
	public void setActivity(Activity activity) {
		this.activity = activity;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getActivity_id() {
		return activity_id;
	}
	public void setActivity_id(String activity_id) {
		this.activity_id = activity_id;
	}
	public String getJoinuser_id() {
		return joinuser_id;
	}
	public void setJoinuser_id(String joinuser_id) {
		this.joinuser_id = joinuser_id;
	}
	public String getJoin_name() {
		return join_name;
	}
	public void setJoin_name(String join_name) {
		this.join_name = join_name;
	}
	public String getJoin_sex() {
		return join_sex;
	}
	public void setJoin_sex(String join_sex) {
		this.join_sex = join_sex;
	}
	
	public String getJoin_class() {
		return join_class;
	}
	public void setJoin_class(String join_class) {
		this.join_class = join_class;
	}
	public String getJoin_head() {
		return join_head;
	}
	public void setJoin_head(String join_head) {
		this.join_head = join_head;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getJoin_qq() {
		return join_qq;
	}
	public void setJoin_qq(String join_qq) {
		this.join_qq = join_qq;
	}
	public String getJoin_phone() {
		return join_phone;
	}
	public void setJoin_phone(String join_phone) {
		this.join_phone = join_phone;
	}
	public Integer getJoin_state() {
		return join_state;
	}
	public void setJoin_state(Integer join_state) {
		this.join_state = join_state;
	}
	@Override
	public String toString() {
		return "Join [id=" + id + ", activity_id=" + activity_id + ", activity=" + activity + ", joinuser_id="
				+ joinuser_id + ", join_name=" + join_name + ", join_sex=" + join_sex + ", join_class=" + join_class
				+ ", join_head=" + join_head + ", file=" + file + ", words=" + words + ", join_qq=" + join_qq
				+ ", join_phone=" + join_phone + ", join_state=" + join_state + "]";
	}
	
}

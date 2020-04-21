package com.teaspoon.member.model.vo;

import java.sql.Date;

public class Member {
	private int userNo; 		//회원번호
	private int gradeCode;		//회원등급번호
	private String userId;		//회원아이디
	private String userPwd;		//회원비밀번호
	private String userName;	//회원명
	private String age;			//성별
	private int birthday;		//생년월일
	private String phone;		//전화번호
	private String email;		//이메일
	private Date enrollDate;	//가입일
	private Date modifyDate;	//수정일
	private int point;			//적립금
	private int buyPoint;		//누적구매금액
	private String admin;		//관리자권한
	private String status;		//상태
	private String gradeName;   //등급네임
	
	//1:1 QNA 조회
	private int mtm_no; //1:1상담번호
	private int mtm_type; // 1:1상담 유형
	private String mtm_title; // 1:1상담 제목
	private Date create_date; 
	
	private int w; //위시리스트 갯수 카운트용
	private int c; //쿠폰 갯수 카운트용
	
	public Member(String userName, int birthday, String phone, String userId, String userPwd, String email) {
		super();
		this.userName = userName;
		this.birthday = birthday;
		this.phone = phone;
		this.userId = userId;
		this.userPwd = userPwd;
		this.email = email;

	}
	
	public Member(int userNo, String userName, int point, String gradeName, int w, int c) {
		super();
		this.userNo = userNo;
		this.userName = userName;
		this.point = point;
		this.gradeName = gradeName;
		this.w = w;
		this.c = c;
	}
	

	
	
	public Member(){
		
	}

	
	public Member(int mtm_no,int userNo, int mtm_type, String mtm_title, Date create_date) {
		super();
		this.mtm_no = mtm_no;
		this.userNo = userNo;
		this.mtm_type = mtm_type;
		this.mtm_title = mtm_title;
		this.create_date = create_date;
	}


	


	public Member(int userNo, String userId, String userName, String phone, Date enrollDate, String gradeName,int birthday, String status ) {
	super();
	this.userNo = userNo;
	this.userId = userId;
	this.userName = userName;
	this.phone = phone;
	this.enrollDate = enrollDate;
	this.gradeName = gradeName;
	this.birthday = birthday;
	this.status = status;
}

	public Member(int userNo, int gradeCode, String userId, String userPwd, String userName, String age, int birthday,
			String phone, String email, Date enrollDate, Date modifyDate, int point, int buyPoint, String admin,
			String status) {
		super();
		this.userNo = userNo;
		this.gradeCode = gradeCode;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.age = age;
		this.birthday = birthday;
		this.phone = phone;
		this.email = email;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.point = point;
		this.buyPoint = buyPoint;
		this.admin = admin;
		this.status = status;
	}
	
	
	public int getW() {
		return w;
	}


	public void setW(int w) {
		this.w = w;
	}


	public int getC() {
		return c;
	}


	public void setC(int c) {
		this.c = c;
	}


	public int getMtm_no() {
		return mtm_no;
	}


	public void setMtm_no(int mtm_no) {
		this.mtm_no = mtm_no;
	}

	public int getMtm_type() {
		return mtm_type;
	}


	public void setMtm_type(int mtm_type) {
		this.mtm_type = mtm_type;
	}


	public String getMtm_title() {
		return mtm_title;
	}


	public void setMtm_title(String mtm_title) {
		this.mtm_title = mtm_title;
	}


	public Date getCreate_date() {
		return create_date;
	}


	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public int getGradeCode() {
		return gradeCode;
	}


	public void setGradeCode(int gradeCode) {
		this.gradeCode = gradeCode;
	}


	public String getGradeName() {
		return gradeName;
	}


	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserPwd() {
		return userPwd;
	}


	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getAge() {
		return age;
	}


	public void setAge(String age) {
		this.age = age;
	}


	public int getBirthday() {
		return birthday;
	}


	public void setBirthday(int birthday) {
		this.birthday = birthday;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public Date getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}


	public Date getModifyDate() {
		return modifyDate;
	}


	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}


	public int getPoint() {
		return point;
	}


	public void setPoint(int point) {
		this.point = point;
	}


	public int getBuyPoint() {
		return buyPoint;
	}


	public void setBuyPoint(int buyPoint) {
		this.buyPoint = buyPoint;
	}


	public String getAdmin() {
		return admin;
	}


	public void setAdmin(String admin) {
		this.admin = admin;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", gradeCode=" + gradeCode + ", userId=" + userId + ", userPwd=" + userPwd
				+ ", userName=" + userName + ", age=" + age + ", birthday=" + birthday + ", phone=" + phone + ", email="
				+ email + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate + ", point=" + point
				+ ", buyPoint=" + buyPoint + ", admin=" + admin + ", status=" + status + "]";
	}


	


	
	
}

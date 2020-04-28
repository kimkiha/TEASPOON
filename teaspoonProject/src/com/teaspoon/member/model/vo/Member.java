package com.teaspoon.member.model.vo;

import java.sql.Date;

public class Member {
	private int userNo; 		//회원번호
	private int gradeCode;		//회원등급번호
	private String userId;		//회원아이디
	private String userPwd;		//회원비밀번호
	private String userName;	//회원명
	private String gender;		//성별
	private int birthday;		//생년월일
	private String phone;		//전화번호
	private String email;		//이메일
	private Date enrollDate;	//가입일
	private Date modifyDate;	//수정일
	private int buyPoint;		//누적구매금액
	private String admin;		//관리자권한
	private String status;		//상태
	private String gradeName;   //등급네임
	private String address;		//주소
	private int point;// 포인트
	
	//1:1 QNA 조회
	private int mtm_no; //1:1상담번호
	private String mtm_name; // 1:1상담 유형
	private String mtm_title; // 1:1상담 제목
	private Date create_date;  
	private String re_comment;
	private String answer; 
	// 마이페이지 상단 메뉴바
	private int pcode; //위시리스트 갯수 카운트용
	private int count; //쿠폰 갯수 카운트용
	
	// 마이페이지 카트에 뿌려줄 값
	private int pDetailNo;	// 상품상세코드
	private int pCount;		// 장바구니에 담을 상품수량
	

	public Member(){
		
	}

	public Member(String userName, int birthday, String gender, String phone, String userId, String userPwd, String email) {
		super();
		this.userName = userName;
		this.birthday = birthday;
		this.gender = gender;
		this.phone = phone;
		this.userId = userId;
		this.userPwd = userPwd;
		this.email = email;

	}
	
	
	
	

	
	public Member(int userNo, int gradeCode, String userId, String userPwd, String userName, String gender,
			int birthday, String phone, String email, Date enrollDate, Date modifyDate, int buyPoint, String admin,
			String status, String address, int point, String gradeName) {
		super();
		this.userNo = userNo;
		this.gradeCode = gradeCode;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.gender = gender;
		this.birthday = birthday;
		this.phone = phone;
		this.email = email;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.buyPoint = buyPoint;
		this.admin = admin;
		this.status = status;
		this.gradeName = gradeName;
		this.address = address;
		this.point = point;
	}

	public Member(int userNo, int gradeCode, String userId, String userPwd, String userName, String gender,
			int birthday, String phone, String email, Date enrollDate, Date modifyDate, int buyPoint, String admin,
			String status, String gradeName, String address, int point, int mtm_no, String mtm_name, String mtm_title,
			Date create_date, String re_comment, String answer, int pcode, int count, int pDetailNo, int pCount) {
		super();
		this.userNo = userNo;
		this.gradeCode = gradeCode;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.gender = gender;
		this.birthday = birthday;
		this.phone = phone;
		this.email = email;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.buyPoint = buyPoint;
		this.admin = admin;
		this.status = status;
		this.gradeName = gradeName;
		this.address = address;
		this.point = point;
		this.mtm_no = mtm_no;
		this.mtm_name = mtm_name;
		this.mtm_title = mtm_title;
		this.create_date = create_date;
		this.re_comment = re_comment;
		this.answer = answer;
		this.pcode = pcode;
		this.count = count;
		this.pDetailNo = pDetailNo;
		this.pCount = pCount;
	}

	public Member(int userNo, String userName, String gradeName, int point, int pcode, int count) {
		super();
		this.userNo = userNo;
		this.userName = userName;
		this.gradeName = gradeName;
		this.point = point;
		this.pcode = pcode;
		this.count = count;
	}
	
	public Member( int mtm_no,int userNo, String mtm_name, String mtm_title, Date create_date, String re_comment,
			String answer) {
		super();
		this.userNo = userNo;
		this.mtm_no = mtm_no;
		this.mtm_name = mtm_name;
		this.mtm_title = mtm_title;
		this.create_date = create_date;
		this.re_comment = re_comment;
		this.answer = answer;
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

	public Member(int userNo, int gradeCode, String userId, String userPwd, String userName, String gender, int birthday,
			String phone, String email, Date enrollDate, Date modifyDate, int buyPoint, String admin,
			String status, String address) {
		super();
		this.userNo = userNo;
		this.gradeCode = gradeCode;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.gender = gender;
		this.birthday = birthday;
		this.phone = phone;
		this.email = email;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.buyPoint = buyPoint;
		this.admin = admin;
		this.status = status;
		this.address = address;
	}
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}


	public Member(int userNo, int gradeCode, String userId, String userPwd, String userName, String gender,
			int birthday, String phone, String email, Date enrollDate, Date modifyDate, int buyPoint, String admin,
			String status, String address,int point) {
		super();
		this.userNo = userNo;
		this.gradeCode = gradeCode;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.gender = gender;
		this.birthday = birthday;
		this.phone = phone;
		this.email = email;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.buyPoint = buyPoint;
		this.admin = admin;
		this.status = status;
		this.address = address;
		this.point = point;
		
	}

	public Member(int userNo, int gradeCode, String userId, String userPwd, String userName, String gender,
			int birthday, String phone, String email, Date enrollDate, Date modifyDate, int buyPoint, String admin,
			String status, String gradeName, int mtm_no, String mtm_name, String mtm_title, Date create_date,
			int point, int pcode, int count, int pDetailNo, int pCount) {
		super();
		this.userNo = userNo;
		this.gradeCode = gradeCode;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.gender = gender;
		this.birthday = birthday;
		this.phone = phone;
		this.email = email;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.buyPoint = buyPoint;
		this.admin = admin;
		this.status = status;
		this.gradeName = gradeName;
		this.mtm_no = mtm_no;
		this.mtm_name = mtm_name;
		this.mtm_title = mtm_title;
		this.create_date = create_date;
		this.point = point;
		this.pcode = pcode;
		this.count = count;
		this.pDetailNo = pDetailNo;
		this.pCount = pCount;
	}
	
	

	public String getRe_comment() {
		return re_comment;
	}

	public void setRe_comment(String re_comment) {
		this.re_comment = re_comment;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public int getpDetailNo() {
		return pDetailNo;
	}

	public void setpDetailNo(int pDetailNo) {
		this.pDetailNo = pDetailNo;
	}

	public int getpCount() {
		return pCount;
	}

	public void setpCount(int pCount) {
		this.pCount = pCount;
	}

	

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getPcode() {
		return pcode;
	}


	public void setPcode(int pcode) {
		this.pcode = pcode;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}




	public int getMtm_no() {
		return mtm_no;
	}


	public void setMtm_no(int mtm_no) {
		this.mtm_no = mtm_no;
	}


	public String getMtm_name() {
		return mtm_name;
	}


	public void setMtm_name(String mtm_name) {
		this.mtm_name = mtm_name;
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


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
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
				+ ", userName=" + userName + ", gender=" + gender + ", birthday=" + birthday + ", phone=" + phone
				+ ", email=" + email + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate + ", buyPoint="
				+ buyPoint + ", admin=" + admin + ", status=" + status + ", gradeName=" + gradeName + ", address="
				+ address + ", mtm_no=" + mtm_no + ", mtm_name=" + mtm_name + ", mtm_title=" + mtm_title
				+ ", create_date=" + create_date + ", re_comment=" + re_comment + ", answer=" + answer + ", point="
				+ point + ", pcode=" + pcode + ", count=" + count + ", pDetailNo=" + pDetailNo + ", pCount="
				+ pCount + "]";
	}

	

	
	
	


	


	
	
}

package com.teaspoon.store.model.vo;

import java.sql.Date;

public class Review {

	private int reviewNo;	 //리뷰번호
	private int pcode;		 //상품번호
	private int userNo;		 //회원번호
	private String content;  //내용
	private Date createDate; //작성일
	
	private String userId; 		//회원아이디
	private String userName; 	//회원명
	private String pname;		//상품명
	
	public Review() {}

	public Review(int reviewNo, int pcode, int userNo, String content, Date createDate, String userId, String userName, String pname) {
		super();
		this.reviewNo = reviewNo;
		this.pcode = pcode;
		this.userNo = userNo;
		this.content = content;
		this.createDate = createDate;
		this.userId = userId;
		this.userName = userName;
		this.pname = pname;
	}
	
	
	// 상품 디테일 조회시 사용하는 생성자
	public Review(int reviewNo, String pname, String userName, String userId, Date createDate, String content) {
		super();
		this.reviewNo = reviewNo;
		this.content = content;
		this.createDate = createDate;
		this.userId = userId;
		this.userName = userName;
		this.pname = pname;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getPcode() {
		return pcode;
	}

	public void setPcode(int pcode) {
		this.pcode = pcode;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", pcode=" + pcode + ", userNo=" + userNo + ", content=" + content
				+ ", createDate=" + createDate + ", userId=" + userId + ", userName=" + userName + ", pname=" + pname
				+ "]";
	}


}

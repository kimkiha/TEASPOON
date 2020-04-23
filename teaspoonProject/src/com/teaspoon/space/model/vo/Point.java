package com.teaspoon.space.model.vo;

import java.util.Date;

public class Point {

	private int userNo;          // 회원번호    
	private Date pointDate;      // 적립일
	private String division;     // 구분(1적립 2사용)
	private String content;      // 내용
	private int pointPrice;      // 포인트금액
	private Date demiseDate;     // 소멸예정일
	
	public Point() {
		
	}

	public Point(int userNo, Date pointDate, String division, String content, int pointPrice, Date demiseDate) {
		super();
		this.userNo = userNo;
		this.pointDate = pointDate;
		this.division = division;
		this.content = content;
		this.pointPrice = pointPrice;
		this.demiseDate = demiseDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Date getPointDate() {
		return pointDate;
	}

	public void setPointDate(Date pointDate) {
		this.pointDate = pointDate;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPointPrice() {
		return pointPrice;
	}

	public void setPointPrice(int pointPrice) {
		this.pointPrice = pointPrice;
	}

	public Date getDemiseDate() {
		return demiseDate;
	}

	public void setDemiseDate(Date demiseDate) {
		this.demiseDate = demiseDate;
	}

	@Override
	public String toString() {
		return "Point [userNo=" + userNo + ", pointDate=" + pointDate + ", division=" + division + ", content="
				+ content + ", pointPrice=" + pointPrice + ", demiseDate=" + demiseDate + "]";
	}
	
	
	
}

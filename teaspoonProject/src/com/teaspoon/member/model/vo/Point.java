package com.teaspoon.member.model.vo;

import java.sql.Date;

public class Point {
	
	private int userNo;
	private Date pointDate;
	private int division;
	private String content;
	private int pointPrice;
	private int demiseDate;
	
	public Point() {}

	public Point(int userNo, Date pointDate, int division, String content, int pointPrice, int demiseDate) {
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

	public int getDivision() {
		return division;
	}

	public void setDivision(int division) {
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

	public int getDemiseDate() {
		return demiseDate;
	}

	public void setDemiseDate(int demiseDate) {
		this.demiseDate = demiseDate;
	}

	@Override
	public String toString() {
		return "Point [userNo=" + userNo + ", pointDate=" + pointDate + ", division=" + division + ", content="
				+ content + ", pointPrice=" + pointPrice + ", demiseDate=" + demiseDate + "]";
	}

	
	
	
	
}

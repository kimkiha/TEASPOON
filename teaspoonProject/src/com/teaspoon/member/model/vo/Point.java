package com.teaspoon.member.model.vo;

import java.sql.Date;

public class Point {
	
	
	private Date pointDate;
	private int division;
	private String content;
	private int pointPrice;
	
	public Point() {
		
		
	}

	public Point(Date pointDate, int division, String content, int pointPrice) {
		super();
		this.pointDate = pointDate;
		this.division = division;
		this.content = content;
		this.pointPrice = pointPrice;
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

	@Override
	public String toString() {
		return "Point [pointDate=" + pointDate + ", division=" + division + ", content=" + content + ", pointPrice="
				+ pointPrice + "]";
	}
	
	

}

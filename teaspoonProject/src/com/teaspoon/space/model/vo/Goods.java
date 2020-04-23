package com.teaspoon.space.model.vo;

public class Goods {
	
	private int gsNo;        // 비품번호    
	private String gsName;   // 비품명
	private int gsPrice;     // 비품대여비
	private int gsCount;     // 비품수량
	private int gsUsing;     // 비품사용수
	
	public Goods() {
		
	}

	public Goods(int gsNo, String gsName, int gsPrice, int gsCount, int gsUsing) {
		super();
		this.gsNo = gsNo;
		this.gsName = gsName;
		this.gsPrice = gsPrice;
		this.gsCount = gsCount;
		this.gsUsing = gsUsing;
	}

	public int getGsNo() {
		return gsNo;
	}

	public void setGsNo(int gsNo) {
		this.gsNo = gsNo;
	}

	public String getGsName() {
		return gsName;
	}

	public void setGsName(String gsName) {
		this.gsName = gsName;
	}

	public int getGsPrice() {
		return gsPrice;
	}

	public void setGsPrice(int gsPrice) {
		this.gsPrice = gsPrice;
	}

	public int getGsCount() {
		return gsCount;
	}

	public void setGsCount(int gsCount) {
		this.gsCount = gsCount;
	}

	public int getGsUsing() {
		return gsUsing;
	}

	public void setGsUsing(int gsUsing) {
		this.gsUsing = gsUsing;
	}

	@Override
	public String toString() {
		return "Goods [gsNo=" + gsNo + ", gsName=" + gsName + ", gsPrice=" + gsPrice + ", gsCount=" + gsCount
				+ ", gsUsing=" + gsUsing + "]";
	}
	
	
	
}


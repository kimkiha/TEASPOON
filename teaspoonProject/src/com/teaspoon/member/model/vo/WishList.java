package com.teaspoon.member.model.vo;

import java.sql.Date;

public class WishList {
	
	private int userNo;
	private int pcode;
	private Date wishDate;
	
	// product-Attachmemt(pcode로 조인)
	// product-wishList(pcode로 조인)
	private String titleImg; //해당 상품의 대표이미지 수정명 
	
	
	public WishList(){}
	
	public WishList(int userNo, int pcode, Date wishDate, String titleImg) {
		super();
		this.userNo = userNo;
		this.pcode = pcode;
		this.wishDate = wishDate;
		this.titleImg = titleImg;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getPcode() {
		return pcode;
	}
	public void setPcode(int pcode) {
		this.pcode = pcode;
	}
	public Date getWishDate() {
		return wishDate;
	}
	public void setWishDate(Date wishDate) {
		this.wishDate = wishDate;
	}
	

	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	@Override
	public String toString() {
		return "WishList [userNo=" + userNo + ", pcode=" + pcode + ", wishDate=" + wishDate + "]";
	}
	
	
	
	

}

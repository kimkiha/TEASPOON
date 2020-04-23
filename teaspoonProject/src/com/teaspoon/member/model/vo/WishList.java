package com.teaspoon.member.model.vo;

import java.sql.Date;

public class WishList {
	
	private int userNo;
	private int pcode;
	private Date wishDate;
	
	public WishList(){}
	
	public WishList(int userNo, int pcode, Date wishDate) {
		super();
		this.userNo = userNo;
		this.pcode = pcode;
		this.wishDate = wishDate;
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

	@Override
	public String toString() {
		return "WishList [userNo=" + userNo + ", pcode=" + pcode + ", wishDate=" + wishDate + "]";
	}
	
	
	
	

}

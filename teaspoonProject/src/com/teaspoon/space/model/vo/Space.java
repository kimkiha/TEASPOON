package com.teaspoon.space.model.vo;

import java.sql.Date;

public class Space {

	private int reservNo;          // 예약번호   
	private int userNo;            // 회원번호
	private Date appDate;          // 예약요청날짜
	private String reservDate;     // 대관날짜
	private String reservTime;     // 대관시간
	private int visitNum;          // 인원수
	private String phone;          // 연락처
	private String reservReason;   // 사용목적
	private String accept;         // 승인여부
	private String good;           // 비품
	private int gradeCode;         // 회원등급
	private int total;             // 총금액
	
	private Space() {
		
	}
	
	public Space(int reservNo, int userNo, Date appDate, String reservDate, String reservTime, int visitNum,
			String phone, String reservReason, String accept, String good, int gradeCode, int total) {
		super();
		this.reservNo = reservNo;
		this.userNo = userNo;
		this.appDate = appDate;
		this.reservDate = reservDate;
		this.reservTime = reservTime;
		this.visitNum = visitNum;
		this.phone = phone;
		this.reservReason = reservReason;
		this.accept = accept;
		this.good = good;
		this.gradeCode = gradeCode;
		this.total = total;
	}
	
	
	// 대관예약에 뽑아낼 매개변수
	public Space(int userNo, String reservDate, String reservTime, int visitNum, String phone, String reservReason,
			String good, int gradeCode, int total) {
		super();
		this.userNo = userNo;
		this.reservDate = reservDate;
		this.reservTime = reservTime;
		this.visitNum = visitNum;
		this.phone = phone;
		this.reservReason = reservReason;
		this.good = good;
		this.gradeCode = gradeCode;
		this.total = total;
	}



	public int getReservNo() {
		return reservNo;
	}
	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public void setReservNo(int reservNo) {
		this.reservNo = reservNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public Date getAppDate() {
		return appDate;
	}
	public void setAppDate(Date appDate) {
		this.appDate = appDate;
	}
	public String getReservDate() {
		return reservDate;
	}
	public void setReservDate(String reservDate) {
		this.reservDate = reservDate;
	}
	public String getReservTime() {
		return reservTime;
	}
	public void setReservTime(String reservTime) {
		this.reservTime = reservTime;
	}
	public int getVisitNum() {
		return visitNum;
	}
	public void setVisitNum(int visitNum) {
		this.visitNum = visitNum;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getReservReason() {
		return reservReason;
	}
	public void setReservReason(String reservReason) {
		this.reservReason = reservReason;
	}
	public String getAccept() {
		return accept;
	}
	public void setAccept(String accept) {
		this.accept = accept;
	}
	public String getGood() {
		return good;
	}
	public void setGood(String good) {
		this.good = good;
	}
	public int getGradeCode() {
		return gradeCode;
	}
	public void setGradeCode(int gradeCode) {
		this.gradeCode = gradeCode;
	}

	@Override
	public String toString() {
		return "Space [reservNo=" + reservNo + ", userNo=" + userNo + ", appDate=" + appDate + ", reservDate="
				+ reservDate + ", reservTime=" + reservTime + ", visitNum=" + visitNum + ", phone=" + phone
				+ ", reservReason=" + reservReason + ", accept=" + accept + ", good=" + good + ", gradeCode="
				+ gradeCode + ", total=" + total + "]";
	}
	
	
	
	
	

	
	
	
}

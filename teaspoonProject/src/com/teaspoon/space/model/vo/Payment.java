package com.teaspoon.space.model.vo;

public class Payment {
	
	private int reservNo;     // 예약번호       
	private int goodsPay;     // 비품금액
	private int total;        // 결제금액
	private int reservPay;    // 대관금액
	
	public Payment() {
		
	}

	public Payment(int reservNo, int goodsPay, int total, int reservPay) {
		super();
		this.reservNo = reservNo;
		this.goodsPay = goodsPay;
		this.total = total;
		this.reservPay = reservPay;
	}

	public int getReservNo() {
		return reservNo;
	}

	public void setReservNo(int reservNo) {
		this.reservNo = reservNo;
	}

	public int getGoodsPay() {
		return goodsPay;
	}

	public void setGoodsPay(int goodsPay) {
		this.goodsPay = goodsPay;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getReservPay() {
		return reservPay;
	}

	public void setReservPay(int reservPay) {
		this.reservPay = reservPay;
	}

	@Override
	public String toString() {
		return "Payment [reservNo=" + reservNo + ", goodsPay=" + goodsPay + ", total=" + total + ", reservPay="
				+ reservPay + "]";
	}
	
	
	
}

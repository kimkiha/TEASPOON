package com.teaspoon.member.model.vo;

import java.sql.Date;

public class Orders {

	private int orderNo;			// 주문번호
	private int userNo;				// userNo
	private String orderer;			// userName
	private String ordererPhone;	// userPhone
	private String recipient;		// 수령인
	private String recipientPhone;	// 수령인전화번호
	private String recipientAddress;// 배송지
	private String orderMessage;	// 배송메세지
	private int shippingFee;		// 배송비(2500원고정)
	private int payment;			// 최종결제금액
	private Date orderDate;			// 주문일자
	private int progress;			// 배송상태(배송중-->배송완료)
	private int cart;				// 장바구니번호
	
	public Orders() {}
	
	public Orders(int orderNo, int userNo, String orderer, String ordererPhone,
			String recipient, String recipientPhone, String recipientAddress, String orderMessage, int shippingFee,
			int payment, Date orderDate, int progress, String status, int cart) {
		super();
		this.orderNo = orderNo;	
		this.userNo = userNo;	
		this.orderer = orderer;
		this.ordererPhone = ordererPhone;
		this.recipient = recipient;
		this.recipientPhone = recipientPhone;
		this.recipientAddress = recipientAddress;
		this.orderMessage = orderMessage;
		this.shippingFee = shippingFee;
		this.payment = payment;
		this.orderDate = orderDate;
		this.progress = progress;
		this.cart = cart;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getOrderer() {
		return orderer;
	}
	public void setOrderer(String orderer) {
		this.orderer = orderer;
	}
	public String getOrdererPhone() {
		return ordererPhone;
	}
	public void setOrdererPhone(String ordererPhone) {
		this.ordererPhone = ordererPhone;
	}
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public String getRecipientPhone() {
		return recipientPhone;
	}
	public void setRecipientPhone(String recipientPhone) {
		this.recipientPhone = recipientPhone;
	}
	public String getRecipientAddress() {
		return recipientAddress;
	}
	public void setRecipientAddress(String recipientAddress) {
		this.recipientAddress = recipientAddress;
	}
	public String getOrderMessage() {
		return orderMessage;
	}
	public void setOrderMessage(String orderMessage) {
		this.orderMessage = orderMessage;
	}
	public int getShippingFee() {
		return shippingFee;
	}
	public void setShippingFee(int shippingFee) {
		this.shippingFee = shippingFee;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public int getProgress() {
		return progress;
	}
	public void setProgress(int progress) {
		this.progress = progress;
	}
	public int getCart() {
		return cart;
	}
	public void setCart(int cart) {
		this.cart = cart;
	}
	@Override
	public String toString() {
		return "Orders [orderNo=" + orderNo + ", userNo=" + userNo + ", orderer="
				+ orderer + ", ordererPhone=" + ordererPhone +  ", recipient="
				+ recipient + ", recipientPhone=" + recipientPhone + ", recipientAddress=" + recipientAddress
				+ ", orderMessage=" + orderMessage + ", shippingFee=" + shippingFee + ", payment="
				+ payment + ", orderDate=" + orderDate + ", progress=" + progress + ", cart="
				+ cart + "]";
	}
	
	
	
}

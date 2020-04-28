package com.teaspoon.member.model.vo;

import java.sql.Date;

public class Orders {

	private int orderNo;
	private int userNo;
	private String orderer;
	private String ordererPhone;
	private String recipient;
	private String recipientPhone;
	private String recipientAddress;
	private String orderMessage;
	private int shippingFee;
	private int payment;
	private Date orderDate;
	private int prograss;
	private String status;
	private int cart;
	
	public Orders() {}
	
	public Orders(int orderNo, int userNo, String orderer, String ordererPhone,
			String recipient, String recipientPhone, String recipientAddress, String orderMessage, int shippingFee,
			int payment, Date orderDate, int prograss, String status, int cart) {
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
		this.prograss = prograss;
		this.status = status;
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
	public int getPrograss() {
		return prograss;
	}
	public void setPrograss(int prograss) {
		this.prograss = prograss;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
				+ payment + ", orderDate=" + orderDate + ", prograss=" + prograss + ", status=" + status + ", cart="
				+ cart + "]";
	}
	
	
	
}

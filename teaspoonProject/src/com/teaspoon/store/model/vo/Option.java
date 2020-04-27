package com.teaspoon.store.model.vo;

public class Option {
	private int optionCode; //옵션코드
	private int addPrice; 	//추가가격
	private String optionType1; //옵션 그램
	private String optionType2; //옵션 원두 그라인더
	
	public Option(int optionCode, int addPrice, String optionType1, String optionType2) {
		super();
		this.optionCode = optionCode;
		this.addPrice = addPrice;
		this.optionType1 = optionType1;
		this.optionType2 = optionType2;
	}
	public int getOptionCode() {
		return optionCode;
	}
	public void setOptionCode(int optionCode) {
		this.optionCode = optionCode;
	}
	public int getAddPrice() {
		return addPrice;
	}
	public void setAddPrice(int addPrice) {
		this.addPrice = addPrice;
	}
	public String getOptionType1() {
		return optionType1;
	}
	public void setOptionType1(String optionType1) {
		this.optionType1 = optionType1;
	}
	public String getOptionType2() {
		return optionType2;
	}
	public void setOptionType2(String optionType2) {
		this.optionType2 = optionType2;
	}
	@Override
	public String toString() {
		return "OptionCode [optionCode=" + optionCode + ", addPrice=" + addPrice + ", optionType1=" + optionType1
				+ ", optionType2=" + optionType2 + "]";
	}
	
}

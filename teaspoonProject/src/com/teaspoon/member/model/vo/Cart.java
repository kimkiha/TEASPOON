package com.teaspoon.member.model.vo;

import java.sql.Date;

public class Cart {
	
	private int cart;	//카트번호(userNo)
	private Date madeDate; // 카트생성날짜
	
	private int pcode;		//상품코드
	private int optionCode;	//상품옵션코드
	private int pDetailNo;	//상품상세코드
	private int amount;		//수량
	private int addPrice;	//추가금액
	private String optionType1;//옵션타입1
	private String optionType2;//옵션타입2
	private String pname;	//상품이름
	private int supPrice;	//공급가
	private int price;		//판매가
	private int stock;		//재고
	private String status;	//상태
	private String keyword;	//키워드
	private int totalCount;	//판매총수량
	private String kind;	//커피/아이템
	private String pcontent;//
	
	private String changeName; // 썸네일
	
	public Cart() {}
	
	public Cart(int cart, Date madeDate, int pcode, int optionCode, int pDetailNo, int amount, int addPrice,
			String optionType1, String optionType2, String pname, int supPrice, int price, int stock, String status,
			String keyword, int totalCount, String kind, String pcontent) {
		super();
		this.cart = cart;
		this.madeDate = madeDate;
		this.pcode = pcode;
		this.optionCode = optionCode;
		this.pDetailNo = pDetailNo;
		this.amount = amount;
		this.addPrice = addPrice;
		this.optionType1 = optionType1;
		this.optionType2 = optionType2;
		this.pname = pname;
		this.supPrice = supPrice;
		this.price = price;
		this.stock = stock;
		this.status = status;
		this.keyword = keyword;
		this.totalCount = totalCount;
		this.kind = kind;
		this.pcontent = pcontent;
		
	}
	
	public Cart(int cart, Date madeDate, int pcode, int optionCode, int pDetailNo, int amount, int addPrice,
			String optionType1, String optionType2, String pname, int supPrice, int price, int stock, String status,
			String keyword, int totalCount, String kind, String pcontent,String changeName) {
		super();
		this.cart = cart;
		this.madeDate = madeDate;
		this.pcode = pcode;
		this.optionCode = optionCode;
		this.pDetailNo = pDetailNo;
		this.amount = amount;
		this.addPrice = addPrice;
		this.optionType1 = optionType1;
		this.optionType2 = optionType2;
		this.pname = pname;
		this.supPrice = supPrice;
		this.price = price;
		this.stock = stock;
		this.status = status;
		this.keyword = keyword;
		this.totalCount = totalCount;
		this.kind = kind;
		this.pcontent = pcontent;
		this.changeName = changeName;
	}

	
	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public int getCart() {
		return cart;
	}

	public void setCart(int cart) {
		this.cart = cart;
	}

	public Date getMadeDate() {
		return madeDate;
	}

	public void setMadeDate(Date madeDate) {
		this.madeDate = madeDate;
	}

	public int getPcode() {
		return pcode;
	}

	public void setPcode(int pcode) {
		this.pcode = pcode;
	}

	public int getOptionCode() {
		return optionCode;
	}

	public void setOptionCode(int optionCode) {
		this.optionCode = optionCode;
	}

	public int getpDetailNo() {
		return pDetailNo;
	}

	public void setpDetailNo(int pDetailNo) {
		this.pDetailNo = pDetailNo;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
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

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getSupPrice() {
		return supPrice;
	}

	public void setSupPrice(int supPrice) {
		this.supPrice = supPrice;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getPcontent() {
		return pcontent;
	}

	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}

	@Override
	public String toString() {
		return "Cart [cart=" + cart + ", madeDate=" + madeDate + ", pcode=" + pcode + ", optionCode=" + optionCode
				+ ", pDetailNo=" + pDetailNo + ", amount=" + amount + ", addPrice=" + addPrice + ", optionType1="
				+ optionType1 + ", optionType2=" + optionType2 + ", pname=" + pname + ", supPrice=" + supPrice
				+ ", price=" + price + ", stock=" + stock + ", status=" + status + ", keyword=" + keyword
				+ ", totalCount=" + totalCount + ", kind=" + kind + ", pcontent=" + pcontent + "]";
	}
	
	
	
	
	

}

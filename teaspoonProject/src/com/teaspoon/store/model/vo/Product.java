package com.teaspoon.store.model.vo;

public class Product {

	private int pcode;		// 상품번호
	private String pname;	// 상품명	
	private int supPrice;	// 공급가
	private int price;		// 가격
	private int stock;		// 재고
	private String status;	// 진열상태(Y/N)
	private String keyword;	// 키워드(검색 및 상품설명)
	private int totalCount;	// 누적판매개수
	private String kind;	// 상품종류(C:커피,I:아이템)
	private String pcontent;// 상품상세설명(사진은 attachment와 조인)
	
	private String titleImg; // 해당 상품의 대표이미지 수정명 
	
	public Product(){}
	
	// 전체 컬럼 생성자
	public Product(int pcode, String pname, int supPrice, int price, int stock, String status, String keyword,
			int totalCount, String kind, String pcontent) {
		super();
		this.pcode = pcode;
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

	// 상품 insert시 사용할 생성자
	public Product(String pname, int supPrice, int price, int stock, String keyword,
			String kind, String pcontent) {
		super();
		this.pname = pname;
		this.supPrice = supPrice;
		this.price = price;
		this.stock = stock;
		this.keyword = keyword;
		this.kind = kind;
		this.pcontent = pcontent;
	}

	public int getPcode() {
		return pcode;
	}

	public void setPcode(int pcode) {
		this.pcode = pcode;
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
	public String getTitleImg() {
		return titleImg;
	}


	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	@Override
	public String toString() {
		return "Store [pcode=" + pcode + ", pname=" + pname + ", supPrice=" + supPrice + ", price=" + price + ", stock="
				+ stock + ", status=" + status + ", keyword=" + keyword + ", totalCount=" + totalCount + ", kind="
				+ kind + ", pcontent=" + pcontent +", titleImg=" + titleImg + "]";
	}


}

package com.teaspoon.board.model.vo;

import java.sql.Date;

public class Board {
	
	private int boardNo;
	private int boardCategory;
	private String boardTitle;
	private String boardContent;
	private int count;
	private Date createDate;
	private Date modifyDate;
	private	String status;
	private String changeName;


	public Board(){
		
	}
	

	public Board(int boardNo, String boardTitle, String boardContent) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
	}


	public Board(String boardTitle, String boardContent) {
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		
	}
	

	public Board(int boardNo, String boardTitle, int count, Date createDate,
			Date modifyDate, String status) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.count = count;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}

	public Board(int boardNo, int boardCategory, String boardTitle, String boardContent, int count, Date createDate,
			Date modifyDate, String status, String changeName) {
		super();
		this.boardNo = boardNo;
		this.boardCategory = boardCategory;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.count = count;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.changeName = changeName;
	}
	
	

	public String getChangeName() {
		return changeName;
	}


	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}


	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	public int getBoardCategory() {
		return boardCategory;
	}


	public void setBoardCategory(int boardCategory) {
		this.boardCategory = boardCategory;
	}


	public String getBoardTitle() {
		return boardTitle;
	}


	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}


	public String getBoardContent() {
		return boardContent;
	}


	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public Date getModifyDate() {
		return modifyDate;
	}


	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardCategory=" + boardCategory + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", count=" + count + ", createDate=" + createDate + ", modifyDate="
				+ modifyDate + ", status=" + status + ", changeName=" + changeName + ", getBoardNo()=" + getBoardNo()
				+ ", getBoardCategory()=" + getBoardCategory() + ", getBoardTitle()=" + getBoardTitle()
				+ ", getBoardContent()=" + getBoardContent() + ", getCount()=" + getCount() + ", getCreateDate()="
				+ getCreateDate() + ", getModifyDate()=" + getModifyDate() + ", getStatus()=" + getStatus()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}


	
	
	
	

}
package com.teaspoon.member.model.vo;

import java.sql.Date;

public class MenToMen {
	private int mtmNo;
	private int userNo;
	private int mtmType;
	private String mtmTitle;
	private String mtmContent;
	private Date createDate;
	private String reComment;
	private Date commentDate;
	private String answer;
	private String status;
	
	//mtm 상세 조회용
	private String mtmName;
	private String userId;
	
	
	public MenToMen() {
		
	}

	public MenToMen(int mtmNo, int userNo, int mtmType, String mtmTitle, String mtmContent, Date createDate,
			String reComment, Date commentDate, String answer, String status) {
		super();
		this.mtmNo = mtmNo;
		this.userNo = userNo;
		this.mtmType = mtmType;
		this.mtmTitle = mtmTitle;
		this.mtmContent = mtmContent;
		this.createDate = createDate;
		this.reComment = reComment;
		this.commentDate = commentDate;
		this.answer = answer;
		this.status = status;
	}
	
	public MenToMen(int mtmNo,String mtmName,  String mtmTitle,String userId, Date createDate,String mtmContent  ) {
		super();
		this.mtmNo = mtmNo;
		this.mtmTitle = mtmTitle;
		this.mtmContent = mtmContent;
		this.createDate = createDate;
		this.mtmName = mtmName;
		this.userId = userId;
	}

	public int getMtmNo() {
		return mtmNo;
	}

	public void setMtmNo(int mtmNo) {
		this.mtmNo = mtmNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getMtmType() {
		return mtmType;
	}

	public void setMtmType(int mtmType) {
		this.mtmType = mtmType;
	}

	public String getMtmTitle() {
		return mtmTitle;
	}

	public void setMtmTitle(String mtmTitle) {
		this.mtmTitle = mtmTitle;
	}

	public String getMtmContent() {
		return mtmContent;
	}

	public void setMtmContent(String mtmContent) {
		this.mtmContent = mtmContent;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getReComment() {
		return reComment;
	}

	public void setReComment(String reComment) {
		this.reComment = reComment;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getMtmName() {
		return mtmName;
	}

	public void setMtmName(String mtmName) {
		this.mtmName = mtmName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "MenToMen [mtmNo=" + mtmNo + ", userNo=" + userNo + ", mtmType=" + mtmType + ", mtmTitle=" + mtmTitle
				+ ", mtmContent=" + mtmContent + ", createDate=" + createDate + ", reComment=" + reComment
				+ ", commentDate=" + commentDate + ", answer=" + answer + ", status=" + status + "]";
	}

	
	
	


}

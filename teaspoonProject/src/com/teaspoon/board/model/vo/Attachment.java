package com.teaspoon.board.model.vo;

import java.sql.Date;

public class Attachment {
	
	//vo는 테이블과 매칭하고 필요할 경우 추가적으로 작성
	
	private int fileNo;		 	// 파일 고유번호
	private int refBoardNo; 	// 참조하고있는 게시글 번호
	private String originName; 	// 파일 원본명
	private String changeName; 	// 파일 수정명(실제 업로드된 파일명)
	private String filePath;	// 파일이 저장된 폴더 경로
	private Date uploadDate; 	// 파일 업로드일
	private int fileLevel;		// 파일 레벨(0:타이틀/1:내용)
	private String status;		// 상태값
	private String boardLevel;	// 게시판 레벨 (10~80까지)
	
	public Attachment() {}

	public Attachment(int fileNo, int refBoardNo, String originName, String chageName, String filePath, Date uploadDate,
			int fileLevel, String status, String boardLevel) {
		super();
		this.fileNo = fileNo;
		this.refBoardNo = refBoardNo;
		this.originName = originName;
		this.changeName = chageName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.fileLevel = fileLevel;
		this.status = status;
		this.boardLevel = boardLevel;
	}


	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getRefBoardNo() {
		return refBoardNo;
	}

	public void setRefBoardNo(int refBoardNo) {
		this.refBoardNo = refBoardNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String chageName) {
		this.changeName = chageName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getBoardLevel() {
		return boardLevel;
	}

	public void setBoardLevel(String boardLevel) {
		this.boardLevel = boardLevel;
	}

	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", refBoardNo=" + refBoardNo + ", originName=" + originName
				+ ", chageName=" + changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", fileLevel="
				+ fileLevel + ", status=" + status + "]";
	}

	
}

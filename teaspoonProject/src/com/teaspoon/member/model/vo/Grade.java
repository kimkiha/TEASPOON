package com.teaspoon.member.model.vo;

public class Grade {
	private int gradeCode;    //등급코드
	private String gradeName; //등급명
	private int minAcount;	  //등급구간최소금액
	private int gradeRate;	  //등급할인률
	
	public Grade() {
		
	}
	

	public Grade(int gradeCode, String gradeName, int minAcount, int gradeRate) {
		super();
		this.gradeCode = gradeCode;
		this.gradeName = gradeName;
		this.minAcount = minAcount;
		this.gradeRate = gradeRate;
	}
	





	public int getGradeCode() {
		return gradeCode;
	}
	public void setGradeCode(int gradeCode) {
		this.gradeCode = gradeCode;
	}
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	public int getMinAcount() {
		return minAcount;
	}
	public void setMinAcount(int minAcount) {
		this.minAcount = minAcount;
	}
	public int getGradeRate() {
		return gradeRate;
	}
	public void setGradeRate(int gradeRate) {
		this.gradeRate = gradeRate;
	}
	@Override
	public String toString() {
		return "Grade [gradeCode=" + gradeCode + ", gradeName=" + gradeName + ", minAcount=" + minAcount
				+ ", gradeRate=" + gradeRate + "]";
	}
	
}

package com.board.domain;

public class tags_BoardVO {
	
	/*
		CREATE TABLE tags_board(
		NO INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
		tags VARCHAR(20) NOT NULL
		);
	*/
	
	private int NO;
	private String tags;
	
	public int getNO() {
		return NO;
	}
	public void setNO(int NO) {
		this.NO = NO;
	}
	public String gettags() {
		return tags;
	}
	public void settags(String tags) {
		this.tags = tags;
	}	
}

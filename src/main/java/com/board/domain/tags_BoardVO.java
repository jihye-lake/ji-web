package com.board.domain;

import java.util.List;

public class tags_BoardVO {
	
	/*
		CREATE TABLE tags_board(
		NO INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
		tags VARCHAR(20) NOT NULL
		);
	*/
	
	private int NO;
	private String tags;
	private List<tags_BoardVO> tags1;
	
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
	public List<tags_BoardVO> gettags1() {
		return tags1;
	}
	public void settags1(List<tags_BoardVO> tags1) {
		this.tags1 = tags1;
	}	
}

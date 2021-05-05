package com.board.domain;

import java.util.Date;

public class MBoardVO {
	
	/* MsSql
	 boardCREATE TABLE `img_board` (
		`m_bno` INT(11) NOT NULL AUTO_INCREMENT,
		`m_title` VARCHAR(50) NOT NULL,
		`m_content` MEDIUMTEXT NOT NULL,
		`m_writer` VARCHAR(30) NOT NULL,
		`regDate` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
		`viewCnt` INT(11) NULL DEFAULT '0',
		PRIMARY KEY (`m_bno`)
	)charset = UTF8;
	 */
	
	private int m_bno;
	private String m_title;
	private String m_content;
	private String m_writer;
	private Date regDate;
	private int viewCnt;
	
	public int getM_bno() {
		return m_bno;
	}
	public void setM_bno(int m_bno) {
		this.m_bno = m_bno;
	}
	public String getM_title() {
		return m_title;
	}
	public void setM_title(String m_title) {
		this.m_title = m_title;
	}
	public String getM_content() {
		return m_content;
	}
	public void setM_content(String m_content) {
		this.m_content = m_content;
	}
	public String getM_writer() {
		return m_writer;
	}
	public void setM_writer(String m_writer) {
		this.m_writer = m_writer;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}	

}

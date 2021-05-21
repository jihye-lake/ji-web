package com.board.domain;

public class MemberVO {
	
	private String member_id;
	private String member_pwd;
	private String member_tags;
	private String tags;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_tags() {
		return member_tags;
	}
	public void setMember_tags(String member_tags) {
		this.member_tags = member_tags;
	}
	public String gettags() {
		return tags;
	}
	public void settags(String tags) {
		this.tags = tags;
	}
	
}

package com.board.dao;

import javax.servlet.http.HttpSession;

import com.board.domain.MemberVO;

public interface MemberDAO {
	
	// 회원가입
	public void signUp(MemberVO mvo) throws Exception;
	
	//로그인 체크
	public MemberVO loginCheck(MemberVO mvo) throws Exception;
	
	// 로그아웃
	public void logout(HttpSession session) throws Exception;

	// 아이디 중복체크
	public int idChk(MemberVO mvo) throws Exception;


}

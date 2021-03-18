package com.board.service;

import javax.servlet.http.HttpSession;

import com.board.domain.MemberVO;

public interface MemberService {
	
	// 회원가입
	public void signUp(MemberVO mvo) throws Exception;
	
	// 로그인 체크
	/* public boolean loginCheck(MemberVO mvo, HttpSession session); */
	public MemberVO loginCheck(MemberVO mvo) throws Exception;
	
	// 로그아웃
	public void logout(HttpSession session) throws Exception;

}

package com.board.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.board.domain.MemberVO;
import com.board.domain.tags_BoardVO;

public interface MemberDAO {
	
	// 회원가입
	public void signUp(MemberVO mvo) throws Exception;
	
	// 로그아웃
	public void logout(HttpSession session) throws Exception;

	// 아이디 중복체크
	public int idChk(MemberVO mvo) throws Exception;

	// 로그인시 아이디&비번체크
	public int IdPwChk(MemberVO mvo) throws Exception;

	// 로그인
	public MemberVO login(MemberVO mvo) throws Exception;

	// 태그 목록
	public List<tags_BoardVO> taglist() throws Exception;

	// 회원가입_태그추가
	public void signUp_tags(tags_BoardVO tvo) throws Exception;
	

}

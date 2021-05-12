package com.board.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.dao.MemberDAO;
import com.board.domain.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO dao;
	
	// 회원가입
	@Override
	public void signUp(MemberVO mvo) throws Exception {
		dao.signUp(mvo);
	}	

	// 로그인
	@Override
	public MemberVO loginCheck(MemberVO mvo) throws Exception {		
		return dao.loginCheck(mvo);
	}

	// 로그아웃
	@Override
	public void logout(HttpSession session) throws Exception {
		dao.logout(session);
		
	}

	// 아이디 중복체크
	@Override
	public int idChk(MemberVO mvo) throws Exception {		
		return dao.idChk(mvo);
	}
}

package com.board.service;

import java.util.List;

import com.board.domain.MemberVO;

public interface AdminService {

	// 회원리스트
	public List<MemberVO> mlist() throws Exception;

}

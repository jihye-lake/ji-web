package com.board.dao;

import java.util.List;

import com.board.domain.MemberVO;

public interface AdminDAO {
	
	// 게시물 목록
	public List<MemberVO> mlist() throws Exception;

}

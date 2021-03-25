package com.board.dao;

import java.util.List;

import com.board.domain.MBoardVO;

public interface MBoardDAO {
	
	// 게시물 목록
	public List<MBoardVO> list() throws Exception;

}

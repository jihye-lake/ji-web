package com.board.service;

import java.util.List;

import com.board.domain.MBoardVO;

public interface MBoardService {
	
	// 게시물 목록
	public List<MBoardVO> list() throws Exception;

	// 게시물 작성
	public void write(MBoardVO vo) throws Exception;

}

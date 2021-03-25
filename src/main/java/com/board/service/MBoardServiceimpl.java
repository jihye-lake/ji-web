package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.MBoardDAO;
import com.board.domain.MBoardVO;

@Service
public class MBoardServiceimpl implements MBoardService {
	
	@Inject
	private MBoardDAO mdao;

	// 게시물 목록
	@Override
	public List<MBoardVO> list() throws Exception {
		return mdao.list();
	}
	

}

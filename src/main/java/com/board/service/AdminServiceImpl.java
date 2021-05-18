package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.AdminDAO;
import com.board.domain.MemberVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO dao;
	
	// 게시물 목록
	@Override
	public List<MemberVO> mlist() throws Exception {
		return dao.mlist();
	}

}


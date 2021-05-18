package com.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.MemberVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.board.mappers.admin";

	// 게시물 목록
	@Override
	public List<MemberVO> mlist() throws Exception {		
		return sql.selectList(namespace + ".mlist");
	}

}

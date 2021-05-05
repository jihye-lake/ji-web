package com.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.MBoardVO;

@Repository
public class MBoardDAOimpl implements MBoardDAO {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.board.mappers.mboard";

	// 게시물 목록
	@Override
	public List<MBoardVO> list() throws Exception {
		return sql.selectList(namespace + ".list");
	}

	// 게시물 작성
	@Override
	public void write(MBoardVO vo) throws Exception {
		sql.insert(namespace + ".write", vo);
		
	}
	
	

}

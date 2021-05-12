package com.board.service;

import java.util.List;

import com.board.domain.BoardVO;
import com.board.domain.MemberVO;

public interface BoardService {

	// 게시물 목록
	public List<BoardVO> list() throws Exception;
	
	// 게시물 작성
	public void write(BoardVO vo) throws Exception;
	
	// 게시물 조회
	public BoardVO view(int bno) throws Exception;
	
	// 게시물 수정
	public void modify(BoardVO vo) throws Exception;
	
	// 게시물 삭제
	public void delete(int bno) throws Exception;
	
	// 게시물 총 개수
	public int count() throws Exception;
	
	// 게시물 목록 + 페이징
	public List<BoardVO> listPage(int displayPost, int postNum) throws Exception;

	// 로그인시 아이디&비번체크
	public int IdPwChk(MemberVO mvo) throws Exception;


	// 로그인
	public MemberVO login(MemberVO mvo) throws Exception;	
}

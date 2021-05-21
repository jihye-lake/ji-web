package com.board.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.domain.MemberVO;
import com.board.domain.tags_BoardVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSession sql;
	
	// 매퍼
	private static String namespace = "com.board.mappers.memberMapper";
	
	// 회원가입
	@Override
	public void signUp(MemberVO mvo) throws Exception {
		sql.insert(namespace + ".signUp", mvo);
	}
	
	// 로그아웃
	@Override
	public void logout(HttpSession session) throws Exception {
		session.invalidate();
	}

	// 아이디 중복체크
	@Override
	public int idChk(MemberVO mvo) throws Exception {
		return sql.selectOne(namespace + ".idChk", mvo);
	}
	

	// 로그인시 아이디&비번체크	
	@Override
	public int IdPwChk(MemberVO mvo) throws Exception {
		return sql.selectOne(namespace + ".IdPwChk", mvo);
	}


	// 로그인
	@Override
	public MemberVO login(MemberVO mvo) throws Exception {
		return sql.selectOne(namespace + ".login", mvo);
		
		/* String name = sqlSession.selectOne("memberMapper.loginCheck", mvo); */
		
		// 검색이 안 되면 0을 반환해주기 때문에 0과 비교해서 참이면 false, 틀리면 true 를 반환
		/* return (Integer.parseInt(name)==0)?false:true; */
	}
	
	// 태그 목록
	public List<tags_BoardVO> taglist() throws Exception {
		return sql.selectList(namespace + ".taglist");
	}

	// 회원가입_태그추가
	public void signUp_tags(tags_BoardVO tvo) throws Exception {
		sql.insert(namespace + ".signUp_tags", tvo);
		
	}


}

package com.board.dao;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSession sql;
	
	// 매퍼
	private static String namespace = "com.board.mappers.memberMapper";
	
	// 회원가입
	@Override
	public void signUp(MemberVO mvo) throws Exception {
		sql.insert(namespace + ".login", mvo);
	}
	
	// 로그인
	@Override
	public MemberVO loginCheck(MemberVO mvo) throws Exception {
		
		return sql.selectOne(namespace + ".loginCheck", mvo);
		
		/* String name = sqlSession.selectOne("memberMapper.loginCheck", mvo); */
		
		// 검색이 안 되면 0을 반환해주기 때문에 0과 비교해서 참이면 false, 틀리면 true 를 반환
		/* return (Integer.parseInt(name)==0)?false:true; */
	}

	// 로그아웃
	@Override
	public void logout(HttpSession session) throws Exception {
		session.invalidate();		
	}

}

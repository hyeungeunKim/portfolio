package kr.co.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSession session;
	private final String NAMESPACE="kr.co.mapper.MemberMapper";
	
	@Override
	public void member_join(MemberVO member_vo) throws Exception {
		session.insert(NAMESPACE+".member_join", member_vo);
	}

	@Override
	public MemberVO member_login(MemberVO member_vo) throws Exception {
		return session.selectOne(NAMESPACE+".member_login", member_vo);
	}

	@Override
	public MemberVO member_select(MemberVO member_vo) throws Exception {
		return session.selectOne(NAMESPACE+".member_select", member_vo);
	}

	@Override
	public List<MemberVO> member_tab_list(int cno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".member_tab_list", cno);
	}
	
	
}

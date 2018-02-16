package kr.co.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.ChattingVO;

@Repository
public class ChattingDAOImple implements ChattingDAO{

private final String NAMESPACE = "kr.co.mapper.ChattingMapper";
	
	@Inject
	private SqlSession session;
	
	@Override
	public void insert_msg(ChattingVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(NAMESPACE+".insert_msg", vo);
	}

	@Override
	public List<ChattingVO> msg_list(int cno) throws Exception {
		// TODO Auto-generated method stub
		
		return session.selectList(NAMESPACE+".msg_list", cno);
	}

	@Override
	public List<String> msg_member(int cno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".msg_member", cno);
	}

}

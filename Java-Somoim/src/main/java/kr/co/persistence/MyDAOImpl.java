package kr.co.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;

@Repository
public class MyDAOImpl implements MyDAO {

	private final String NAMESPACE = "kr.co.mapper.MyMapper";

	@Inject
	private SqlSession session;
	
	@Override
	public List<CrewVO> crew_sel_list(Criteria cri, String mid) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".crew_sel_list", mid);
	}

	@Override
	public List<CrewVO> attend_crew_list(String mid) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".attend_crew_list", mid);
	}

}

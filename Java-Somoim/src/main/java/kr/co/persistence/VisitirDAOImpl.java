package kr.co.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class VisitirDAOImpl implements Visitor {
	
	@Inject
	private SqlSession session;
	private final String NAMESPACE="kr.co.mapper.MemberMapper";
	
	@Override
	public int visitday_check(String date) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE+".visitday_check", date);
	}

	@Override
	public void insert_visit() throws Exception {
		// TODO Auto-generated method stub
		session.insert(NAMESPACE+".insert_visit");

	}

	@Override
	public void update_visit(String date) throws Exception {
		// TODO Auto-generated method stub
		session.update(NAMESPACE+".update_visit", date);

	}

}

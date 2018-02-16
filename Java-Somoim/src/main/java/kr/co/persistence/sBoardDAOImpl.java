package kr.co.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.sBoardVO;

@Repository
public class sBoardDAOImpl implements sBoardDAO {
	
	@Inject
	private SqlSession session;
	private final String NAMESPACE="kr.co.mappers.sBoardMapper";


	@Override
	public void sboard_create(sBoardVO sboard_vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(NAMESPACE+".sboard_create", sboard_vo);
	}

	@Override
	public List<sBoardVO> sboard_list(int cno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".sboard_list", cno);
	}

	@Override
	public void sboard_update(sBoardVO sboard_vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(NAMESPACE+".sboard_update", sboard_vo);
	}

	@Override
	public void sboard_delete(int sb_no) throws Exception {
		// TODO Auto-generated method stub
		session.delete(NAMESPACE+".sboard_delete", sb_no);
	}

	@Override
	public sBoardVO sboard_detail(int sb_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE+".sboard_detail", sb_no);
	}

	@Override
	public String sboard_detail_picture(int sb_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE+".sboard_detail_picture", sb_no);
	}

	@Override
	public String sboard_member_name(int sb_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE+".sboard_member_name", sb_no);
	}

}

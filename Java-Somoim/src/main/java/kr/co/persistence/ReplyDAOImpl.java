package kr.co.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Inject
	private SqlSession session;
	private final String NAMESPACE="kr.co.mappers.ReplyMapper";



	@Override
	public void reply_create_sgallery(ReplyVO reply_vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(NAMESPACE+".reply_create_sgallery", reply_vo);
	}
	

	@Override
	public void reply_create_sboard(ReplyVO reply_vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(NAMESPACE+".reply_create_sboard", reply_vo);
	}



	@Override
	public List<ReplyVO> reply_list_sgallery(int sg_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".reply_list_sgallery", sg_no);
	}
		
	@Override
	public List<ReplyVO> reply_list_sboard(int sb_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".reply_list_sboard", sb_no);
	}

	@Override
	public void reply_update(ReplyVO reply_vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(NAMESPACE+".reply_update", reply_vo);
	}

	@Override
	public void reply_delete(int re_no) throws Exception {
		// TODO Auto-generated method stub
		session.delete(NAMESPACE+".reply_delete", re_no);
	}

}

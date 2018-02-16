package kr.co.persistence;

import java.util.List;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.sGalleryVO;

@Repository
public class sGalleryDAOImpl implements sGalleryDAO {
	
	@Inject
	private SqlSession session;
	private final String NAMESPACE="kr.co.mappers.sGalleryMapper";

	@Override
	public void sgallery_create(sGalleryVO sgallery_vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(NAMESPACE+".sgallery_create", sgallery_vo);
	}

	@Override
	public List<sGalleryVO> sgallery_list(int cno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".sgallery_list", cno);
	}

	@Override
	public void sgallery_delete(int sg_no) throws Exception {
		// TODO Auto-generated method stub
		session.delete(NAMESPACE+".sgallery_delete", sg_no);
	}

	@Override
	public sGalleryVO sgallery_detail(int sg_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE+".sgallery_detail", sg_no);
	}

	@Override
	public String sgallery_member_name(int sg_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE+".sgallery_member_name", sg_no);
	}

}

package kr.co.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.co.domain.MemberVO;
import kr.co.domain.sGalleryVO;
import kr.co.persistence.sGalleryDAO;

@Service
public class sGalleryServiceImpl implements sGalleryService {

	@Inject
	sGalleryDAO sgallery_dao;
	
	@Override
	public void sgallery_create(sGalleryVO sgallery_vo) throws Exception {
		// TODO Auto-generated method stub
		sgallery_dao.sgallery_create(sgallery_vo);
	}

	@Override
	public List<sGalleryVO> sgallery_list(int cno) throws Exception {
		// TODO Auto-generated method stub
		return sgallery_dao.sgallery_list(cno);
	}

	@Override
	public void sgallery_delete(int sg_no) throws Exception {
		// TODO Auto-generated method stub
		sgallery_dao.sgallery_delete(sg_no);
		
	}

	@Override
	public sGalleryVO sgallery_detail(int sg_no) throws Exception {
		// TODO Auto-generated method stub
		return sgallery_dao.sgallery_detail(sg_no);
	}
	
	@Override
	public String sgallery_member_name(int sg_no) throws Exception {
		// TODO Auto-generated method stub
		return sgallery_dao.sgallery_member_name(sg_no);
	}

}

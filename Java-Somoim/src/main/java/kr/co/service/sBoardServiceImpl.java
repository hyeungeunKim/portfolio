package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.sBoardVO;
import kr.co.persistence.sBoardDAO;

@Service
public class sBoardServiceImpl implements sBoardService {

	@Inject
	sBoardDAO sboard_dao;
	
	
	@Override
	public void sboard_create(sBoardVO sboard_vo) throws Exception {
		// TODO Auto-generated method stub
		sboard_dao.sboard_create(sboard_vo);
	}

	@Override
	public List<sBoardVO> sboard_list(int cno) throws Exception {
		// TODO Auto-generated method stub
		return 	sboard_dao.sboard_list(cno);
	}
	
	@Transactional
	@Override
	public void sboard_update(sBoardVO sboard_vo) throws Exception {
		// TODO Auto-generated method stub
		sboard_dao.sboard_update(sboard_vo);
		
		/*String sb_picture = sboard_vo.getSb_picture();
		if(sb_picture == null){
			return;
		}
			sboard_dao.sboard_create(sb_picture, sboard_vo.getSb_picture());*/
	}

	@Override
	public void sboard_delete(int sb_no) throws Exception {
		// TODO Auto-generated method stub
		sboard_dao.sboard_delete(sb_no);
	}

	@Override
	public sBoardVO sboard_detail(int sb_no) throws Exception {
		// TODO Auto-generated method stub
		return sboard_dao.sboard_detail(sb_no);
	}

	@Override
	public String sboard_detail_picture(int sb_no) throws Exception {
		// TODO Auto-generated method stub
		return sboard_dao.sboard_detail_picture(sb_no);
	}

	@Override
	public String sboard_member_name(int sb_no) throws Exception {
		// TODO Auto-generated method stub
		return sboard_dao.sboard_member_name(sb_no);
	}

}

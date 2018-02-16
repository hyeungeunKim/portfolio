package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.StatusVO;
import kr.co.domain.sListVO;
import kr.co.persistence.sListDAO;

@Service
public class sListServiceImpl implements sListService {
	
	@Inject
	private sListDAO sList_dao;
	
	@Override
	public sListVO slist_list(int cno) throws Exception {
		// TODO Auto-generated method stub
		return sList_dao.slist_list(cno);
	}

	@Override
	public List<sListVO> slist_tab_list(int cno) throws Exception {
		// TODO Auto-generated method stub
		return sList_dao.slist_tab_list(cno);
	}

	@Override
	public void update_s_join_cnt(int sl_no) throws Exception {
		// TODO Auto-generated method stub
		sList_dao.update_s_join_cnt(sl_no);
		
	}

	@Override
	public void join_sList_insert(int cno, int sl_no, String mid) throws Exception {
		// TODO Auto-generated method stub
		sList_dao.join_sList_insert(cno, sl_no, mid);
		
	}

	@Override
	public List<StatusVO> join_sList_select(int sl_no) throws Exception {
		// TODO Auto-generated method stub
		return sList_dao.join_sList_select(sl_no);
	}

	@Override
	public List<StatusVO> join_sList_member(int cno) throws Exception {
		// TODO Auto-generated method stub
		return sList_dao.join_sList_member(cno);
	}

	@Override
	public void slist_create(sListVO slistVo) {
		// TODO Auto-generated method stub
		sList_dao.slist_create(slistVo);
	}

	@Override
	public void update_slist_member(int sl_no) {
		// TODO Auto-generated method stub
		sList_dao.update_slist_member(sl_no);
		
	}

	@Override
	public void delete_slist_member(int sl_no, String mid) {
		// TODO Auto-generated method stub
		sList_dao.delete_slist_member(sl_no, mid);
	}

		@Override
	public sListVO slistBySlno(int sl_no) {
		// TODO Auto-generated method stub
		return sList_dao.slistBySlno(sl_no);
	}

	@Override
	public void slist_update(sListVO slistVo) {
		// TODO Auto-generated method stub
		sList_dao.slist_update(slistVo);
	}

	@Override
	public void slist_delete(int sl_no) {
		// TODO Auto-generated method stub
		sList_dao.slist_delete(sl_no);
	}
	
}

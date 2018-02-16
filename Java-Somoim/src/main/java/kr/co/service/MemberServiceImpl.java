package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.MemberVO;
import kr.co.persistence.MemberDAO;
import kr.co.persistence.Visitor;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	MemberDAO dao;
	@Inject
	Visitor visit_dao;
	
	@Override
	public void member_join(MemberVO member_vo) throws Exception {
		
		dao.member_join(member_vo);
	}
	
	@Override
	public MemberVO member_login(MemberVO member_vo) throws Exception {
		return dao.member_login(member_vo);
	}

	@Override
	public MemberVO member_select(MemberVO member_vo) throws Exception {
		return dao.member_select(member_vo);
	}

	@Override
	public List<MemberVO> member_tab_list(int cno) throws Exception {
		// TODO Auto-generated method stub
		return dao.member_tab_list(cno);
	}
	@Transactional
	@Override
	public void update_visit(String date) throws Exception {
		// TODO Auto-generated method stub
		int check=visit_dao.visitday_check(date);
		if(check == 0){
			visit_dao.insert_visit();
		}else{
			visit_dao.update_visit(date);
		}
		
		
	}
	

}

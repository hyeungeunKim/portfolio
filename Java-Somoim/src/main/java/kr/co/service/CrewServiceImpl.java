package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;
import kr.co.domain.MemberVO;
import kr.co.persistence.CrewDAO;
import kr.co.persistence.sListDAO;

@Service
public class CrewServiceImpl implements CrewService {

	@Inject
	CrewDAO crew_dao;
	
	@Override
	public List<CrewVO> crew_list(Criteria cri, String mid) throws Exception {
		// TODO Auto-generated method stub
		return crew_dao.crew_list(cri, mid);
	}

	@Override
	public CrewVO crew_tab_list(int cno) throws Exception {
		// TODO Auto-generated method stub
		return crew_dao.crew_tab_list(cno);
	}

	@Override
	public void crew_update_role(int cno, String mid) throws Exception {
		// TODO Auto-generated method stub
		crew_dao.crew_update_role(cno, mid);
		
	}
	
	@Override
	public int getCno() throws Exception {
		return crew_dao.getCno();
	}
	
	@Transactional
	@Override
	public void crew_create(CrewVO crew_vo) throws Exception {
		// TODO Auto-generated method stub
		crew_dao.crew_create(crew_vo);
		crew_dao.join_Crew(getCno(), crew_vo.getMid());
		
		String files = crew_vo.getFiles();
		
		if(files == null){
			return;
		}
		String fullName = files;
		crew_dao.addAttach(fullName, crew_vo.getCno());
		
	}
	
	@Transactional
	@Override
	public void join_Crew(int cno, String mid) {
		// TODO Auto-generated method stub
		crew_dao.join_Crew(cno, mid);
		crew_dao.update_join_cnt(cno);
	}

	@Override
	public void crew_delete_role(int cno) throws Exception {
		// TODO Auto-generated method stub
		crew_dao.crew_delete_role(cno);
	}

	@Override
	public void update_crew_cnt(int cno) throws Exception {
		// TODO Auto-generated method stub
		crew_dao.update_crew_cnt(cno);
	}
	
	@Transactional
	@Override
	public void delete_crewMember(int cno, String mid) {
		// TODO Auto-generated method stub
		crew_dao.crewJoincntSub(cno);
		crew_dao.slistJoincntSub(cno, mid);
		crew_dao.deleteStatus(cno, mid);
	}

	@Override
	public MemberVO memberDetail(String mid) {
		// TODO Auto-generated method stub
		return crew_dao.memberDetail(mid);
	}

	@Override
	public List<CrewVO> memberCrewList(String mid) {
		// TODO Auto-generated method stub
		return crew_dao.memberCrewList(mid);
	}

}

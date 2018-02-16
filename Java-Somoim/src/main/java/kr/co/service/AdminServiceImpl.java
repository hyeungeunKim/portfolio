package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.CrewVO;
import kr.co.domain.MemberVO;
import kr.co.domain.VisitorVO;
import kr.co.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	AdminDAO admin_dao;
	
	@Override
	public MemberVO memberInfo(String mid) throws Exception {
		// TODO Auto-generated method stub
		return admin_dao.memberInfo(mid);
	}

	@Override
	public int memberCnt() throws Exception {
		// TODO Auto-generated method stub
		return admin_dao.memberCnt();
	}

	@Override
	public int crewCnt() throws Exception {
		// TODO Auto-generated method stub
		return admin_dao.crewCnt();
	}

	@Override
	public List<CrewVO> crewMemberCnt() throws Exception {
		// TODO Auto-generated method stub
		return admin_dao.crewMemberCnt();
	}
	
	@Override
	public List<MemberVO> memberList() throws Exception {
		// TODO Auto-generated method stub
		return admin_dao.memberList();
	}

	@Override
	public int visitorCnt() throws Exception {
		// TODO Auto-generated method stub
		return admin_dao.visitorCnt();
	}

	@Override
	public List<VisitorVO> visitorList() throws Exception {
		// TODO Auto-generated method stub
		return admin_dao.visitorList();
	}

	@Override
	public void crewDelete(int cno) throws Exception {
		// TODO Auto-generated method stub
		admin_dao.crewDelete(cno);
	}

	@Transactional
	@Override
	public void memberDelete(String mid) throws Exception {
		// TODO Auto-generated method stub
		// 트렌젝션 처리
		admin_dao.slistJoincntUpdate(mid);
		admin_dao.crewJoincntUpdate(mid);
		admin_dao.chattingMidUpdate(mid);
		admin_dao.sboardDeleteByMid(mid);
		admin_dao.sgalleryDeleteByMid(mid);
		// 실제 회원 탈퇴
		admin_dao.memberDelete(mid);
	}

}

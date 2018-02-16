package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;
import kr.co.domain.JoinSlistVO;
import kr.co.domain.MemberVO;
import kr.co.persistence.AdminDAO;
import kr.co.persistence.SettingDAO;

@Service
public class SettingServiceImpl implements SettingService {

	@Inject
	SettingDAO setting_dao;
	
	@Inject
	AdminDAO admin_dao;
	
	@Override
	public MemberVO memberInfo(String mid) throws Exception {
		// TODO Auto-generated method stub
		return setting_dao.memberInfo(mid);
	}

	@Override
	public List<CrewVO> openCrew(Criteria cri, String mid) throws Exception {
		// TODO Auto-generated method stub
		return setting_dao.openCrew(cri, mid);
	}

	@Override
	public List<CrewVO> joinCrew(Criteria cri, String mid) throws Exception {
		// TODO Auto-generated method stub
		return setting_dao.joinCrew(cri, mid);
	}

	@Override
	public List<JoinSlistVO> joinSlist(Criteria cri, String mid) throws Exception {
		// TODO Auto-generated method stub
		return setting_dao.joinSlist(cri, mid);
	}

	@Override
	public void memberUpdate(MemberVO member_vo) throws Exception {
		// TODO Auto-generated method stub
		setting_dao.memberUpdate(member_vo);
	}

	@Transactional
	@Override
	public void memberDelete(String mid) throws Exception {
		// TODO Auto-generated method stub
		admin_dao.slistJoincntUpdate(mid);
		admin_dao.crewJoincntUpdate(mid);
		admin_dao.chattingMidUpdate(mid);
		admin_dao.sboardDeleteByMid(mid);
		admin_dao.sgalleryDeleteByMid(mid);
		
		setting_dao.memberDelete(mid);
	}

}

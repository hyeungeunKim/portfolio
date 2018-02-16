package kr.co.service;

import java.util.List;

import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;
import kr.co.domain.JoinSlistVO;
import kr.co.domain.MemberVO;

public interface SettingService {
	public abstract MemberVO memberInfo(String mid) throws Exception;
	public abstract List<CrewVO> openCrew(Criteria cri, String mid) throws Exception;
	public abstract List<CrewVO> joinCrew(Criteria cri, String mid) throws Exception;
	public abstract List<JoinSlistVO> joinSlist(Criteria cri, String mid) throws Exception;
	public abstract void memberUpdate(MemberVO member_vo) throws Exception;
	public abstract void memberDelete(String mid) throws Exception;

}

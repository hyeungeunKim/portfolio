package kr.co.service;

import java.util.List;

import kr.co.domain.CrewVO;
import kr.co.domain.MemberVO;
import kr.co.domain.VisitorVO;

public interface AdminService {
	public abstract MemberVO memberInfo(String mid) throws Exception;
	public abstract int memberCnt() throws Exception;
	public abstract int crewCnt() throws Exception;
	public abstract List<CrewVO> crewMemberCnt() throws Exception;
	public abstract List<MemberVO> memberList() throws Exception;
	public abstract int visitorCnt() throws Exception;
	public abstract List<VisitorVO> visitorList() throws Exception;
	
	// 삭제
	public abstract void crewDelete(int cno) throws Exception;
	public abstract void memberDelete(String mid) throws Exception;

}

package kr.co.persistence;

import java.util.List;

import kr.co.domain.CrewVO;
import kr.co.domain.MemberVO;
import kr.co.domain.VisitorVO;

public interface AdminDAO {
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
	// 회원삭제 시 트렌젝션
	public abstract void slistJoincntUpdate(String mid) throws Exception;
	public abstract void crewJoincntUpdate(String mid) throws Exception;
	public abstract void chattingMidUpdate(String mid) throws Exception;
	public abstract void sboardDeleteByMid(String mid) throws Exception;
	public abstract void sgalleryDeleteByMid(String mid) throws Exception;

}
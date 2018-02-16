package kr.co.service;

import java.util.List;

import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;
import kr.co.domain.MemberVO;

public interface CrewService {
	public abstract List<CrewVO> crew_list(Criteria cri, String mid) throws Exception;
	public abstract CrewVO crew_tab_list(int cno) throws Exception;
	public abstract	void crew_update_role(int cno, String mid)throws Exception;
	public abstract	void crew_create(CrewVO crew_vo)throws Exception;
	public abstract	int getCno()throws Exception;
	public abstract void join_Crew(int cno,String mid);
	public abstract void crew_delete_role(int cno) throws Exception;
	public abstract void update_crew_cnt(int cno) throws Exception;
	public abstract void delete_crewMember(int cno, String mid);
	public abstract MemberVO memberDetail(String mid);
	public abstract List<CrewVO> memberCrewList(String mid);

}

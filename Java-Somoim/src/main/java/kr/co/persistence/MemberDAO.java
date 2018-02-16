package kr.co.persistence;

import java.util.List;

import kr.co.domain.MemberVO;

public interface MemberDAO {
	
	public abstract void member_join(MemberVO member_vo) throws Exception;
	public abstract MemberVO member_login(MemberVO member_vo) throws Exception;
	public abstract MemberVO member_select(MemberVO member_vo) throws Exception;
	public abstract List<MemberVO> member_tab_list(int cno)throws Exception;
	
}

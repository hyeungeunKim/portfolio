package kr.co.persistence;

import java.util.List;

import kr.co.domain.MemberVO;

public interface AroundDAO {
	public abstract MemberVO memberInfo(String mid) throws Exception;
	public abstract List<MemberVO> member_list(String mid, String address) throws Exception;
}

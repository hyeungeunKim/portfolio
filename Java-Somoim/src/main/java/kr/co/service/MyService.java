package kr.co.service;

import java.util.List;

import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;

public interface MyService {
	public abstract List<CrewVO> crew_sel_list(Criteria cri, String mid) throws Exception;
	public abstract List<CrewVO> attend_crew_list(String mid) throws Exception;

}

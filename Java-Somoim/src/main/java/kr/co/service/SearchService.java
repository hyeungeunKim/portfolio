package kr.co.service;

import java.util.List;

import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;

public interface SearchService {
	public abstract List<CrewVO> searchCrew(Criteria cri, String mid, String searchType, String keyword) throws Exception;

}

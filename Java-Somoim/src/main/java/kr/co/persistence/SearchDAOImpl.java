package kr.co.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;

@Repository
public class SearchDAOImpl implements SearchDAO {

	private final String NAMESPACE = "kr.co.mapper.SearchMapper";

	@Inject
	private SqlSession session;

	@Override
	public List<CrewVO> searchCrew(Criteria cri, String mid, String searchType, String keyword) throws Exception {
		// TODO Auto-generated method stub
		if(searchType == null) {
			searchType = "title";
		} 
		if(keyword == null) {
			keyword = "";
		} 
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cri", cri);
		map.put("mid", mid);
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		return session.selectList(NAMESPACE+".searchCrew", map);
	}
	
}

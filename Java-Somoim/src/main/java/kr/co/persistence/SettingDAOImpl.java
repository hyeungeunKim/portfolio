package kr.co.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;
import kr.co.domain.JoinSlistVO;
import kr.co.domain.MemberVO;

@Repository
public class SettingDAOImpl implements SettingDAO {

	private final String NAMESPACE = "kr.co.mapper.SettingMapper";

	@Inject
	private SqlSession session;
	
	@Override
	public MemberVO memberInfo(String mid) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE+".memberInfo", mid);
	}

	@Override
	public List<CrewVO> openCrew(Criteria cri, String mid) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cri", cri);
		map.put("mid", mid);
		return session.selectList(NAMESPACE+".openCrew", map);
	}

	@Override
	public List<CrewVO> joinCrew(Criteria cri, String mid) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cri", cri);
		map.put("mid", mid);
		return session.selectList(NAMESPACE+".joinCrew", map);
	}

	@Override
	public List<JoinSlistVO> joinSlist(Criteria cri, String mid) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cri", cri);
		map.put("mid", mid);
		return session.selectList(NAMESPACE+".joinSlist", map);
	}

	@Override
	public void memberUpdate(MemberVO member_vo) throws Exception {
		session.update(NAMESPACE+".memberUpdate", member_vo);
	}

	@Override
	public void memberDelete(String mid) throws Exception {
		// TODO Auto-generated method stub
		session.delete(NAMESPACE+".memberDelete", mid);
	}

}

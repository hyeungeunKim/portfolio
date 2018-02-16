package kr.co.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.MemberVO;

@Repository
public class AroundDAOImpl implements AroundDAO {
	
	private final String NAMESPACE = "kr.co.mapper.AroundMapper";

	@Inject
	private SqlSession session;

	@Override
	public MemberVO memberInfo(String mid) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE+".memberInfo", mid);
	}

	@Override
	public List<MemberVO> member_list(String mid, String address) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("mid", mid);
		map.put("address", address);
		return session.selectList(NAMESPACE+".member_list", map);
	}

}
